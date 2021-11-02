### Instructions
use sakila;

#1. Which actor has appeared in the most films?
select actor_id,count(film_id)
from sakila.film_actor 
group by actor_id 
order by count(film_id) 
desc limit 1;

#2. Most active customer (the customer that has rented the most number of films)
select customer_id, count(rental_id) 
from sakila.rental 
group by customer_id 
order by count(rental_id) 
desc limit 1;

#3. List number of films per `category`.
select category_id, count(film_id) 
from film_category 
group by category_id;

#4. Display the first and last names, as well as the address, of each staff member.
select first_name,last_name,address 
from staff 
inner join address on staff.address_id = address.address_id;

#5. Display the total amount rung up by each staff member in August of 2005.
select staff_id,sum(amount)
from payment 
where payment_date >='2005-08-01' and payment_date <='2005-08-31' 
group by staff_id ;


inner join staff on staff.staff_id = payment.staff_id

#6. List each film and the number of actors who are listed for that film.
select film_id, count(actor_id) 
from film_actor 
group by film_id 
order by count(actor_id);

#7. Using the tables `payment` and `customer` and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select  last_name,
		sum(payment.amount) as "total_paid"
from sakila.payment 
	inner join customer on payment.customer_id = customer.customer_id
    group by last_name;


