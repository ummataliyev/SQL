-- Active: 1674152866305@@127.0.0.1@55000@postgres
CREATE TABLE users(
    user_id SERIAL NOT NULL PRIMARY KEY,
    name CHARACTER VARYING (32) NOT NULL
);

CREATE TABLE movies (
    movie_id SERIAL NOT NULL PRIMARY KEY,
    name CHARACTER VARYING(128)  NOT NULL
);

CREATE TABLE favourites(
    favourite_id SERIAL NOT NULL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users (user_id),
    movie_id INT NOT NULL REFERENCES movies (movie_id)
);

COMMENT ON TABLE users is 'Table of users';
COMMENT ON TABLE movies is 'Table of movies';
COMMENT ON TABLE favourites is 'Table of fav films';

INSERT INTO users (name) VALUES ('Umidjon'), ('Muhammadali'), ('Fayzbek');

INSERT INTO movies (name) VALUES ('Interstellar'), ('Wanted'), ('Mission impossible');

INSERT INTO favourites (user_id, movie_id) VALUES (1,2), (2,1), (2,2), (3,2);

SELECT
    fav.favourite_id,
    fav.user_id,
    m.name as mov
FROM favourites as fav
NATURAL JOIN movies as m
;

SELECT
    f.user_id,
    u.name as user
FROM favourites as f
NATURAL JOIN users as u
GROUP BY f.user_id, u.name
;

SELECT
    f.user_id,
    u.name AS user,
    count(m.name) AS movies,
    array_agg(m.name) AS movies
FROM favourites AS f
NATURAL JOIN users AS u
JOIN movies AS m on m.movie_id = f.movie_id
GROUP BY f.user_id, u.name, f.movie_id
;

-- DO $$
--     DECLARE
--         movie_name CHARACTER VARYING;
--     BEGIN
--         SELECT name INTO movie_name FROM movies WHERE movie_id = 1;
--         RAISE info '%', movie_name; 
--     END $$;

-- CREATE FUNCTION greeting() RETURNS INT AS $$
--     BEGIN
--         RAISE NOTICE 'Hello World';
--         RETURN 1;
--     END;



-- CREATE FUNCTION fav_movies(id INT) RETURNS TABLE(name VARCHAR) AS $$
-- BEGIN
--     RETURN QUERY SELECT name FROM favourites WHERE id = id;
-- END;
-- $$ LANGUAGE plpgsql;

