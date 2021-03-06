-- INSERTING DATE INTO movie-theater-create tables
INSERT INTO theater(
	theater_id,
	address,
	phone_number
)
VALUES
	(101,'512 S Lamar Blvd Rapid City, SD 57701', '(605) 123-4567'),
	(102,'605 7th St Austin, TX 78745', '(847) 246-8102')
;

INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	phone_number,
	email_address,
	birth_date
)VALUES
	(123,
	'Henry',
	'Robinson',
	'(512) 789-1234',
	'hrobinson_crusoe@hotmail.com',
	'1988-03-08'),
	(124,
	'James',
	'Fraser',
	'(117) 123-1747',
	'jamesmalcolmmckenzie@outlander.net',
	'1721-05-01');

INSERT INTO movie(
	movie_id,
	title,
	runtime,
	theater_id
)VALUES
	(001,'A Most Curious Situation, Neatly Resolved', 0125,101),
	(002,'A New Take on an Old Theme', 0100,102)
;

INSERT INTO showing(
	showing_id,
	movie_id,
	theater_id,
	showtime
)VALUES
	(101,001,101,'2000-08-01 04:05:00 PM'),
	(102,002,102,'2000-08-02 08:10:00 PM')
;

INSERT INTO ticket(
	ticket_id,
	movie_id,
	showing_id,
	theater_id,
	customer_id
)VALUES
	(1,001,101,101,123),
	(2,002,102,102,123)
;

INSERT INTO num_nums(
	food_id,
	food_name,
	price
)VALUES
	(12,'Sour Patch Kids',3.99),
	(13,'Large Popcorn', 6.99),
	(14,'Pint of Beer', 4.99),
	(15,'Soft Pretzel',3.99),
	(16,'Soft Drink', 2.99)
;

INSERT INTO concessions(
	transaction_id,
	theater_id,
	customer_id,
	purchase_total
)VALUES
	(1,101,123,14.25),
	(2,102,124,15.50),
	(3,101,123,6.50),
	(4,102,124,4.25);
	


INSERT INTO purchase_items(
	purchase_item_id,
	transaction_id,
	food_id,
	theater_id,
	customer_id
)VALUES
	(1,1,12,101,123),
	(2,1,13,101,123),
	(3,1,16,101,123),
	(4,2,13,102,124),
	(5,2,14,102,124),
	(6,2,15,102,124),
	(7,1,13,102,124),
	(8,2,12,102,124);

UPDATE purchase_items
SET transaction_id = 3
WHERE purchase_item_id = 7;

UPDATE purchase_items
SET transaction_id = 4
WHERE purchase_item_id = 8
