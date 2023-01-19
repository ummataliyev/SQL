-- Active: 1673722358553@@127.0.0.1@55001
CREATE TABLE league_clubs(
    club_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(64) NOT NULL
);

--creating football championship
CREATE TABLE league (
    soccer_league_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(64)
);

--group matches
CREATE TABLE league_groups (
    group_id SERIAL NOT NULL PRIMARY KEY,
    label VARCHAR(1),
    soccer_league_id INT NOT NULL REFERENCES league(soccer_league_id)
);

CREATE TABLE league_teams (
    team_id SERIAL NOT NULL PRIMARY KEY,
    group_id INT NOT NULL REFERENCES league_groups(group_id),
    club_id INT NOT NULL REFERENCES league_clubs(club_id)
);

--games with commands
CREATE TABLE league_matches (
    match_id SERIAL NOT NULL PRIMARY KEY,
    date DATE NOT NULL,
    soccer_league_id INT NOT NULL REFERENCES league(soccer_league_id)
);

--participants
CREATE TABLE league_players (
    player_id SERIAL NOT NULL PRIMARY KEY,
    team_id INT NOT NULL REFERENCES league_teams(team_id),
    match_id INT NOT NULL REFERENCES league_matches(match_id),
    goals SMALLINT DEFAULT 0
);

INSERT INTO league (name) VALUES ('World Championship 2023');
INSERT INTO league_clubs (name) VALUES ('Xorazim bollari'), ('Gallar'), ('Chandallar');
INSERT INTO league_clubs (name) VALUES ('FCB'), ('RMA'), ('PSJ');

INSERT INTO league_groups(label ,soccer_league_id) VALUES ('A', 1);
INSERT INTO league_groups(label ,soccer_league_id) VALUES ('B', 1);
INSERT INTO league_groups(label ,soccer_league_id) VALUES ('C', 1);
INSERT INTO league_groups(label ,soccer_league_id) VALUES ('D', 1);

INSERT INTO league_teams (team_id, group_id, club_id) VALUES (1, 2, 1);
INSERT INTO league_teams (team_id, group_id, club_id) VALUES (2, 2, 5);
INSERT INTO league_teams (team_id, group_id, club_id) VALUES (3, 3, 4);

INSERT INTO league_matches(date, soccer_league_id) VALUES ('2023-02-15', 1);
INSERT INTO league_matches(date, soccer_league_id) VALUES ('2023-02-16', 1);
INSERT INTO league_matches(date, soccer_league_id) VALUES ('2023-02-17', 1);
INSERT INTO league_matches(date, soccer_league_id) VALUES ('2023-02-18', 1);

INSERT INTO league_players(match_id, team_id) VALUES (1, 3);
INSERT INTO league_players(match_id, team_id) VALUES (2, 2);
INSERT INTO league_players(match_id, team_id) VALUES (2, 3);

SELECT * FROM league_players;
SELECT * FROM league_teams;

SELECT
    c.name as club,
    g.label AS group
FROM league_teams AS t
NATURAL JOIN league_clubs AS c
NATURAL JOIN league_groups AS g
WHERE g.soccer_league_id = 1
ORDER BY g.label
;

SELECT
    array_agg(name) as club,
    g.label AS group
FROM league_teams AS t
NATURAL JOIN league_clubs AS c
NATURAL JOIN league_groups AS g
WHERE g.soccer_league_id = 1
GROUP BY g.group_id
ORDER BY g.label
;

SELECT
    p.player_id,
    g.label AS group,
    c.name  AS club,
    m.date  AS match
FROM league_players AS p
NATURAL JOIN league_teams AS t
NATURAL JOIN league_matches AS m
JOIN league_groups AS  g on  g.group_id  = t.group_id
JOIN league_clubs AS c on c.club_id = t.club_id
WHERE m.soccer_league_id  = 1 AND m.match_id  =  1
;

SELECT
    p.player_id,
    g.label AS group,
    c.name  AS club,
    m.date  AS match
FROM league_players AS p
NATURAL JOIN league_teams AS t
NATURAL JOIN league_matches AS m
JOIN league_groups AS  g on  g.group_id  = t.group_id
JOIN league_clubs AS c on c.club_id = t.club_id
WHERE m.soccer_league_id  = 1 AND g.group_id = 1

;