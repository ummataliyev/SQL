-- Active: 1674727167434@@127.0.0.1@55000@postgres
DROP TABLE IF EXISTS components;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS types;
DROP TABLE IF EXISTS type_register;
DROP TABLE IF EXISTS tables;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_details;

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