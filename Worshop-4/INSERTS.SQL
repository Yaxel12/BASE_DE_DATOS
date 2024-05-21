-- INSERTS

INSERT INTO E8_Country (country_id, name) VALUES
(1, 'Country1'),
(2, 'Country2'),
(3, 'Country3'),
(4, 'Country4'),
(5, 'Country5');

INSERT INTO E7_MusicalGenre (name, description) VALUES
('Genre1', 'Description1'),
('Genre2', 'Description2'),
('Genre3', 'Description3'),
('Genre4', 'Description4'),
('Genre5', 'Description5');

INSERT INTO E4_User (name, email, phone, nickname, password, musical_genre_id, country_id) VALUES
('User1', 'user1@example.com', '1111111111', 'nick1', 'pass1', 1, 1),
('User2', 'user2@example.com', '2222222222', 'nick2', 'pass2', 2, 2),
('User3', 'user3@example.com', '3333333333', 'nick3', 'pass3', 3, 3),
('User4', 'user4@example.com', '4444444444', 'nick4', 'pass4', 4, 4),
('User5', 'user5@example.com', '5555555555', 'nick5', 'pass5', 5, 5),
('User6', 'user6@example.com', '6666666666', 'nick6', 'pass6', 1, 2),
('User7', 'user7@example.com', '7777777777', 'nick7', 'pass7', 2, 3),
('User8', 'user8@example.com', '8888888888', 'nick8', 'pass8', 3, 4),
('User9', 'user9@example.com', '9999999999', 'nick9', 'pass9', 4, 5),
('User10','user10@example.com','1010101010', 'nick10','pass10',5, 1);

INSERT INTO E1_Video (name, description, date_upload, likes, dislikes, user_id, genre_id, channel_id) VALUES
('Video1', 'Description1', '2024-05-01', 10, 2, 1, 1, 1),
('Video2', 'Description2', '2024-05-02', 30, 1, 2, 2, 2),
('Video3', 'Description3', '2024-05-03', 5, 5, 3, 3, 3),
('Video4', 'Description4', '2024-05-04', 22, 0, 4, 4, 4),
('Video5', 'Description5', '2024-05-05', 18, 2, 5, 5, 5),
('Video6', 'Description6', '2024-05-06', 25, 3, 6, 1, 1),
('Video7', 'Description7', '2024-05-07', 15, 4, 7, 2, 2),
('Video8', 'Description8', '2024-05-08', 35, 1, 8, 3, 3),
('Video9', 'Description9', '2024-05-09', 45, 5, 9, 4, 4),
('Video10','Description10','2024-05-10', 5, 3, 10, 5, 5);

INSERT INTO E2_Comment (content, date_comment, likes, dislikes, user_id, video_id) VALUES
('This is a comment.', '2024-05-21', 1, 0, 1, 1),
('This is another comment.', '2024-05-22', 2, 0, 2, 2),
('This comment says something feo.', '2024-05-23', 3, 0, 3, 3),
('A fourth comment.', '2024-05-24', 0, 0, 4, 4),
('Yet another comment.', '2024-05-25', 0, 0, 5, 5);

INSERT INTO E5_Channel (name, description, user_id) VALUES
('Channel1', 'Description1', 1),
('Channel2', 'Description2', 2),
('Channel3', 'Description3', 3),
('Channel4', 'Description4', 4),
('Channel5', 'Description5', 5);

INSERT INTO Subscriber_REL (user_id, channel_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10,5);

INSERT INTO E3_Playlist (name, likes, user_id) VALUES
('Playlist1', 10, 1),
('Playlist2', 20, 2),
('Playlist3', 30, 3),
('Playlist4', 40, 4),
('Playlist5', 50, 5);

INSERT INTO Playlist_Video_REL (playlist_id, video_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10);

INSERT INTO community_user_REL (community_id, user_id, expiration_date) VALUES
(1, 1, '2025-01-01'),
(2, 2, '2025-02-02'),
(3, 3, '2025-03-03'),
(4, 4, '2025-04-04'),
(5, 5, '2025-05-05');

INSERT INTO E6_BankAccount (bank_name, account_number, country_id, user_id) VALUES
('Bank1', '123456', 1, 1),
('Bank2', '234567', 2, 2),
('Bank3', '345678', 3, 3),
('Bank4', '456789', 4, 4),
('Bank5', '567890', 5, 5);