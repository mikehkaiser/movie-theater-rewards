# Movie Theater Rewards
Foundation for a rewards program for a movie theater chain

I was tasked with creating a database structure for a movie theater chain featuring at least: customer, theater, movie, and ticket tables. 
I took it a little further, thinking about how a movie theater chain could implement the database to create a rewards program to track
purchases by an individual across all movie theaters owned by the chain.

The thinking for diagramming was as follows:
There will be one customer per customer_id, but that person can purchase several tickets or concessions.
Each theater has a unique id per location, which can have multiple unique showings of various movies, as well as several concession id's, one for each purchase
Each ticket is unique, but a showing will (hopefully) sell many tickets.
For concessions, I considered each 'concession' as a unique purchase. I'm not sure how to record several food_id's (unique food items) per transaction,
as currently each purchase_id is unique.
