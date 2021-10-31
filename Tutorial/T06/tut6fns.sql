CREATE OR REPLACE FUNCTION max_min (IN stu_id INT, OUT max_cid INT, 
    OUT min_cid INT)
RETURNS RECORD AS $$
DECLARE
    max_score INT; 
    min_score INT;
BEGIN
    SELECT e1.score, e1.cid INTO max_score, max_cid
    FROM Exams e1
    WHERE e1.sid = stu_id
    AND score >= ALL (
        SELECT score FROM Exams e2
        WHERE e2.sid = e1.sid
    )
    LIMIT 1;

    SELECT e1.score, e1.cid INTO min_score, min_cid
    FROM Exams e1
    WHERE e1.sid = stu_id
    AND e1.score <= ALL (
        SELECT score FROM Exams e2
        WHERE e2.sid = stu_id
    )
    AND e1.score < max_score
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION revised_avg (IN stu_id INT , OUT r_avg
FLOAT) 
RETURNS FLOAT AS $$
DECLARE
    total INT;
    cnt INT;
    highest INT := 0;
BEGIN
    SELECT SUM(score), COUNT(*) INTO total, cnt
    FROM Exams
    WHERE sid = stu_id;
    
    IF cnt >= 3 THEN 
        total := total - (
            SELECT e1.score
            FROM Exams e1 JOIN max_min(stu_id) e2
                ON e2.max_cid = e1.cid
            WHERE e1.sid = stu_id
        ) - (
            SELECT e3.score
            FROM Exams e3 JOIN max_min(stu_id) e2
                ON e2.min_cid = e3.cid
            WHERE e3.sid = stu_id
        );
        cnt := cnt - 2;
        r_avg := CAST(total AS FLOAT) / cnt;
    END IF;
END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION list_r_avg()
RETURNS TABLE (stu_id INT , ravg FLOAT) AS $$ 
DECLARE 
    curs CURSOR FOR (
        SELECT sid, score
        FROM Exams
        ORDER BY sid, score
    );
    small INT;
    big INT;
    cnt INT;
    total INT;
    r1 RECORD;
BEGIN
    OPEN curs;
    FETCH curs INTO r1;
    IF NOT FOUND THEN RETURN;
    END IF;
    RAISE NOTICE '%', r1;
    stu_id := r1.sid;
    small := r1.score;
    cnt := 1;
    total := small;
    LOOP
        FETCH curs INTO r1;
        EXIT WHEN NOT FOUND;
        IF (r1.sid <> stu_id) THEN
            IF cnt >= 3 THEN
                RAISE NOTICE '%,%,%,%', total,big,small,cnt;
                ravg := (total - big - small) / (cnt - 2);
            END IF;
            RETURN NEXT;
            stu_id := r1.sid;
            small := r1.score;
            cnt := 1;
            total := small;
            ravg := null;
            CONTINUE;
        END IF;
        cnt := cnt + 1;
        big := r1.score;
        total := total + r1.score;
    END LOOP;
    CLOSE curs;
    RETURN;
END;
$$ LANGUAGE plpgsql;

-- Q4
CREATE OR REPLACE FUNCTION list_scnd_highest ()
RETURNS TABLE (stu_id INT , scnd_highest INT) AS $$
DECLARE 
    curs CURSOR FOR (
        SELECT sid, score
        FROM Exams
        ORDER BY sid, score DESC
    );
    r1 RECORD;
    cnt INT;
BEGIN
OPEN curs;
FETCH curs INTO r1;
IF NOT FOUND THEN RETURN;
END IF;
stu_id := r1.sid;
cnt := 1;
LOOP
    cnt := cnt + 1;
    FETCH curs INTO r1;
    EXIT WHEN NOT FOUND;
    IF r1.sid <> stu_id THEN 
        return NEXT;
        stu_id := r1.sid;
        cnt := 1;
        scnd_highest := null;
        CONTINUE;
    ELSIF cnt = 2 THEN scnd_highest := r1.score;
    END IF;
END LOOP;
CLOSE curs;
END
$$ LANGUAGE plpgsql;