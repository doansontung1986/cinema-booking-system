SELECT * FROM films;
SELECT * FROM customers;
SELECT * FROM rooms;
SELECT * FROM screenings;
SELECT * FROM seats;
SELECT * FROM bookings;
SELECT * FROM reserved_seat;
SELECT * FROM actors;
SELECT * FROM categories;
SELECT * FROM actor_film;
SELECT * FROM film_category;

SELECT *, CONCAT_WS('-',seat_row, number) as 'Seat Code'
FROM films
INNER JOIN screenings
ON films.id = screenings.film_id
INNER JOIN rooms
ON rooms.id = screenings.room_id
INNER JOIN seats
ON seats.room_id = rooms.id;