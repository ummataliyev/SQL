-- Active: 1674727167434@@127.0.0.1@55000@postgres
CREATE TABLE categories (
    category_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(24) NOT NULL
);

CREATE TABLE tables (
    table_id SERIAL NOT NULL PRIMARY KEY,
    number INT2 NOT NULL
);

CREATE TABLE products (
    product_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    price DECIMAL(16,2) NOT NULL,
    category_id INT NOT NULL REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id SERIAL NOT NULL PRIMARY KEY,
    table_id INT NOT NULL REFERENCES tables(table_id),
    created_at TIMESTAMP WITH TIME zone DEFAULT CURRENT_TIMESTAMP,
    closed_at TIMESTAMP WITH TIME zone DEFAULT NULL
);

CREATE TABLE order_details (
    order_detail_id SERIAL NOT NULL PRIMARY KEY,
    quantity INT2 DEFAULT 1,
    order_id INT NOT NULL REFERENCES orders(order_id),
    product_id  INT NOT NULL REFERENCES products(product_id)
);

CREATE TABLE components (
    component_id SERIAL NOT NULL REFERENCES PRIMARY KEY,
    name VARCHAR(32) NOT NULL
)