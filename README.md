# Movie Theater Rewards
Foundation for a rewards program for a movie theater chain

I was tasked with creating a database structure for a movie theater chain featuring at least: customer, theater, movie, and ticket tables. 
I took it a little further, thinking about how a movie theater chain could implement the database to create a rewards program to track
purchases by an individual across all movie theaters owned by the chain.

<p>The thinking for diagramming was as follows:</p>
<ul>
<li>There will be one customer per customer_id, but that person can purchase several tickets or concessions.</li>
<li>Each theater has a unique id per location, which can have multiple unique showings of various movies, as well as several concession id's, one for each purchase</li>
<li>Each ticket is unique, but a showing will (hopefully) sell many tickets.</li>
<li>For concessions, I considered each 'concession' as a unique transaction. </li>
<li>In order to record multiple food items per transaction, I made a purchase_item table which
makes each food item purchased a unique line item. So 'purchase_item' became the bridge between the transaction_id in concessions to the food_id in num_nums</li>
  </ul>
