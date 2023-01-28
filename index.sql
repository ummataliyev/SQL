-- Active: 1674727167434@@127.0.0.1@55000@postgres
CREATE TABLE users(
    user_id INTEGER NOT NULL,
    email CHARACTER VARYING(384) NOT NULL,
    f_name CHARACTER VARYING(24) NOT NULL,
    l_name CHARACTER VARYING(24) NOT NULL,
    room_number SMALLINT NOT NULL
);

CREATE UNIQUE INDEX email_idx ON users (email);

CREATE UNIQUE INDEX email_idx ON users (lower(email));

CREATE UNIQUE INDEX fullname_uniq_idx ON users (f_name, l_name);

CREATE INDEX room_number_ind ON users (rrom_number);

CREATE INDEX fullname ON users ((f_name || ' ' || l_name));

INSERT INTO users (email, f_name, l_name, room_number) VALUES ('djonhumamtaliyev@gmail.com', 'Umidjon', 'Shakirov', 1);

SELECT * FROM users WHERE f_name like 'a%';

SELECT * FROM users WHERE f_name like 'A%';

SELECT * FROM users WHERE f_name ilike 'a%';

SELECT * FROM users WHERE fname || ' ' || l_name  ilike 'name surname';

SELECT * FROM users;
