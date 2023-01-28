-- Active: 1674727167434@@127.0.0.1@55000@postgres
--TRIGGER
CREATE TABLE users(
    user_id SERIAL NOT NULL PRIMARY KEY,
    username VARCHAR(32) NULL,
    firstname VARCHAR(24) NOT NULL,
    lastname VARCHAR(24) NULL,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP  
);

ALTER TABLE users ADD COLUMN rating SMALLINT DEFAULT 0;

CREATE OR REPLACE FUNCTION users_trigger_fn () RETURNS TRIGGER LANGUAGE PLPGSQL AS
$$
    BEGIN
        old.firstname
        IF new.username is NOT NULL AND new.lastname IS NOT NULL THEN  
            UPDATE users SET rating = 5 WHERE user_id = new.user_id;
        ELSEIF new.username IS NOT NULL OR new.lastname IS NOT NULL THEN
            UPDATE users SET rating = 3 WHERE user_id = new.user_id;
        END IF;
        RETURN NULL;
    END
$$
;

CREATE TRIGGER users_trigger
AFTER INSERT on users
FOR EACH ROW EXECUTE PROCEDURE users_trigger_fn();

INSERT INTO users (firstname, lastname, username) VALUES ('f', 'l', 'u');

SELECT * FROM users;

DROP TRIGGER users_trigger ON users;
