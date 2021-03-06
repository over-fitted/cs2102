CREATE OR REPLACE FUNCTION max_min (IN stu_id INT, OUT max_cid INT, 
    OUT min_cid INT)
RETURNS RECORD AS $$
DECLARE
    max_score INT; 
    min_score INT;
BEGIN
    SELECT e1.score INTO max_score
    FROM Exams e1
    WHERE e1.sid = stu_id
    AND score >= ALL (
        SELECT score FROM Exams e2
        WHERE e2.sid = e1.sid
    );

    SELECT cid into max_cid
    FROM Exams
    WHERE sid = stu_id
    AND score = max_score
    LIMIT 1;

    SELECT e2.score INTO min_score
    FROM Exams e1
    WHERE e1.sid = stu_id
    AND score <= ALL (
        SELECT score FROM Exams e2
        WHERE e2.sid = e1.sid
    );

    SELECT cid into min_cid
    FROM Exams
    WHERE sid = stu_id
    AND score = min_score
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
            WHERE sid = stu_id
        ) - (
            SELECT e3.score
            FROM Exams e3 JOIN max_min(stu_id) e2
                ON e2.min_cid = e3.cid
            WHERE sid = stu_id
            AND e3.cid = stu_id
        );
        cnt := cnt - 2;
        r_avg := CAST(total AS FLOAT) / cnt;
    END IF;
END
$$
LANGUAGE plpgsql;

-- CREATE OR REPLACE FUNCTION list_r_avg()
-- RETURNS TABLE (stu_id INT , ravg FLOAT) AS $$ 
-- DECLARE 
--     curs CURSOR FOR (
--         SELECT sid, score
--         FROM Exams
--         ORDER BY sid
--     );
-- BEGIN
-- /* write
-- your code here */
-- END;
-- $$
-- LANGUAGE plpgsql;
