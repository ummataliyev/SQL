-- Active: 1674727167434@@127.0.0.1@55000@postgres
CREATE TABLE table_a (
    a_id SERIAL NOT NULL PRIMARY KEY,
    a_content VARCHAR(1)
);

CREATE TABLE table_b (
    b_id SERIAL NOT NULL PRIMARY KEY,
    b_content VARCHAR(1),
    a_id INT NOT NULL REFERENCES table_a(a_id)
);

INSERT INTO table_a(a_content) VALUES (1), (2), (3);

INSERT INTO table_b(b_content, a_id) VALUES ('a', 1), ('b', 1), ('c', 2);

SELECT * FROM table_a;

SELECT * FROM table_b;

SELECT
    a.*
FROM table_a AS a
LEFT JOIN table_b AS b ON a.a_id = b.a_id;

CREATE TABLE basket_a (
    a INT PRIMARY KEY,
    fruit_a VARCHAR (100) NOT NULL
);

CREATE TABLE basket_b (
    b INT PRIMARY KEY,
    fruit_b VARCHAR (100) NOT NULL
);

INSERT INTO basket_a (a, fruit_a)
VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');

INSERT INTO basket_b (b, fruit_b)
VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');


--INNER JOIN
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
INNER JOIN basket_b
    ON fruit_a = fruit_b;

--LEFT OUTER JOIN
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
LEFT JOIN basket_b 
   ON fruit_a = fruit_b;

--LEFT OUTER JOIN - only rows from the left table
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
LEFT JOIN basket_b 
    ON fruit_a = fruit_b
WHERE b IS NULL;

--RIGTH OUTER JOIN
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
RIGHT JOIN basket_b ON fruit_a = fruit_b;

--RIGTH OUTER JOIN - only rows from the righ TABLE
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
RIGHT JOIN basket_b 
   ON fruit_a = fruit_b
WHERE a IS NULL;

--FULL OUTER JOIN
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
FULL OUTER JOIN basket_b 
    ON fruit_a = fruit_b;

--FULL OUTER JOIN - only rows unique to both tables
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
FULL JOIN basket_b 
   ON fruit_a = fruit_b
WHERE a IS NULL OR b IS NULL;