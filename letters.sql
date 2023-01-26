-- Active: 1674152866305@@127.0.0.1@55000@postgres
CREATE TABLE letters (
    id SERIAL NOT NULL PRIMARY KEY,
    l VARCHAR(1) NOT NULL
);

INSERT INTO letters(l) VALUES ('a'), ('b'), ('c'), ('d'), ('e'), ('f'), ('g'), ('h');

--for odd numbers
SELECT * FROM letters AS l1 WHERE (
    SELECT count(l2.id) %2 = 0 FROM letters AS l2 WHERE l2.id < l1.id
);

--for even numbers

SELECT * FROM letters AS l1 WHERE (
    SELECT count(l2.id) %2 != 0 FROM letters AS l2 WHERE l2.id < l1.id
);

SELECT count(l2.id) FROM letters AS l2;

SELECT count(l2.id) %2 = 0 FROM letters AS l2 WHERE l2.id <5;