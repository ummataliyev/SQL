CREATE TABLE leauge_clubs(
    club_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(64) NOT NULL
);

--creating football championship
CREATE TABLE leauge (
    soccer_leauge_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(64)
);

--group matches
CREATE TABLE leauge_groups (
    group_id SERIAL NOT NULL PRIMARY KEY,
    label VARCHAR(1),
    soccer_leauge_id INT NOT NULL REFERENCES leauge(soccer_leauge_id)
);

CREATE TABLE leauge_teams (
    team_id SERIAL NOT NULL PRIMARY KEY,
    group_id INT NOT NULL REFERENCES leauge_groups(group_id),
    club_id INT NOT NULL REFERENCES leauge_clubs(club_id)
);

--games with commands
CREATE TABLE leauge_matches (
    match_id SERIAL NOT NULL PRIMARY KEY,
    date DATE NOT NULL,
    soccer_leauge_id INT NOT NULL REFERENCES leauge(soccer_leauge_id)
);

--participants
CREATE TABLE leauge_players (
    player_id SERIAL NOT NULL PRIMARY KEY,
    team_id INT NOT NULL REFERENCES leauge_teams(team_id),
    match_id INT NOT NULL REFERENCES leauge_matches(match_id),
    goals SMALLINT DEFAULT 0
);

INSERT INTO leauge (name) VALUES ('World Championship 2023');
INSERT INTO leauge_clubs (name) VALUES ('Xorazim bollari'), ('Gallar'), ('Chandallar');
INSERT INTO leauge_clubs (name) VALUES ('FCB'), ('RMA'), ('PSJ');

INSERT INTO leauge_groups(label ,soccer_leauge_id) VALUES ('A', 1);
INSERT INTO leauge_groups(label ,soccer_leauge_id) VALUES ('B', 1);
INSERT INTO leauge_groups(label ,soccer_leauge_id) VALUES ('C', 1);
INSERT INTO leauge_groups(label ,soccer_leauge_id) VALUES ('D', 1);

INSERT INTO leauge_teams (team_id, group_id, club_id) VALUES (1, 2, 1);
INSERT INTO leauge_teams (team_id, group_id, club_id) VALUES (2, 2, 5);
INSERT INTO leauge_teams (team_id, group_id, club_id) VALUES (3, 3, 4);

INSERT INTO leauge_matches(date, soccer_leauge_id) VALUES ('2023-02-15', 1);
INSERT INTO leauge_matches(date, soccer_leauge_id) VALUES ('2023-02-16', 1);
INSERT INTO leauge_matches(date, soccer_leauge_id) VALUES ('2023-02-17', 1);
INSERT INTO leauge_matches(date, soccer_leauge_id) VALUES ('2023-02-18', 1);


INSERT INTO leauge_players(match_id, team_id) VALUES (1, 1);
INSERT INTO leauge_players(match_id, team_id) VALUES (1, 3);
INSERT INTO leauge_players(match_id, team_id) VALUES (2, 2);
INSERT INTO leauge_players(match_id, team_id) VALUES (2, 3);
