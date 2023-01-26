-- Active: 1674727167434@@127.0.0.1@55000@postgres
CREATE TABLE components (
component_id SERIAL PRIMARY KEY,
name VARCHAR(32) NOT NULL
);

COMMENT ON TABLE components is 'Raw materials';

CREATE TABLE categories (
category_id SERIAL PRIMARY KEY,
name VARCHAR(64) NOT NULL
);

COMMENT ON TABLE categories is 'Products category';

CREATE TABLE types (
type_id SERIAL PRIMARY KEY,
name VARCHAR(24) NOT NULL
);

COMMENT ON TABLE types is 'Products types';

CREATE TABLE type_register (
    type_register_id SERIAL NOT NULL PRIMARY KEY,
    category_id INT NOT NULL REFERENCES categories(category_id),
    type_id INT NOT NULL REFERENCES types(type_id)
);

COMMENT ON TABLE type_register is 'Register type';

CREATE TABLE tables (
table_id SERIAL PRIMARY KEY,
number INT2 NOT NULL
);

COMMENT ON TABLE tables is 'Tables';

CREATE TABLE products (
product_id SERIAL PRIMARY KEY,
name VARCHAR(64) NOT NULL,
price DECIMAL(16,2) NOT NULL,
type_register_id INT NOT NULL REFERENCES type_register(type_register_id)
);

COMMENT ON TABLE products is 'Finished products';

CREATE TABLE ingredients (
ingredient_id SERIAL PRIMARY KEY,
product_id INT NOT NULL REFERENCES products(product_id),
component_id INT NOT NULL REFERENCES components(component_id),
weight INT2 NOT NULL
);

COMMENT ON TABLE ingredients is 'Recieps';

CREATE TABLE orders (
order_id SERIAL PRIMARY KEY,
table_id INT NOT NULL REFERENCES tables(table_id),
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
closed_at TIMESTAMP WITH TIME ZONE DEFAULT NULL
);

COMMENT ON TABLE orders is 'Orders';

CREATE TABLE order_details (
order_detail_id SERIAL PRIMARY KEY,
quantity INT2 DEFAULT 1,
order_id INT NOT NULL REFERENCES orders(order_id),
product_id INT NOT NULL REFERENCES products(product_id)
);

COMMENT ON TABLE order_details is 'Order details';
 

INSERT INTO categories (name) VALUES ('National foofs'), ('Europe foods'), ('Turkish foods');

INSERT INTO types (name) VALUES ('Dark foods'), ('Liquid foods'), ('Drinks'), ('Desserts'), ('Salats');

INSERT INTO types (name) VALUES ('Dark foods'), ('Liquid foods');