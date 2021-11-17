\i T07.sql

CREATE TRIGGER _t_noManagingEngineers
BEFORE INSERT OR UPDATE ON Engineers
FOR EACH ROW
EXECUTE FUNCTION noManagingEngineers();

CREATE OR REPLACE FUNCTION noManagingEngineers()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT * FROM Managers WHERE eid = NEW.eid) IS NOT NULL THEN 
        RAISE NOTICE '% is a manager', NEW.eid; 
        RETURN NULL;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER _t_budget
BEFORE INSERT OR UPDATE ON Works
FOR EACH ROW
EXECUTE FUNCTION budget();

CREATE OR REPLACE FUNCTION budget()
RETURNS TRIGGER AS $$
DECLARE
    total INT := 0;
    increment INT := NEW.hours;
    maxH INT := 0;
BEGIN
    SELECT sum(hours) INTO total FROM Works
    WHERE pid = NEW.pid
    GROUP BY pid;

    IF total IS NULL THEN total := 0;
    END IF;

    SELECT pbudget INTO maxH FROM Projects WHERE pid = NEW.pid;
    maxH := maxH / 100;

    IF (total > maxH) THEN RETURN NULL;
    ELSIF (TG_OP = 'UPDATE') THEN maxH := maxH + OLD.hours;
    END IF;

    IF ((total + increment) > maxH)
        THEN NEW.hours := GREATEST(0, maxH - total);
    END IF;    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER _t_maxWork
BEFORE INSERT OR UPDATE ON Works
FOR EACH ROW
EXECUTE FUNCTION maxWork();

CREATE OR REPLACE FUNCTION maxWork()
RETURNS TRIGGER AS $$
DECLARE 
    maxH INT := 0;
BEGIN
    SELECT max_hours INTO maxH FROM WorkType WHERE wid = NEW.wid;
    IF maxH < NEW.hours 
        THEN NEW.hours := maxH;
        RAISE NOTICE 'Triggered';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER _t_defaultMod
BEFORE UPDATE OR DELETE ON WorkType
FOR EACH ROW WHEN (OLD.wid = 0)
EXECUTE FUNCTION defaultMod();

CREATE OR REPLACE FUNCTION defaultMod()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Modifying default';
    RETURN NULL;
END;
$$ LANGUAGE plpgsql