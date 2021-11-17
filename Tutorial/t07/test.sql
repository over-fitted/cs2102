\i proc.sql

-- q1
INSERT INTO Offices VALUES (1, 'firstAdd');
INSERT INTO Departments VALUES (1,1,1,1);
INSERT INTO Employees VALUES (1,1);
INSERT INTO Managers VALUES (1);
INSERT INTO Engineers VALUES (1);

INSERT INTO Employees VALUES (2,1);
INSERT INTO Engineers VALUES (2);
INSERT INTO WorkType VALUES (0,10);
INSERT INTO Projects VALUES (1, 320, 1);
INSERT INTO WorkType VALUES (1, 2);
INSERT INTO Works VALUES(1,2,1,1);
SELECT * FROM Works;
UPDATE Works SET hours = 3 WHERE eid = 2;
UPDATE WorkType SET max_hours = 4 WHERE wid = 0;
UPDATE WorkType SET max_hours = 3 WHERE wid = 1;
DELETE FROM WorkType WHERE wid = 0;
SELECT * FROM Works;