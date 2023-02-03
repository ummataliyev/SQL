-- Active: 1675339339669@@127.0.0.1@55000@postgres
CREATE TABLE cars (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(24) NOT  NULL,
    colors VARCHAR[]
);

CREATE OR REPLACE PROCEDURE fn()
RETURNS my_row
LANGUAGE PLPGSQL AS
$$
    BEGIN
        INSERT INTO cars(name) VALUES ('A');
        INSERT INTO cars(name) VALUES ('B');
        INSERT INTO cars(name) VALUES ('C');

        COMMIT;

        INSERT INTO cars(name) VALUES ('D');
        INSERT INTO cars(name) VALUES ('E');
        INSERT INTO cars(name) VALUES ('F');

        ROLLBACK;
    END;
$$;

--TRANSACTION
BEGIN WORK
    SELECT 1;
END
sender, receiver, amount

call payment(1, 2, 10000);

SELECT
    CASE 2
        WHEN 2 THEN 'Two'
        WHEN 3 THEN 'Three'
        ELSE 'Null'
    END;

SELECT CASE WHEN (SELECT count(*) FROM x) > 100 then 'OK' ELSE NULL END;

CREATE TYPE summa AS VARCHAR(20);
CREATE TYPE gender AS enum('male', 'female');

CREATE TYPE my_row AS (
    id INT,
    name  VARCHAR
);

CREATE DOMAIN valid_name AS VARCHAR(20) not NULL;

CREATE TABLE accounts (
    id SERIAL NOT NULL PRIMARY KEY,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    gender gender,
    balance DECIMAL(16, 2) NULL
);

CREATE FUNCTION f1()
RETURNS product%rowtype
LANGUAGE PLPGSQL AS
$$
    BEGIN
        RETURN query SELECT * FROM products;
    END;
$$;

-- returns table (like products)
-- retunrs setof products
