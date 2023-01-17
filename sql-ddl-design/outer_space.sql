-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planet (

  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbit_id TEXT NOT NULL references ORBIT,
  moon_id TEXT NOT NULL references MOON,
  galaxy_id TEXT NOT NULL references GALAXY

);



CREATE TABLE ORBIT(
  id SERIAL PRIMARY KEY,
  planet_containing_orbital TEXT NOT NULL 
  orbital_period_in_years INTEGER NOT NULL
);


CREATE TABLE MOON(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);



CREATE TABLE GALAXY(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
)



  INSERT INTO ORBIT (planet_containing_orbital,orbital_period_in_years)
   VALUES ('Sun',1.00);

  INSERT INTO MOON (name) VALUES ('The Moon');

  INSERT INTO GALAXY (name) VALUES('Milky Way');

  INSERT INTO PLANET
  (name,orbit_id,moon_id,galaxy_id)
  ("Earth", 1,1,1);