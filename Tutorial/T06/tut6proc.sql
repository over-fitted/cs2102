\i tut6data.sql
\i tut6fns.sql


INSERT INTO Exams VALUES
  (1,3,5),
  (1,1,7),
  (1,2,1),
  (2,1,3),
  (2,3,3),
  (3,1,5),
  (4,2,6),
  (4,3,9),
  (4,1,9),
  (4,4,8),
  (5,1,10),
  (5,3,6);

-- SELECT * FROM max_min(1);
SELECT * FROM revised_avg(1);
SELECT * FROM revised_avg(4);
SELECT * FROM list_r_avg();
SELECT * FROM list_scnd_highest();