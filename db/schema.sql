DROP DATABASE mvpbackend;

CREATE DATABASE mvpbackend;

\c mvpbackend

DROP TABLE IF EXISTS users;

CREATE TABLE users
(
  user_id serial PRIMARY key,
  username VARCHAR(50) unique NOT NULL,
  password VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS conversations;

CREATE TABLE conversations
(
  conversation_id serial PRIMARY KEY,
  user1_id INT NOT NULL,
  user2_id INT NOT NULL,
  FOREIGN KEY (user1_id)
    REFERENCES Users (user_id),
  FOREIGN KEY (user2_id)
    REFERENCES Users (user_id)
);

DROP TABLE IF EXISTS messages;

CREATE TABLE messages
(
  message_id serial PRIMARY key,
  conversation_id INT NOT NULL,
  sender_id INT NOT NULL,
  text VARCHAR(400) NOT NULL,
  time TIMESTAMP NOT NULL,
  read BOOLEAN NOT NULL DEFAULT FALSE,
  FOREIGN KEY (sender_id)
    REFERENCES Users (user_id),
  FOREIGN KEY (conversation_id)
    REFERENCES Conversations (conversation_id)
);

GRANT ALL PRIVILEGES ON DATABASE mvpbackend TO development;
