-- Active: 1673182399012@@127.0.0.1@55000@myproject
-- data definition create
CREATE TABLE book_store_categories(
    category_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(64)
);

CREATE TABLE book_store_authors (
    author_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(64)
);

CREATE TABLE book_store_books (
    category_id INT NULL REFERENCES book_store_categories (category_id),
    authors_id INT NULL REFERENCES book_store_authors (author_id),
    book_id SERIAL NOT NULL PRIMARY KEY,
    price DECIMAL(5, 2),
    name VARCHAR(64)
);

CREATE TABLE book_store_orders (
    book_id INT NOT NULL REFERENCES book_store_books (book_id),
    order_id SERIAL NOT NULL PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- insert book
INSERT INTO book_store_categories (name) VALUES ('Software Engineering A'),('Software Engineering B');

INSERT INTO book_store_authors (name) VALUES ('Author A'),('Author B');

INSERT INTO book_store_books (price, name, category_id, authors_id) VALUES (65, 'UI Experiance', 1, 1);
INSERT INTO book_store_books (price, name, category_id, authors_id) VALUES (65, 'The Definitive Guide Golang', 1, 2);
INSERT INTO book_store_books (price, name, category_id, authors_id) VALUES (75, 'Micro Controller basics', 2, 1);

SELECT
    b.name,
    b.price,
    a.name AS author_name
FROM book_store_books AS b
JOIN book_store_authors AS a ON a.author_id = b.authors_id
JOIN book_store_categories AS c ON c.category_id = b.category_id
WHERE b.category_id = 1
;

UPDATE book_store_categories SET name = 'Kichkina shaxzoda' WHERE category_id = 2;

SELECT * FROM book_store_categories;


CREATE TABLE billing_users(
    user_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(48) NOT NULL,
    username VARCHAR(24) NOT NULL,
    password VARCHAR(60) NOT NULL
);

CREATE UNIQUE INDEX ON billing_users (lower(username));

CREATE TABLE billing_cashes(
    cash_id SERIAL NOT NULL PRIMARY KEY,
    amount DECIMAL(16, 2) NOT NULL,
    summary VARCHAR(32) NULL,
    craeted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL REFERENCES billing_users (user_id)
);

CREATE TABLE billing_cost (
    cash_id SERIAL NOT NULL PRIMARY KEY,
    amount DECIMAL(16, 2) NOT NULL,
    summary VARCHAR(32) NULL,
    craeted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL REFERENCES billing_users (user_id)
);


--mock data

CREATE EXTENSION pgcrypto;

--change password with method
INSERT INTO billing_users(name, username, password) VALUES('Umidjon Ummataliyev', 'the_elita', crypt('umidjon1', gen_salt('bf')));
INSERT INTO billing_users(name, username, password) VALUES('Muhammadali Akbarov', 'daliko', crypt('dalidappa1', gen_salt('bf')));

SELECT
    *
FROM billing_users
WHERE username = 'the_elita' AND
password = crypt('the_elita', password);

INSERT INTO billing_cashes(amount, summary, user_id) VALUES (100000, NULL, 1);
INSERT INTO billing_cashes(amount, summary, user_id) VALUES (200000, 'Avans', 2);

INSERT INTO billing_cost(amount, summary, user_id) VALUES (5000, 'lanch', 2);
INSERT INTO billing_cost(amount, summary, user_id) VALUES (11000, 'Launch', 2);
INSERT INTO billing_cost(amount, summary, user_id) VALUES (7000, NULL, 2);

-- SELECT * FROM billing_cashes;
-- SELECT * FROM billing_cost;

SELECT
    sum(billing_cashes.amount) AS cash,
    (SELECT sum(amount) FROM billing_cost WHERE user_id = 2) AS cost,
    sum(billing_cashes.amount) - (SELECT sum(amount) FROM billing_cost WHERE user_id = 2) AS balance
FROM billing_cashes
WHERE billing_cashes.user_id = 28;

SELECT
    sum(amount)
FROM billing_cost
WHERE user_id = 2 AND
    extract(YEAR FROM craeted_at)::VARCHAR ||
    extract (MONTH FROM craeted_at)::VARCHAR ||
    extract (DAY FROM craeted_at)::VARCHAR AS a 
    
    extract(YEAR FROM now())::VARCHAR ||
    extract (MONTH FROM now())::VARCHAR ||
    extract (DAY FROM now())::VARCHAR AS b
;