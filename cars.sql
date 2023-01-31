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

SELECT array_append(array['A', 'B'], 'C');
SELECT array_prepend('C', array['A', 'B']);
SELECT array_position(array['A', 'B', 'C'], 'C');
SELECT array_remove(array['A', 'B', 'C'], 'B');

colors = array_remove(colors, 'black');
