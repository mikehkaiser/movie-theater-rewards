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
	theater_id INTEGER,
	FOREIGN KEY (theater_id) REFERENCES theater(theater_id)
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

CREATE TABLE concessions(
	purchase_id SERIAL PRIMARY KEY,
	theater_id INTEGER NOT NULL,
	customer_id INTEGER,
	food_id INTEGER NOT NULL,
	purchase_total NUMERIC(4,2) NOT NULL,
	purchase_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	FOREIGN KEY (theater_id) REFERENCES theater(theater_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (food_id) REFERENCES num_nums(food_id)
);
