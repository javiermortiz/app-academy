DROP TABLE IF EXISTS cats CASCADE;
DROP TABLE IF EXISTS toys CASCADE;
DROP TABLE IF EXISTS cattoys CASCADE;

CREATE TABLE cats (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    color VARCHAR,
    breed VARCHAR
);

CREATE TABLE toys (
    id SERIAL PRIMARY KEY,
    price FLOAT,
    color VARCHAR,
    name VARCHAR
);

CREATE TABLE cattoys (
    id SERIAL PRIMARY KEY,
    cat_id INTEGER,
    toy_id INTEGER,
    FOREIGN KEY (cat_id) REFERENCES cats (id),
    FOREIGN KEy (toy_id) REFERENCES toys (id) 
);

INSERT INTO 
    cats (name, color, breed)
VALUES
    ('Tiger', 'Orange', 'Abyssinian');

INSERT INTO 
    cats (name, color, breed)
VALUES
    ('Smokey', 'Gray', 'Aegean');

INSERT INTO 
    cats (name, color, breed)
VALUES
    ('Misty', 'White', 'American Curl');

INSERT INTO 
    cats (name, color, breed)
VALUES
    ('Kitty', 'Black', 'Asian');

INSERT INTO 
    cats (name, color, breed)
VALUES
    ('Oscar', 'Brown', 'Balinese');

INSERT INTO
    toys (price, color, name)
VALUES 
    (1.75, 'Blue', 'Ball');

INSERT INTO
    toys (price, color, name)
VALUES 
    (2.99, 'Green', 'Spring');

INSERT INTO
    toys (price, color, name)
VALUES 
    (2.75, 'Brown', 'Mice');

INSERT INTO
    toys (price, color, name)
VALUES 
    (5.50, 'Red', 'Tent');

INSERT INTO
    toys (price, color, name)
VALUES 
    (4.90, 'Pink', 'Ribbon');

INSERT INTO 
    cattoys (cat_id, toy_id)
VALUES
    ((SELECT id
      FROM cats 
      WHERE name = 'Tiger'),
      (SELECT id 
      FROM toys 
      WHERE name = 'Ball'));

INSERT INTO 
    cattoys (cat_id, toy_id)
VALUES
    ((SELECT id
      FROM cats 
      WHERE name = 'Smokey'),
      (SELECT id 
      FROM toys 
      WHERE name = 'Spring'));

INSERT INTO 
    cattoys (cat_id, toy_id)
VALUES
    ((SELECT id
      FROM cats 
      WHERE name = 'Misty'),
      (SELECT id 
      FROM toys 
      WHERE name = 'Mice'));

INSERT INTO 
    cattoys (cat_id, toy_id)
VALUES
    ((SELECT id
      FROM cats 
      WHERE name = 'Kitty'),
      (SELECT id 
      FROM toys 
      WHERE name = 'Tent'));

INSERT INTO 
    cattoys (cat_id, toy_id)
VALUES
    ((SELECT id
      FROM cats 
      WHERE name = 'Oscar'),
      (SELECT id 
      FROM toys 
      WHERE name = 'Ribbon'));