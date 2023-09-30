DROP DATABASE ig_db_clone;

-- create a database 
CREATE DATABASE ig_db_clone;
-- use database
USE ig_db_clone; 
-- create users schema
CREATE TABLE users(
	id int PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- create photos schema
CREATE TABLE photos(
	id int PRIMARY KEY AUTO_INCREMENT,
    image_url	VARCHAR(255) NOT NULL,
    user_id int NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

-- create comments schema
CREATE TABLE comments(
	id int PRIMARY KEY AUTO_INCREMENT,
    comment_text VARCHAR(255) NOT NULL,
    user_id int NOT NULL,
    photo_id int NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

-- create likes schema
CREATE TABLE likes(
    user_id int NOT NULL,
    photo_id int NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

-- create follower/following relationship schema
CREATE TABLE follows(
	follower_id int NOT NULL,
    followee_id int NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY(follower_id, followee_id),
    FOREIGN KEY(follower_id) REFERENCES users(id),
	FOREIGN KEY(followee_id) REFERENCES users(id)
);

-- IMPLEMENTING HASHTAGS
-- create tag schema
CREATE TABLE tags(
	id int PRIMARY KEY AUTO_INCREMENT,
    tag_name VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- create photo_tags schema
CREATE TABLE photo_tags(
	photo_id int NOT NULL,
    tag_id int NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id,tag_id)
);

