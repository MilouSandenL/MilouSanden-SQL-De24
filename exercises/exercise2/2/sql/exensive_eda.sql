-- a) Describe all tables
DESC;

-- b) Select all data on all tables
SELECT * FROM main.actor a;
SELECT * FROM main.address a;
SELECT * FROM main.film f;
SELECT * FROM main.rental r;
SELECT * FROM main.store s;
SELECT * FROM main.customer c;

-- c) find out how many rows there are in each table
SELECT COUNT(*) FROM main.actor a; -- 200
SELECT COUNT(*) FROM main.address a; -- 603
SELECT COUNT(*) FROM main.film f; -- 1000
SELECT COUNT(*) FROM main.rental r; -- 16,044
SELECT COUNT(*) FROM main.store s; -- 2
SELECT COUNT(*) FROM main.customer c; -- 599

-- d) calculate descriptive statitics on film lenght
SELECT * FROM main.film f;
SELECT
	COUNT(title) AS title,
	AVG(length) AS average_title -- 115,272
FROM
	main.film f;
-- e) what are the peal rental time
SELECT
	strftime('%H',
	rental_date) AS time,
	count(rental_date) AS total
FROM
	main.rental r
GROUP BY
	time
ORDER BY
	total DESC;
-- f) what is the distribution of film ratings
SELECT * FROM main.film f;
SELECT
	rating,
	COUNT(*) AS total
FROM
	main.film f
GROUP BY
	rating
ORDER BY
	total DESC;
-- g) who are the top 10 costumers by number of rental
SELECT * FROM main.customer c;
SELECT
	c.first_name,
	c.last_name,
	COUNT(r.customer_id) AS number_rentals -- räknar varje kund id förekommer i tabellen rental (r)
FROM
	main.customer c -- den tabellen vi utgår ifrån
INNER JOIN
	main.rental r ON -- kombinerar datan från customer & rental där det finns en matchning.
	c.customer_id = r.customer_id -- hur raderna ska kopplas ihop, en rad i customer och matchas i rental där värdet av customer_id är detsamma.
GROUP BY --eftersom vi använt count() så behöver vi gruppera för att räkna antalet uthyrningar för varje kund.
	c.first_name,
	c.last_name
ORDER BY -- sorterar resultatet beserat på kulumnen vi gjorde i number_rental
	number_rentals DESC 
LIMIT 10;
	-- h) retreive a list of all costumers and what films they have rented
SELECT * FROM main.film f;
SELECT * FROM main.rental r; -- utforskar dom tabeller vi kommer behöva (EDA)
SELECT * FROM main.customer c;

SELECT
	c.first_name,
	c.last_name, -- hämtar för och efternamn och titel på det kunden hyrde.
	f.title
FROM
	main.customer c -- huvudtabellen
INNER JOIN main.rental r ON -- kopplar tabellen customer och rantal baserat på deras gemensamma kolumn
	c.customer_id = r.customer_id -- gemensam kolumn customer_id 
INNER JOIN main.inventory i ON -- kopplar ihop rental och inventory baserat på den gemensamma kolumnen
	r.inventory_id = i.inventory_id -- gemensamma kolumnen inventory_id från rental och inventory
INNER JOIN main.film f ON -- kopplar tabellerna inventory och film, baserat på den gemensamma kolumnen film_id
	i.film_id = f.film_id -- gör det möjligt att hämta filmtitel för varje uthyrning
ORDER BY
	c.first_name,
	c.last_name;

-- i) make a more exentive EDA of your choice on the sakila database
SELECT * FROM main.city c;