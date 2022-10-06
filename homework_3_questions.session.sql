-- 1. List all customers who live in Texas (use
-- JOINs)
    SELECT first_name, last_name, district
    FROM customer
    JOIN address
    ON customer.address_id = address.address_id
    WHERE district = 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
    SELECT first_name, last_name, amount
    FROM customer
    JOIN payment
    ON customer.customer_id = payment.customer_id
    WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)

    SELECT first_name 
    FROM customer
    WHERE customer_id IN 
    (SELECT customer_id 
    from payment
    GROUP BY customer_id
    HAVING SUM(amount) >= 175
    ORDER BY SUM(amount))  

    --Rhonda, Clara, Elenanor, Marion, Peter, Tommy, Karl

-- 4. List all customers that live in Nepal (use the city
-- table)
    SELECT first_name, last_name, country
    FROM customer
    JOIN address
    ON customer.address_id = address.address_id
    JOIN city
    ON address.city_id = city.city_id
    JOIN country
    ON city.country_id = country.country_id
    WHERE country = 'Nepal';
    --Kevin Schuler

-- 5. Which staff member had the most
-- transactions?

    SELECT first_name, last_name
    FROM staff
    JOIN payment
    ON staff.staff_id = payment.staff_id

-- Staff member Jon

-- 6. How many movies of each rating are
-- there?
    SELECT rating, COUNT(rating)
    from film
    JOIN inventory
    ON inventory.film_id = film.film_id
    GROUP BY  film.rating
    HAVING rating = 'NC-17'
    
    --NC-17 = 944
    --R = 904
    --PG-13 = 1018
    --PG = 924
    --G = 791

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)

    SELECT first_name, last_name
    FROM customer
    WHERE customer_id IN 
    (SELECT customer_id 
    from payment
    GROUP BY customer_id, payment.amount
    HAVING amount > 6.99
    ORDER BY amount)  


-- 8. How many free rentals did our stores give away?

    SELECT rental.rental_id
    FROM rental
    JOIN payment
    ON rental.rental_id = payment.rental_id
    GROUP BY payment.amount, rental.rental_id
    HAVING amount = 0

---24 RENTALS