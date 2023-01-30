-- Active: 1674727167434@@127.0.0.1@55000@postgres
DROP TABLE IF EXISTS components CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS types CASCADE;
DROP TABLE IF EXISTS type_register CASCADE;
DROP TABLE IF EXISTS tables CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS ingredients CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS order_details CASCADE;

CREATE TABLE components (
component_id SERIAL PRIMARY KEY,
name VARCHAR(32) NOT NULL
);

CREATE TABLE categories (
category_id SERIAL NOT NULL PRIMARY KEY,
name VARCHAR(64) NOT NULL
);

CREATE TABLE types (
type_id SERIAL NOT NULL PRIMARY KEY,
name VARCHAR(24) NOT NULL
);

CREATE TABLE type_register (
    type_register_id SERIAL NOT NULL PRIMARY KEY,
    category_id INT NOT NULL REFERENCES categories(category_id),
    type_id INT NOT NULL REFERENCES types(type_id)
);

CREATE TABLE tables (
table_id SERIAL NOT NULL PRIMARY KEY,
number INT2 NOT NULL
);

CREATE TABLE products (
product_id SERIAL NOT NULL PRIMARY KEY,
name VARCHAR(64) NOT NULL,
price DECIMAL(16,2) NOT NULL,
type_register_id INT NOT NULL REFERENCES type_register(type_register_id)
);

CREATE TABLE ingredients (
ingredient_id SERIAL NOT NULL PRIMARY KEY,
product_id INT NOT NULL REFERENCES products(product_id),
component_id INT NOT NULL REFERENCES components(component_id),
weight INT2 NOT NULL
);

CREATE TABLE orders (
order_id SERIAL NOT NULL PRIMARY KEY,
table_id INT NOT NULL REFERENCES tables(table_id),
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
closed_at TIMESTAMP WITH TIME ZONE DEFAULT NULL
);

CREATE TABLE order_details (
order_detail_id SERIAL NOT NULL PRIMARY KEY,
quantity INT2 DEFAULT 1,
order_id INT NOT NULL REFERENCES orders(order_id),
product_id INT NOT NULL REFERENCES products(product_id)
);

COMMENT ON TABLE components is 'Raw materials';
COMMENT ON TABLE categories is 'Products category';
COMMENT ON TABLE types is 'Products types';
COMMENT ON TABLE type_register is 'Register type';
COMMENT ON TABLE tables is 'Tables';
COMMENT ON TABLE products is 'Finished products';
COMMENT ON TABLE ingredients is 'Recieps';
COMMENT ON TABLE orders is 'Orders';
COMMENT ON TABLE order_details is 'Order details';

--Inserts
INSERT INTO components(name) VALUES ('Potato'), ('Carrot'), ('Rice'), ('Onion'), ('Cucumber');

INSERT INTO categories(name) VALUES ('National foods'), ('Europe foods'), ('Drinks');

INSERT INTO types(name) VALUES ('Dark foods'), ('Liquid foods'), ('Cold drinks'), ('Hot drinks'), ('Energetic');

INSERT INTO type_register(category_id, type_id) VALUES
(1, 1), (1, 2), (1, 3),
(2, 3),
(3, 4),
(3, 5),
(3, 6);

INSERT INTO tables (number) VALUES (101), (102), (103), (104);

INSERT INTO products (name, price, type_register_id) VALUES
('Plov', 16000, 1),
("Mastava", 12000, 2),
('Olivie', 18000, 4),
('Coca-Cola', 5000, 5),
('Moxito', 11000, 5),
('Choy', 3000, 6),
('Limon choy', 5000, 6),
('Red-Bull 500ml', 28000, 7);


SELECT
    sum(d.quantitiy) AS quantitiy,
    p.name,
    p.type_register_id
FROM
    order_details AS d
JOIN
    products AS p using(product_id)
GROUP BY
    d.product_id,
    p.type_register_id,
    p.name
ORDER BY
    p.type_register_id,
    quantity DESC
;

SELECT
    ROW_NUMBER()
    d.*
FROM
    order_dertails AS d 
WHERE d.qunatity <>2
;

SELECT
    ROW_NUMBER() OVER(ORDER BY product_id DESC) * product_id AS x,
    y.*
FROM product AS y;
