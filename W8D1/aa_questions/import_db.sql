PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;


CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Garon', 'Hock'),
    ('Javier', 'Ortiz'),
    ('Andy', 'Wynkoop');

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL, 
    author_id INTEGER NOT NULL,
    
    FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
    questions (title, body, author_id)
VALUES 
    ('App Academy', 'What is App Academy?', (SELECT id FROM users WHERE fname = 'Garon')),
    ('SQL', 'What is SQL?', (SELECT id FROM users WHERE fname = 'Javier')),
    ('Internet', 'How do I stop a blizzard?', (SELECT id FROM users WHERE fname = 'Andy')),
    ('Turkey', 'Do you really like turkey on Thanksgiving?', 1);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY(question_id) REFERENCES questions(id)
    FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO   
    question_follows (question_id, user_id)
VALUES  
    (3, 1),
    (3, 2),
    (1, 2);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL, 

    FOREIGN KEY(question_id) REFERENCES questions(id)
    FOREIGN KEY(parent_reply) REFERENCES replies(id)
    FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO 
    replies (question_id, parent_reply, user_id, body)
VALUES
    (3, NULL, 1, "Try a snowblower!"),
    (3, 1, 2, "I have an app for that");

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY(user_id) REFERENCES users(id)
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

INSERT INTO 
    question_likes (user_id, question_id)
VALUES
    (1, 3),
    (2, 3);


