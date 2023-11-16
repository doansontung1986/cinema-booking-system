DROP DATABASE IF EXISTS cinema_booking_system;

CREATE DATABASE cinema_booking_system;

USE cinema_booking_system;

DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS seats;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS reserved_seat;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS actor_film;
DROP TABLE IF EXISTS film_category;

CREATE TABLE films (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL UNIQUE,
    length_min INT NOT NULL,
    create_at DATETIME NOT NULL
);

CREATE TABLE accounts (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45),
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL UNIQUE,
    create_at DATETIME NOT NULL
);

CREATE TABLE rooms (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    no_seats INT NOT NULL,
    create_at DATETIME NOT NULL
);

CREATE TABLE screenings (
	id INT PRIMARY KEY AUTO_INCREMENT,
    film_id INT NOT NULL,
    room_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    FOREIGN KEY (film_id) REFERENCES films(id),
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);

CREATE TABLE seats (
	id INT PRIMARY KEY AUTO_INCREMENT,
    seat_row CHAR(1) NOT NULL,
    number INT NOT NULL,
    room_id INT NOT NULL,
    create_at DATETIME NOT NULL,
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);

CREATE TABLE bookings (
	id INT PRIMARY KEY AUTO_INCREMENT,
    screening_id INT NOT NULL,
    account_id INT NOT NULL,
    create_at DATETIME NOT NULL,
    FOREIGN KEY (screening_id) REFERENCES screenings(id),
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);

CREATE TABLE reserved_seat (
	id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL,
    seat_id INT NOT NULL,
    create_at DATETIME NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings(id),
    FOREIGN KEY (seat_id) REFERENCES seats(id)
);

CREATE TABLE actors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    last_update TIMESTAMP NOT NULL,
    create_at DATETIME NOT NULL
);

CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL UNIQUE,
    last_update TIMESTAMP NOT NULL,
    create_at DATETIME NOT NULL
);

CREATE TABLE actor_film (
    actor_id INT NOT NULL,
    film_id INT NOT NULL,
    last_update TIMESTAMP NOT NULL,
	PRIMARY KEY (actor_id, film_id),
    FOREIGN KEY (actor_id) REFERENCES actors(id),
    FOREIGN KEY (film_id) REFERENCES films(id)
);

