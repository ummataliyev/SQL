-- Active: 1673182399012@@127.0.0.1@55000@myproject
-- insert into products
INSERT INTO products (name) VALUES ('Osh'), ('Shashlik'), ('Qozon kabob'), ('Lag''mon');

-- insert into tables
INSERT INTO tables (number) VALUES (1), (2), (3), (4);

-- insert into order with product_id and table_id
INSERT INTO orders (table_id, product_id) VALUES (3, 3), (1, 2), (1,1);

--select tables
SELECT * FROM tables;

--select orders
SELECT * FROM orders;

--select prodcuts
SELECT * FROM products;

-- selcet orders that references one to many strategy
SELECT
    o.order_id AS id,
    t.number AS seats,
    p.name AS meal
FROM orders AS o
NATURAL JOIN tables AS t
NATURAL JOIN products AS p
;

-- adding users info with methon INSERT
INSERT INTO users (user_name, password, first_name, last_name, birth, gender)
VALUES ('the_elita', 'sapiens', 'Umidjon', 'Ummataliyev', '03-10-2000', TRUE);

INSERT INTO users (user_name, password, first_name, last_name, birth, gender)
VALUES ('muhammadalive', 'alibobo', 'Muhammadali', 'Akbarov', '06-17-2000', TRUE);

-- adding users' contact info with methon INSERT
INSERT INTO contacts(type, content, user_id) VALUES (1, '+998938857747', 1);
INSERT INTO contacts(type, content, user_id) VALUES (2, '+998888351717', 2);
INSERT INTO contacts(type, content, user_id) VALUES (3, '+998931967707', 3);

--SELECT contact full name with using concatenation method it maybe like this concat(coloum1, ' ', coloumn2)
SELECT
    u.user_id,
    u.first_name || ' ' || u.last_name as full_name,
    c.content AS phone_number
FROM users AS u
JOIN contacts AS c ON c.user_id = u.user_id
;

-- SELECT contact full name with using built-in concatenation 
-- aggregate count
SELECT 
    u.user_id,
    CONCAT(u.firs_tname, ' ' ,u.last_name) AS full_name,
    count(c.content) AS phone_number
FROM users AS u
JOIN contacts AS c ON c.user_id=u.user_id GROUP BY u.user_id;

-- SELECT contact full name with using built-in concatenation 
-- aggregate array_agg
SELECT 
    u.user_id,
    CONCAT(u.firs_tname, ' ' ,u.last_name) AS full_name,
    array_agg(c.content) AS phone_number
FROM users AS u
JOIN contacts AS c ON c.user_id=u.user_id GROUP BY u.user_id;


SELECT * FROM "users";
SELECT * FROM "contacts";