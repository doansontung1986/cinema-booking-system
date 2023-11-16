SELECT * FROM films;
SELECT * FROM accounts;
SELECT * FROM rooms;
SELECT * FROM screenings;
SELECT * FROM seats;
SELECT * FROM bookings;
SELECT * FROM reserved_seat;
SELECT * FROM actors;
SELECT * FROM categories;
SELECT * FROM actor_film;
SELECT * FROM film_category;

SELECT accounts.id, accounts.first_name, accounts.last_name, CONCAT(seats.seat_row, seats.number) as 'seat', screenings.start_time
FROM accounts
INNER JOIN bookings
ON accounts.id = bookings.account_id
INNER JOIN screenings
ON screenings.id = bookings.screening_id
INNER JOIN rooms
ON rooms.id = screenings.room_id
INNER JOIN seats
ON seats.room_id = rooms.id
INNER JOIN reserved_seat
ON reserved_seat.seat_id = seats.id
WHERE accounts.id = 2;

