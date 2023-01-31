-- Active: 1675071918474@@127.0.0.1@55000@postgres
CREATE TABLE cars (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(24) NOT  NULL,
    colors VARCHAR[]
);

INSERT INTO cars (name, colors) VALUES ('BMW', '{"black", "white"}');
INSERT INTO cars (name, colors) VALUES ('Mercedes', array['red', 'black']);

SELECT * FROM cars;

SELECT
    name,
    colors[1]
FROM cars;

SELECT
    name,
    colors
FROM
    cars
WHERE
    'black' = any(colors)
;

UPDATE
    cars
SET colors = array['white']
WHERE id=3;
