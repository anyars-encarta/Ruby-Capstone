CREATE DATABASE catalog;

-- Games
CREATE TABLE games (
  item_id INT REFERENCES items(id) ON DELETE CASCADE,
  multiplayer BOOLEAN,
  last_played_at DATE
);

-- Authors
CREATE TABLE authors (
  id INT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL
);

-- Items
CREATE TABLE items (
  id INT PRIMARY KEY,
  author_id INT REFERENCES authors(id) ON DELETE CASCADE,
  publish_date DATE,
  archived BOOLEAN DEFAULT FALSE,
  genre_id integer,
  FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE
);

-- Music Albums
CREATE TABLE MUSICALBUM (
  id integer GENERATED ALWAYS AS IDENTITY,
  on_spotify BOOLEAN,
  genre_id integer,
  item_id integer,
  PRIMARY KEY (id),
  FOREIGN KEY(genre_id) REFERENCES GENRE (id) ON DELETE CASCADE,
  FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
);

-- Genre
CREATE TABLE GENRE (
  id integer GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(20),
  music_id integer,
  PRIMARY KEY (id),
  FOREIGN KEY(music_id) REFERENCES MUSICALBUM (id) ON DELETE CASCADE,
);

