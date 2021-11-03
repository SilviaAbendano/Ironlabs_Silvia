#Instructions
use sakila;

#1.How many copies of the film Hunchback Impossible exist in the inventory system?
select f.title,count(i.inventory_id) as total_copies
from film f
inner join inventory i on f.film_id = i.film_id
group by f.title having title = "Hunchback Impossible"

#2.List all films whose length is longer than the average of all the films.

select film_id,title,length from film
where length > (
	select avg(length) as avg_length
    from film)
    order by length;
    
#3.Use subqueries to display all actors who appear in the film Alone Trip.

select fa.actor_id, concat(a.first_name," ",a.last_name) as full_name
from film_actor fa
join film f
on f.film_id = fa.film_id
join actor a on
a.actor_id = fa.actor_id
where f.title ="Alone Trip";

#4.Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.

select f.film_id,f.title,c.name as category
from film f
join film_category fc
on fc.film_id = f.film_id
join category c
on c.category_id = fc.category_id
where c.name = "family";

#5.Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.

#option 1
select concat(c.first_name, " ",c.last_name) as full_name, c.email, co.country
from customer c
join address ad
on ad.address_id = c.address_id
join city ct
on ct.city_id = ad.city_id
join country co
on co.country_id = ct.country_id
where country = "canada";

#option 2
select concat(c.first_name, " ",c.last_name) as full_name, c.email, co.country
from customer c
where address_id in



#6.Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

select a.actor_id, a.first_name, a.last_name, count(a.actor_id) as count_actor
from actor a
join film_actor fa on fa.actor_id = a.actor_id
join film f on f.film_id = fa.film_id
group by a.actor_id
order by count(a.actor_id) desc
limit 1;



where actor_id in(
	select actor_id from film_actor
    select film_id from film 
    
    );




#7.Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments

select customer_id, sum(amount) as total_amount
from payment
group by customer_id
order by total_amount desc
limit 1;


select p.customer_id, sum(p.amount) as total_amount
from payment p
where rental_id in (
	select rental_id from rental
	select inventory_id from inventory
	select film_id from film)
group by p.customer_id
order by total_amount desc
limit 1;


#8.Customers who spent more than the average payments.
select distinct c.customer_id,c.first_name, c.last_name, p.amount
from customer c
inner join payment p
on p.customer_id = c.customer_id
where p.amount > (
	select round(avg(amount),0) as avg_amount from payment)
order by amount;

