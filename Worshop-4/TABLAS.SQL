-- TABLAS

CREATE TABLE IF NOT EXISTS E1_Video (
    videos_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(200),
    date_upload DATE NOT NULL,
    likes INT DEFAULT 0,
    dislikes INT DEFAULT 0,
    user_id INT,
    genre_id INT,
    channel_id INT,
    popular BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES E4_User(user_id),
    FOREIGN KEY (genre_id) REFERENCES E7_MusicalGenre(genre_id),
    FOREIGN KEY (channel_id) REFERENCES E5_Channel(channel_id)
);

CREATE TABLE IF NOT EXISTS E4_User (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
    phone VARCHAR(15),
    nickname VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL,
    musical_genre_id INT NOT NULL,
    country_id INT NOT NULL,
    FOREIGN KEY (musical_genre_id) REFERENCES E7_MusicalGenre(genre_id),
    FOREIGN KEY (country_id) REFERENCES E8_Country(country_id)
);

CREATE TABLE IF NOT EXISTS E8_Country (
    country_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS E7_MusicalGenre (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS E5_Channel (
    channel_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(200),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES E4_User(user_id)
);

CREATE TABLE IF NOT EXISTS E2_Comment (
    comment_id SERIAL PRIMARY KEY,
    content VARCHAR(200) NOT NULL,
    date_comment DATE NOT NULL,
    likes INT DEFAULT 0,
    dislikes INT DEFAULT 0,
    user_id INT,
    video_id INT,
    FOREIGN KEY (user_id) REFERENCES E4_User(user_id),
    FOREIGN KEY (video_id) REFERENCES E1_Video(id_videos)
);

CREATE TABLE IF NOT EXISTS E3_Playlist (
    playlist_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    likes INT DEFAULT 0,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES E4_User(user_id)
);

CREATE TABLE IF NOT EXISTS Playlist_Video_REL (
    playlist_id INT,
    video_id INT,
    PRIMARY KEY (playlist_id, video_id),
    FOREIGN KEY (playlist_id) REFERENCES E3_Playlist(playlist_id),
    FOREIGN KEY (video_id) REFERENCES E1_Video(id_videos)
);

CREATE TABLE IF NOT EXISTS E5_Community (
    community_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL,
    description VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS community_user_REL (
    community_id INT,
    user_id INT,
    expiration_date DATE,
    PRIMARY KEY (community_id, user_id),
    FOREIGN KEY (community_id) REFERENCES E5_Community(community_id),
    FOREIGN KEY (user_id) REFERENCES E4_User(user_id)
);

CREATE TABLE IF NOT EXISTS E6_BankAccount (
    account_id SERIAL PRIMARY KEY,
    bank_name VARCHAR(50),
    account_number VARCHAR(20),
    country_id INT,
    user_id INT,
    FOREIGN KEY (country_id) REFERENCES E8_Country(country_id),
    FOREIGN KEY (user_id) REFERENCES E4_User(user_id)
);

CREATE TABLE IF NOT EXISTS Subscriber_REL (
    user_id INT,
    channel_id INT,
    PRIMARY KEY (user_id, channel_id),
    FOREIGN KEY (user_id) REFERENCES E4_User(user_id),
    FOREIGN KEY (channel_id) REFERENCES E5_Channel(channel_id)
);