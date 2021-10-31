DROP TABLE IF EXISTS Exams CASCADE;

CREATE TABLE Exams (
    sid INT,
    cid INT,
    score INT,
    PRIMARY KEY(sid, cid)
);