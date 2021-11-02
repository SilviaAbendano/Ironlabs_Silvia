# Lab | SQL Intro
use sakila;

#1. Review the tables in the database.
select * from sakila.actor limit 10;

#2. Explore tables by selecting all columns from each table or using the in built review features for your client.
select * from actor, address, category, city, country, customer, film, film_actor, film_category, film_text, inventory, language, payment, rental, staff, store limit 1;

#3. Select one column from a table. Get film titles.
select title from film;

#4. Select one column from a table and alias it. Get unique list of film languages under the alias language. 
select name as languages_available from language group by name;

#5.1 Find out how many stores does the company have?
select count(store_id) from store;

#5.2 Find out how many employees staff does the company have?
select count(staff_id) from staff;

#5.3 Return a list of employee first names only?
select first_name from staff;

