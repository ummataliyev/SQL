-- Active: 1675339339669@@127.0.0.1@55000@postgres
CREATE TABLE elements (
    id SERIAL NOT NULL PRIMARY KEY,
    data CHAR(1)
);

CREATE TABLE object (
    id SERIAL NOT NULL PRIMARY KEY,
    data CHAR(1)
);

INSERT INTO elements (data) VALUES ('A'), ('B'), ('C');
INSERT INTO object (data) VALUES ('A'), ('B'), ('C'), ('D'), ('E');

SELECT * FROM elements
UNION ALL
SELECT * FROM object
ORDER BY id;

SELECT
    o1.id AS o1_id,
    o1.data AS o1,
    o2.id AS o2_id,
    o2.data AS o2
FROM object AS o1
JOIN object AS o2 ON TRUE
;

