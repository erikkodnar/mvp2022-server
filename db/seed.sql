\c mvpbackend

INSERT INTO Users (user_id, username, password)
VALUES (1, 'cookie', '123456'),
(2, 'monster', '123456'),
(3, 'cookie_monster', '123456');

INSERT INTO Conversations (conversation_id, user1_id, user2_id)
VALUES (1, 1, 2),
(2, 1, 3),
(3, 2, 3);

INSERT INTO Messages (message_id, conversation_id, sender_id, text, time)
VALUES (1, 1, 1, 'hey!', now()),
(2, 1, 1, 'How are you doing?', now()),
(3, 1, 2, 'one sec!',now()),
(4, 2, 1, 'Miss you! 💖', now()),
(5, 2, 3, 'Me too!', now()),
(6, 3, 2, 'How is the city??', now()),
(7, 3, 2, 'Is it hot there as well?', now());
