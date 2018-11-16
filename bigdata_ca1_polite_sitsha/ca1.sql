CREATE DATABASE 

/*Crete Movies, Actors and Movie_Actors tables*/
CREATE TABLE movies(
   movie_id SERIAL PRIMARY KEY,
   title TEXT,
   writer VARCHAR(100),
   year INT,
   franchise TEXT, 
   synopsis TEXT);

CREATE TABLE actors(
   actor_id SERIAL PRIMARY KEY,
   name VARCHAR(100));

CREATE TABLE movie_actors(
   movie_id int REFERENCES movies(movie_id),
   actor_id int REFERENCES actors(actor_id),
   PRIMARY KEY (movie_id, actor_id));
   
    
INSERT INTO movies (movie_id, title, writer, year) VALUES 
(1, 'Fight Club', 'Chuck Palahniuk', 1999), 
(2, 'Pulp Fiction', 'Quentin Tarantino', 1994),
(3, 'Inglorious Basterds', 'Quentin Tarantino', 2009);

INSERT INTO movies (movie_id, title, writer, year, franchise) VALUES 
(4, 'The Hobbit: An Unexpected Journey', 'J.R.R. Tolkein',  2012, 'The Hobbit'),
(5, 'The Hobbit: The Desolation of Smaug', 'J.R.R. Tolkein',  2013, 'The Hobbit');

INSERT INTO movies (movie_id, title, writer, year, franchise, synopsis) VALUES 
(6, 'The Hobbit: The Battle of the Five Armies', 'J.R.R. Tolkein',  2012, 'The Hobbit', 'Bilbo and Company are forced to engage in a war against an array of combatants and keep the Lonely Mountain from falling into the hands of a rising darkness');

INSERT INTO movies(movie_id, title) VALUES
(7, 'Pee Wee Herman''s Big Adventure'),
(8, 'Avatar');

INSERT INTO actors(actor_id, name) VALUES
(1, 'Brad Pitt'),
(2, 'Edward Norton'),
(3, 'John Travolta'),
(4, 'Uma Thurman'),
(5, 'Diane Kruger '),
(6, 'Eli Roth');

INSERT INTO movie_actors(movie_id, actor_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 5),
(3, 6);

3.	Query / Find RECORDS
/*i. get all records*/
SELECT * FROM movies;

/*ii. get all records with `writer` set to "Quentin Tarantino"*/
SELECT * FROM movies WHERE writer = 'Quentin Tarantino'; 

/* iii. get all records where `actors` include "Brad Pitt"  */
SELECT m.*, a.name as Actor
FROM movies m
JOIN movie_actors ma ON m.movie_id = ma.movie_id
JOIN actors a ON ma.actor_id = a.actor_id
WHERE a.name = 'Brad Pitt';
/*or*/

SELECT movies.title, actors.name AS actor
FROM movies, actors, movie_actors 
WHERE movie_actors.movie_id = movies.movie_id 
AND movie_actors.actor_id = actors.actor_id 
AND actors.name = 'Brad Pitt'
ORDER BY movies.title, actors.name;

/*iv. get all records with `franchise` set to "The Hobbit" */
SELECT * from movies WHERE franchise = 'The Hobbit';

/*v. get all movies released in the 90s*/
SELECT * FROM movies where year < 2000;

/*vi. get all movies released before the year 2000 or after 2010*/
SELECT * FROM movies WHERE year < 2000 OR year > 2010;

/
4.	Update Records 
i)
UPDATE movies 
SET synopsis = 'A reluctant hobbit, Bilbo Baggins, sets out to the Lonely Mountain with a spirited group of dwarves to reclaim their mountain home - and the gold within it - from the dragon Smaug.'
WHERE title  = 'The Hobbit: An Unexpected Journey';

ii)
UPDATE movies 
SET synopsis = 'The dwarves, along with Bilbo Baggins and Gandalf the Grey, continue their quest to reclaim Erebor, their homeland, from Smaug. Bilbo Baggins is in possession of a mysterious and magical ring.'
WHERE title  = 'The Hobbit: The Desolation of Smaug';


iii)
UPDATE actors as a, movie_actors as ma, movies as m
SET a.actor_id = 7,
	a.name = 'Samuel L. Jackson'
	ma.movie_id = 2,
	ma.actor_id = 7	
WHERE ma.movie_id = m.movie_id 
AND ma.actor_id = a.actor_id
AND m.title IN 'Pulp Fiction';



