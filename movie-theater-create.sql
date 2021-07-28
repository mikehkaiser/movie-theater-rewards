CREATE TABLE theater(
	theater_id SERIAL PRIMARY KEY,
	address VARCHAR(75),
	phone_number VARCHAR(15)
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	phone_number VARCHAR(15),
	email_address VARCHAR(75) NOT NULL,
	theater_id INTEGER,
	join_date DATE DEFAULT CURRENT_DATE,
	birth_date DATE,
	FOREIGN KEY (theater_id) REFERENCES theater(theater_id)
);

CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	title VARCHAR(50),
	runtime NUMERIC(4),
);

CREATE TABLE showing(
	showing_id SERIAL PRIMARY KEY,
	movie_id INTEGER NOT NULL,
	theater_id INTEGER NOT NULL,
	showtime TIMESTAMP NOT NULL,
	FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
	FOREIGN KEY (theater_id) REFERENCES theater(theater_id)
);

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0) NOT NULL,
	movie_id INTEGER NOT NULL,
	showing_id INTEGER NOT NULL,
	theater_id INTEGER NOT NULL,
	customer_id INTEGER,
	FOREIGN KEY (showing_id) REFERENCES showing(showing_id),
	FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
	FOREIGN KEY (theater_id) REFERENCES theater(theater_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE num_nums(
	food_id SERIAL PRIMARY KEY,
	food_name VARCHAR(50),
	price NUMERIC(4,2)
);

-- CONCESSIONS TABLE SHOULD ALSO LINK TO A BILLING INFO TABLE WHICH CONNECTS CUSTOMER_ID AND BILLING INFORMATION
CREATE TABLE concessions(
	transaction_id SERIAL PRIMARY KEY,
	theater_id INTEGER NOT NULL,
	customer_id INTEGER,
	purchase_total NUMERIC(4,2) NOT NULL,
	purchase_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	FOREIGN KEY (theater_id) REFERENCES theater(theater_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- PURCHASE_ITEMS IS A RECORD OF EACH FOOD ITEM SOLD, LINKING THE FOOD ITEM TO A 
-- TRANSACTION AND CUSTOMER. THIS COULD LEAD TO IDENTIFYING A THEATER'S TOP-SELLING FOOD ITEM
-- OR A CUSTOMER'S FAVORITE FOOD ITEM FOR INDIVIDUALIZED REWARDS OF A 'FREE FAVORITE ITEM'
-- OR AT LEAST A RECORD SO THE CUSTOMER CAN TRACK WHAT THEY'VE HAD IN THE PAST
CREATE TABLE purchase_items(
	purchase_item_id SERIAL PRIMARY KEY,
	food_id INTEGER,
	transaction_id INTEGER,
	theater_id INTEGER,
	customer_id INTEGER,
	FOREIGN KEY (transaction_id) REFERENCES concessions(transaction_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (theater_id) REFERENCES theater(theater_id),
	FOREIGN KEY (food_id) REFERENCES num_nums(food_id)
);

-- 