CREATE TABLE film_category (
    film_id INT NOT NULL,
    category_id INT NOT NULL,
    last_update TIMESTAMP NOT NULL,
    PRIMARY KEY (film_id, category_id),
    FOREIGN KEY (film_id) REFERENCES films(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

INSERT INTO films (name, length_min, create_at)
VALUES ('Blade Runner 2049',153, '2022-01-03'),
('Dunkirk',106, '2022-05-03'),
('Geostorm',121, '2022-08-03'),
('Thor: Ragnarok',107, '2022-11-03'),
('Jigsaw',116, '2022-01-03'),
('The Death of Stalin',98, '2022-01-03'),
('The Lego Ninjago Movie',101, '2022-01-03'),
('Murder on the Orient Express',135, '2022-01-03'),
('Paddington 2',88, '2022-01-03'),
('Breathe',117, '2022-01-03'),
('Blade Runner',127, '2022-01-03'),
('Victoria and Abdul',112, '2022-01-03');

INSERT INTO accounts (first_name, last_name, email, create_at)
VALUES ('David','May','dmay@gmail.com', '2022-01-03'),('Theresa','Davis','tdavis@gmail.com', '2022-01-03'),('Jerry','Martin','jermar@gmail.com', '2022-01-03'),('John','Smith','smithy@gmail.com', '2022-01-03'),
('Martin','Watkins','mwatto@gmail.com', '2022-01-03'),('Emma','Watson','itswingardiumleviosa@gmail.com', '2022-01-03'),('Javier','Pastore','jp@gmail.com', '2022-01-03'),('Charlotte','Hare','chare@gmail.com', '2022-01-03');

INSERT INTO rooms (name, no_seats, create_at) 
VALUES ('Chaplin',72, '2022-06-01'),
('Kubrick',36, '2023-01-01'),
('Coppola',36, '2021-01-01');

INSERT INTO screenings (film_id, room_id, start_time)
VALUES (9, 3, '2022-01-01 20:30:00'),
       (3, 2, '2022-01-03 18:00:00'),
       (8, 1, '2022-01-06 03:15:00'),
       (3, 1, '2022-01-12 12:00:00'),
       (9, 1, '2022-01-12 14:57:00'),
       (8, 2, '2022-01-19 20:15:00'),
       (8, 2, '2022-01-19 22:30:00'),
       (4, 2, '2022-01-22 16:30:00'),
       (3, 3, '2022-01-22 18:30:00'),
       (2, 2, '2022-01-22 18:30:00'),
       (6, 3, '2022-01-27 08:30:00'),
       (7, 1, '2022-01-27 10:05:00'),
       (11, 2, '2022-01-28 13:40:00'),
       (6, 2, '2022-01-28 14:00:00'),
       (3, 1, '2022-01-30 16:00:00'),
       (1, 2, '2022-02-03 13:25:00'),
       (10, 1, '2022-02-06 18:15:00'),
       (7, 1, '2022-02-11 14:10:00'),
       (9, 1, '2022-02-12 15:00:00'),
       (2, 3, '2022-02-14 12:30:00');

INSERT INTO seats (seat_row, number, room_id, create_at)
VALUES ('A',1,1, '2022-01-01'),('A',2,1, '2022-01-01'),('A',3,1, '2022-01-01'),('A',4,1, '2022-01-01'),('A',5,1, '2022-01-01'),('A',6,1, '2022-01-01'),('A',7,1, '2022-01-01'),('A',8,1, '2022-01-01'),
('B',1,1, '2022-01-01'),('B',2,1, '2022-01-01'),('B',3,1, '2022-01-01'),('B',4,1, '2022-01-01'),('B',5,1, '2022-01-01'),('B',6,1, '2022-01-01'),('B',7,1, '2022-01-01'),('B',8,1, '2022-01-01');

INSERT INTO bookings (screening_id, account_id, create_at)
VALUES (2,2, '2022-01-01'),(1,4, '2022-01-01'),(2,6, '2022-01-01'),(4,2, '2022-01-01'), 
(6,5, '2022-01-01'),(1,7, '2022-01-01'),(2,2, '2022-01-01'),(3,6, '2022-01-01');

INSERT INTO reserved_seat (booking_id, seat_id, create_at) 
VALUES (1,9, '2022-01-01'),(1,3, '2022-01-01'),(1,11, '2022-01-01'),(2,10, '2022-01-01'),
		(2,14, '2022-01-01'),(3,1, '2022-01-01'),
		(3,2, '2022-01-01'),(4,5, '2022-01-01'),
		(4,6, '2022-01-01'),(5,8, '2022-01-01');

INSERT INTO actors (first_name, last_name, last_update, create_at)
VALUES ('PENELOPE','GUINESS','2006-02-15 04:34:33','2022-01-01'),
('NICK','WAHLBERG','2006-02-15 04:34:33','2022-01-01'),
('ED','CHASE','2006-02-15 04:34:33','2022-01-01'),
('JENNIFER','DAVIS','2006-02-15 04:34:33','2022-01-01'),
('JOHNNY','LOLLOBRIGIDA','2006-02-15 04:34:33','2022-01-01'),
('BETTE','NICHOLSON','2006-02-15 04:34:33','2022-01-01'),
('GRACE','MOSTEL','2006-02-15 04:34:33','2022-01-01'),
('MATTHEW','JOHANSSON','2006-02-15 04:34:33','2022-01-01'),
('JOE','SWANK','2006-02-15 04:34:33','2022-01-01'),
('CHRISTIAN','GABLE','2006-02-15 04:34:33','2022-01-01'),
('ZERO','CAGE','2006-02-15 04:34:33','2022-01-01'),
('KARL','BERRY','2006-02-15 04:34:33','2022-01-01'),
('UMA','WOOD','2006-02-15 04:34:33','2022-01-01'),
('VIVIEN','BERGEN','2006-02-15 04:34:33','2022-01-01'),
('CUBA','OLIVIER','2006-02-15 04:34:33','2022-01-01'),
('FRED','COSTNER','2006-02-15 04:34:33','2022-01-01'),
('HELEN','VOIGHT','2006-02-15 04:34:33','2022-01-01'),
('DAN','TORN','2006-02-15 04:34:33','2022-01-01');

INSERT INTO categories (name, last_update, create_at)
VALUES ('Action','2006-02-15 04:46:27','2022-01-01'),
('Animation','2006-02-15 04:46:27','2022-01-01'),
('Children','2006-02-15 04:46:27','2022-01-01'),
('Classics','2006-02-15 04:46:27','2022-01-01'),
('Comedy','2006-02-15 04:46:27','2022-01-01'),
('Documentary','2006-02-15 04:46:27','2022-01-01'),
('Drama','2006-02-15 04:46:27','2022-01-01'),
('Family','2006-02-15 04:46:27','2022-01-01'),
('Foreign','2006-02-15 04:46:27','2022-01-01'),
('Games','2006-02-15 04:46:27','2022-01-01'),
('Horror','2006-02-15 04:46:27','2022-01-01'),
('Music','2006-02-15 04:46:27','2022-01-01'),
('New','2006-02-15 04:46:27','2022-01-01'),
('Sci-Fi','2006-02-15 04:46:27','2022-01-01'),
('Sports','2006-02-15 04:46:27','2022-01-01'),
('Travel','2006-02-15 04:46:27','2022-01-01');

INSERT INTO actor_film (actor_id, film_id, last_update)
VALUES ('1','1','2006-02-15 05:05:03'),
('1','2','2006-02-15 05:05:03'),
('1','3','2006-02-15 05:05:03'),
('1','5','2006-02-15 05:05:03'),
('2','8','2006-02-15 05:05:03'),
('3','9','2006-02-15 05:05:03'),
('4','2','2006-02-15 05:05:03'),
('4','3','2006-02-15 05:05:03'),
('4','8','2006-02-15 05:05:03'),
('5','1','2006-02-15 05:05:03'),
('5','2','2006-02-15 05:05:03');

INSERT INTO film_category (category_id, film_id, last_update)
VALUES ('1','1','2006-02-15 05:05:03'),
('1','2','2006-02-15 05:05:03'),
('1','3','2006-02-15 05:05:03'),
('2','5','2006-02-15 05:05:03'),
('3','8','2006-02-15 05:05:03'),
('4','9','2006-02-15 05:05:03'),
('5','2','2006-02-15 05:05:03'),
('6','3','2006-02-15 05:05:03'),
('8','8','2006-02-15 05:05:03'),
('5','1','2006-02-15 05:05:03'),
('6','2','2006-02-15 05:05:03');
