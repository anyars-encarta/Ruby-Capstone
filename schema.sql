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
  archived BOOLEAN DEFAULT FALSE
);