5.	Text Search
/*1. find all movies that have a synopsis that contains the word "Bilbo"*/ 
SELECT * FROM movies WHERE synopsis ILIKE '%Bilbo%';

/*2. find all movies that have a synopsis that contains the word "Gandalf"*/
SELECT * FROM movies WHERE synopsis ILIKE '%Gandalf%';

/*3. find all movies that have a synopsis that contains the word "Bilbo" and not the word "Gandalf"*/ 
SELECT * FROM movies WHERE synopsis ILIKE '%Bilbo%' AND synopsis NOT ILIKE '%Gandalf%';

/*4. find all movies that have a synopsis that contains the word "dwarves" or "hobbit"*/
SELECT * FROM movies WHERE synopsis ILIKE '%dwarves%' OR synopsis ILIKE '%hobbit%';
 
/*5. find all movies that have a synopsis that contains the word "gold" and "dragon"*/
SELECT * FROM movies WHERE synopsis ILIKE '%gold%' AND synopsis ILIKE '%dragon%';


/*6.	Delete Records*/
/*i. delete the movie "Pee Wee Herman's Big Adventure"*/
DELETE FROM movies where title = 'Pee Wee Herman''s Big Adventure';

/*ii. delete the movie "Avatar"*/
DELETE FROM movies where title = 'Avatar';


/*Crete Users, Posts and Comments tables*/
CREATE TABLE users(
   user_id SERIAL PRIMARY KEY,
   username VARCHAR(100),
   first_name VARCHAR(100),
   last_name VARCHAR(100));

CREATE TABLE posts(
   post_id SERIAL PRIMARY KEY,
   user_id int REFERENCES users(user_id),
   title VARCHAR(100),
   body TEXT);

CREATE TABLE comments(
   comment_id SERIAL PRIMARY KEY,
   user_id int REFERENCES users(user_id),
   post_id int REFERENCES posts(post_id),
   comment TEXT);
   
 /*Insert data into Users, Posts and Comments tables*/  
INSERT INTO users (user_id, username, first_name, last_name) VALUES 
(1, 'GoodGuyGreg', 'Good Guy', 'Greg'), 
(2, 'ScumbagSteve', 'Scumbag', 'Steve');


INSERT INTO posts (post_id, user_id, title, body) VALUES 
(1, 1,'Passes out at party', 'Wakes up early and cleans house'), 
(2, 1,'Steals your identity', 'Raises your credit score'),
(3, 1,'Reports a bug in your code', 'Sends you a Pull Request'),
(4, 2,'Borrows something', 'Sells it'),
(5, 2,'Borrows everything', 'The end'),
(6, 2,'Forks your repo on github', 'Sets to private');

INSERT INTO comments(comment_id, user_id, post_id, comment) VALUES
(1, 1, 4, 'Hope you got a good deal!'),
(2, 1, 5, 'What''s mine is yours!'),
(3, 1, 6, 'Don''t violate the licensing agreement!'),
(4, 2, 1, 'It still isn''t clean'),
(5, 2, 3, 'Denied your PR cause I found a hack');

/*8.	Querying related tables*/
/*1. find all users */
SELECT * FROM users;

/*2. find all posts */
SELECT * FROM posts;

/*3. find all posts that was authored by "GoodGuyGreg"*/
SELECT p.*, u.username 
FROM posts p
JOIN users u 
ON p.user_id = u.user_id
where u.username = 'GoodGuyGreg';

/*or*/

select p.*, u.username
from posts p 
INNER JOIN users u 
ON p.user_id = u.user_id 
where u.user_id = 1;

/*4. find all posts that was authored by "ScumbagSteve" */
SELECT p.*, u.username
FROM posts p
JOIN users u ON p.user_id = u.user_id
AND u.username = 'ScumbagSteve';

/*5. find all comments */
SELECT * FROM comments;

/*6. find all comments that was authored by "GoodGuyGreg"*/
SELECT c.*, u.username
FROM comments c
JOIN users u ON u.user_id = c.user_id
WHERE u.username = 'GoodGuyGreg';

/*7. find all comments that was authored by "ScumbagSteve" */
SELECT c.comment, u.username
FROM comments c
JOIN users u ON c.user_id = u.user_id
AND u.username = 'ScumbagSteve';

/*8. find all comments belonging to the post "Reports a bug in your code*/
SELECT c.comment, p.title
FROM comments c 
JOIN posts p ON c.post_id = p.post_id 
WHERE p.title = 'Reports a bug in your code';








