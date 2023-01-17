-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE AIRPORT(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT NOT NULL,
  country TEXT NOT NULL,
);


CREATE TABLE PLANE(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
);


CREATE TABLE AIRLINE(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
);
CREATE TABLE PASSENGER(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  DOB DATE NOT NULL
);


CREATE TABLE TERMINAL(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  gate TEXT NOT NULL
);

CREATE TABLE DEPARTURE(
  id SERIAL PRIMARY KEY,
  date DATE NOT NULL,
  airport_id INTEGER NOT NULL references AIRPORT,
  terminal_id INTEGER NOT NULL references terminal
);

CREATE TABLE ARRIVAL(
  id SERIAL PRIMARY KEY,
  date DATETIME NOT NULL,
  airport_id INTEGER NOT NULL references AIRPORT,
  terminal_id INTEGER NOT NULL references terminal
);

CREATE TABLE FLIGHT(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  airline_id INTEGER NOT NULL references AIRLINE,
  departure_id INTEGER NOT NULL references DEPARTURE,
  arrival_id INTEGER NOT NULL references ARRIVAL,
  plane_id INTEGER NOT NULL references PLANE
);

CREATE TABLE TICKET(
   id SERIAL PRIMARY KEY,
   class TEXT NOT NULL,
   seat TEXT NOT NULL,
   passenger_id INTEGER references PASSENGER,
   flight_id INTEGER references FLIGHT
);



INSERT INTO PASSENGER (id,first_name,last_name,DOB) 
VALUES(1,'Bob', 'Vance', 1/20/1980);


INSERT INTO AIRLINE (id,name)
VALUES(1,'Delta'),
(2,'Sun-COuntry'),
(3,'United');



INSERT INTO PLANE (id,name) VALUES (1,'747');

INSERT INTO TERMINAL (id,name,gate) VALUES(1,'Humphry','2a');
INSERT INTO TERMINAL (id,name,gate) VALUES(2,'Langdon', '7b');

INSERT INTO DEPARTURE (id,date,airport_id, terminal_id)
VALUES (1,1/20/23,1,1);

INSERT INTO ARRIVAL (id,date,airport_id, terminal_id)
VALUES(1,1/20/23,1,2);

INSERT INTO FLIGHT (id,name,airline_id,departure_id,arrival_id,plane_id)
VALUES (1,'2345',1,1);


INSERT INTO TICKET (id,class,seat,passenger_id,flight_id)
VALUES(1,'Economy','3A',1,1);
