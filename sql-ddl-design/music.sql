-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music


CREATE TABLE RECORDLABEL
(
 id SERIAL PRIMARY KEY,
  name TEXT,
  producer_name TEXT,
  producer_details TEXT 
);


CREATE TABLE GENERE
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE ARTIST
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  record_label_id INTEGER references RECORDLABEL
);


CREATE TABLE SONG
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  song_length FLOAT NOT NULL,
  artist_id INTEGER references ARTIST,
  genere_id INTEGER references GENERE
);


CREATE TABLE ALBUM 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  artist_id INTEGER NOT NULL references ARTIST,
  record_label_id INTEGER references RECORDLABEL
);

CREATE TABLE ALBUM_SONG
(
  id SERIAL PRIMARY KEY,
  album_id INTEGER NOT NULL references ALBUM,
  song_id INTEGER NOT NULL references SONG
);






--music=# INSERT INTO artist (id,name,record_label_id)
--music-# VALUES (2,'Nirvana',NULL);
--INSERT 0 1
--music=# INSERT INTO artist (id,name,record_label_id)
--music-# VALUES (3,'The-Cure',NULL),
--music-# (4,'Metallica',NULL),
--music-# (5,'The Darkness',NULL);
--INSERT 0 3
