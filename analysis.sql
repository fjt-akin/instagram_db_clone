-- This analysis is going to cover different hypothethical questions for the company with the end goal of deriving key insights
-- for the company that will help with next steps which involves critical decision making processes.


-- We want to reward the users who have been around the longest, specifically the 5 oldest users.
SELECT 
    *
FROM
    users
ORDER BY created_at
LIMIT 5;

-- What day of the week do most users register on, we need this information to properly schedule an ad campaign for that date ?
SELECT 
    DAYNAME(created_at) AS day_of_week,
    COUNT(*) AS registration_counts
FROM
    users
GROUP BY day_of_week
ORDER BY registration_counts DESC
LIMIT 1;

-- We want to target our inactive users with an email campaign. find the users who have never posted a photo ?

SELECT 
    username
FROM
    users
        LEFT JOIN
    photos ON photos.user_id = users.id
WHERE
    image_url IS NULL;

-- We are running a new contest to see who can get the most likes on a single photo, get the user with the highest liked photo to see who won!.
SELECT username, photos.id, photos.image_url, count(*) as total FROM photos
JOIN likes ON likes.photo_id = photos.id
JOIN users ON users.id = photos.user_id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- Our investors want to know how many times does the average user post ?
SELECT (SELECT count(*) FROM photos) / (SELECT count(*) FROM users) as AVG;







