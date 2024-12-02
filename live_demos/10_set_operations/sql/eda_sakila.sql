DESC;

-- för att få fram hela film kategorin. film -> film_ida
SELECT * FROM main.film;

-- för att se vilka kolumner vi har i film
DESC TABLE main.film;

-- få fram hur många filmer som finns
SELECT
	COUNT(*) AS number_movies,
	COUNT(DISTINCT title) AS unique_titles
FROM
	main.film;
	
-- vilka ratings som finns
SELECT
	DISTINCT rating
FROM
	main.film;
	
-- några andra som har med film att göra. film_actor -> actor_id, film_id
SELECT * FROM main.film_actor;

-- kolla på actor -> actor_id, first_name, last_name
SELECT * FROM main.actor;

-- fil_categori -> film_id, film_category
SELECT * FROM main.film_category;

-- vilken genre filmerna har. EX -> action, animation, children osv
SELECT * FROM main.category;

-- vilka kunder som finns, customer_id, store_id osv
SELECT * FROM main.customer;

-- hur många kunder det finns per affär
SELECT
	store_id,
	COUNT(*) AS number_customers
FROM
	main.customer
GROUP BY
	store_id
ORDER BY
	store_id ASC;

-- finns store_id 1 och 2. kan se manager_staff_id och adress_id
SELECT * FROM main.store;
