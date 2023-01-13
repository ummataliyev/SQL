-- Active: 1673182399012@@127.0.0.1@55000@myproject
CREATE DATABASE sql_learning;

CREATE TABLE users(
    user_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_name CHARACTER VARYING(20) NOT NULL,
    password CHARACTER VARYING(60) NOT NULL,
    first_name CHARACTER VARYING(20) NOT NULL,
    last_name CHARACTER VARYING(20) NULL,
    birth DATE NULL,
    gender BOOLEAN NULL,
    is_active BOOLEAN DEFAULT FALSE
);

CREATE TABLE contacts(
    user_id INT NOT NULL REFERENCES users(user_id),
    contact_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type INT2 NOT NULL,
    content CHARACTER VARYING(64)
);


CREATE TABLE products(
    product_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(32) NOT NULL
);

CREATE TABLE tables (
    table_id SERIAL NOT NULL PRIMARY KEY,
    number SMALLINT NOT NULL
);

CREATE TABLE orders (
    order_id SERIAL NOT NULL PRIMARY KEY,
    table_id INT NOT NULL REFERENCES tables (table_id),
    product_id INT NOT NULL REFERENCES products (product_id)
);
