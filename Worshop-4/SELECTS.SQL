-- SELECTS

-- 1. Todos los videos subidos por cualquier usuario de un país específico.
SELECT E1_Video.*
FROM E1_Video
JOIN E4_User ON E1_Video.user_id = E4_User.user_id
JOIN E8_Country ON E4_User.country_id = E8_Country.country_id
WHERE E8_Country.name = 'Country1';

-- 2. Muestra el género musical disponible y cuenta cuántos videos hay por género.
SELECT E7_MusicalGenre.name, COUNT(E1_Video.id_videos) AS video_count
FROM E7_MusicalGenre
LEFT JOIN E1_Video ON E7_MusicalGenre.genre_id = E1_Video.genre_id
GROUP BY E7_MusicalGenre.name;

-- 3. Mostrar la información de todos los videos, agregando el nombre y correo electrónico del usuario que lo subió, con más de 20 me gusta.
SELECT E1_Video.*, E4_User.name AS uploader_name, E4_User.email AS uploader_email
FROM E1_Video
JOIN E4_User ON E1_Video.user_id = E4_User.user_id
WHERE E1_Video.likes > 20;

-- 4. Muestra todos los canales que tienen al menos un suscriptor de un país específico.
SELECT DISTINCT E5_Channel.*
FROM E5_Channel
JOIN Subscriber_REL ON E5_Channel.channel_id = Subscriber_REL.channel_id
JOIN E4_User ON Subscriber_REL.user_id = E4_User.user_id
JOIN E8_Country ON E4_User.country_id = E8_Country.country_id
WHERE E8_Country.name = 'Country1';

-- 5. Mostrar todos los comentarios con la información relacionada del usuario y del vídeo, donde el comentario tenga la palabra: feo.
SELECT E2_Comment.*, E4_User.name AS commenter_name, E4_User.email AS commenter_email, E1_Video.name AS video_name
FROM E2_Comment
JOIN E4_User ON E2_Comment.user_id = E4_User.user_id
JOIN E1_Video ON E2_Comment.video_id = E1_Video.id_videos
WHERE E2_Comment.content LIKE '%feo%';


-- 6. Muestre a los primeros tres usuarios toda la información relacionada por país, cuenta bancaria, y género musical preferido, ordenar por correo electrónico.
SELECT E4_User.*, E8_Country.name AS country_name, E6_BankAccount.bank_name, E6_BankAccount.account_number, E7_MusicalGenre.name AS genre_name
FROM E4_User
JOIN E8_Country ON E4_User.country_id = E8_Country.country_id
JOIN E6_BankAccount ON E4_User.user_id = E6_BankAccount.user_id
JOIN E7_MusicalGenre ON E4_User.musical_genre_id = E7_MusicalGenre.genre_id
ORDER BY E4_User.email
LIMIT 3;