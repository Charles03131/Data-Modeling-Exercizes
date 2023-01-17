




  CREATE DATABASE SOCCER:

    \c SOCCER

CREATE TABLE LEAGUE(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE REFEREE(
    id SERIAL PRIMARY KEY,
    name TEXT
);


CREATE TABLE TEAM(
    id SERIAL PRIMARY KEY,
    name TEXT,
    city TEXT
);



CREATE TABLE PLAYERS(
    id SERIAL PRIMARY KEY,
    name TEXT,
    team_id INTEGER references TEAM
);



CREATE TABLE MATCHES(
    id SERIAL PRIMARY KEY,
    home_team INTEGER references TEAM,
    away_team INTEGER references TEAM,
    referee INTEGER references REFEREE,
    location TEXT,
    time TEXT,
    leage_id INTEGER regerences LEAGUE
);



CREATE TABLE GOALS(
    id SERIAL PRIMARY KEY,
    player_id INTEGER references PLAYERS
    match_id INTEGER references MATCHES,
);


CREATE TABLE RESULTS(
    id SERIAL PRIMARY KEY,
    team_id INTEGER references TEAM,
    match_id INTEGER references MATCHES,
    result TEXT
);


