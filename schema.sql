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
  genre_id INT REFERENCES genres(id) ON DELETE CASCADE,
  label_id INT REFERENCES labels(id) ON DELETE CASCADE
);

-- Music Albums
CREATE TABLE music_albums (
  id INT PRIMARY KEY,
  on_spotify BOOLEAN,
  genre_id INT REFERENCES genres(id) ON DELETE CASCADE,
  item_id INT REFERENCES items(id) ON DELETE CASCADE
);

-- Genre
CREATE TABLE genres (
  id INT PRIMARY KEY,
  name VARCHAR(20),
  music_id INT REFERENCES music_albums(id) ON DELETE CASCADE
);

CREATE TABLE books (
  id INT PRIMARY KEY,
  publisher VARCHAR(20),
  cover_state VARCHAR(20),
  label_id INT REFERENCES labels(id) ON DELETE CASCADE,
  item_id INT REFERENCES items(id) ON DELETE CASCADE
);


CREATE TABLE labels (
  id INT PRIMARY KEY,
  title varchar,
  color varchar,
  book_id INT  REFERENCES books(id) ON DELETE CASCADE
);