-- Active: 1674152866305@@127.0.0.1@55000@postgres
CREATE TABLE elements(
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(24)
);

INSERT INTO elements (name) VALUES ('Apple'), ('Google'), ('Amazon'), ('Slack'), ('NASA');

SELECT * FROM elements;

SELECT
    *
FROM
    elements AS e
WHERE length(e.name) > 5
;

ALTER TABLE elements ADD COLUMN salary int;

UPDATE elements SET salary = 100;

UPDATE elements SET salary = 200 WHERE id  = 2;

UPDATE elements SET salary = 300 WHERE id  = 3;

UPDATE elements SET salary = 400 WHERE id  = 4;

UPDATE elements SET salary = 500 WHERE id  = 5;

SELECT
    *
FROM
    elements AS e
WHERE
    (
        SELECT e.id > 0
    );

UPDATE elements SET salary = 500 WHERE id  = 1;

UPDATE elements SET salary = 400 WHERE id  = 2;

UPDATE elements SET salary = 300 WHERE id  = 3;

UPDATE elements SET salary = 200 WHERE id  = 4;

UPDATE elements SET salary = 100 WHERE id  = 5;

SELECT e.*
FROM elements AS e
WHERE (SELECT sum(e2.salary) FROM elements AS e2 WHERE e2.id = e.id) >= 300;
