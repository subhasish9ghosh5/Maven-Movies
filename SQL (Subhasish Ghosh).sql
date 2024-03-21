SHOW DATABASES;

USE mavenmovies;

SHOW TABLES;
-- 1. Identify the primary keys and foreign keys in the Maven Movies database. Discuss the differences.

SELECT actor.actor_id, actor.first_name,actor.last_name
FROM actor
INNER JOIN actor_info ON actor.actor_id = actor_info.actor_id;
desc actor;

-- 2. List all details of actors.
SELECT a1.actor_id, a1.first_name,a1.last_name,a2.film_info,a3.awards
FROM actor as a1
INNER JOIN actor_info as a2 ON a1.actor_id = a2.actor_id
INNER JOIN actor_award as a3 ON a2.actor_id = a3.actor_id;

-- 3. List all customer information from the database.
select * from customer;
select * from customer_list;

SELECT customer.customer_id,customer.first_name,customer.last_name,customer.email,customer_list.address,customer_list.phone,customer_list.city,customer_list.country
FROM customer
INNER JOIN customer_list ON customer.customer_id = customer_list.ID

-- 4. List different countries.

SELECT country FROM country;

-- 5. Display all active customers.

SELECT * FROM customer
WHERE active in (1);

-- 6. List all rental IDs for customers with ID 1.

select * from rental
where customer_id in (1);

-- 7. Display all the films whose rental duration is greater than 5.

SELECT * FROM film WHERE rental_duration > 5;

-- 8. List the total number of films whose replacement cost is greater than $15 and less than $20.

SELECT * FROM film WHERE replacement_cost > 15 AND replacement_cost < 20;

-- 9. Display the count of unique first names of actors.

SELECT DISTINCT first_name FROM actor;

-- 10. Display the first 10 records from the customer table.

SELECT * FROM customer LIMIT 10;

-- 11. Display the first 3 records from the customer table whose first name starts with 'b'.

SELECT * FROM customer 
WHERE first_name LIKE 'b%' 
LIMIT 3;

-- 12. Display the names of the first 5 movies which are rated as 'G.

SELECT title,rating FROM film
WHERE rating = 'G'
LIMIT 5;

-- 13. Find all customers whose first name starts with "a".

SELECT * FROM customer 
WHERE first_name LIKE 'a%';

-- 14. Find all customers whose first name ends with "a".

SELECT * FROM customer 
WHERE first_name LIKE '%a';

-- 15. Display the list of first 4 cities which start and end with 'a'.

SELECT city FROM city 
WHERE city LIKE 'a%a'
limit 4;

-- 16. Find all customers whose first name contains "NI" in any position.

SELECT * FROM customer 
WHERE first_name LIKE '%NI%';

-- 17. Find all customers whose first name has "r" in the second position.

SELECT * FROM customer
WHERE SUBSTRING(first_name, 2, 1) = 'r';

-- 18. Find all customers whose first name starts with "a" and are at least 5 characters in length.

SELECT * FROM customer
WHERE first_name LIKE 'a%' AND LENGTH(first_name) >= 5;

-- 19. Find all customers whose first name starts with "a" and ends with "o".

SELECT * FROM customer
WHERE first_name LIKE 'a%o';

-- 20. Get the films with PG and PG-13 ratings using the IN operator.

SELECT title,rating FROM film
where rating in ('PG','PG-13');

-- 21. Get the films with lengths between 50 to 100 using the BETWEEN operator.

select * from film
where length between 50 and 100;

-- 22. Get the top 50 actors using the LIMIT operator.

select * from actor
limit 50;

-- 23. Get the distinct film IDs from the inventory table.

select distinct film_id from inventory;
