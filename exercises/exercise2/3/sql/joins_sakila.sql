-- d) in which cities and countris do the customers with initials JD live in?
SELECT * FROM main.customer c;
SELECT * FROM main.address a;
SELECT * FROM main.city c;
SELECT * FROM main.country c;

SELECT
	c.first_name,
	c.last_name,
	ct.city,
	cty.country
FROM
	main.customer c
INNER JOIN main.address a ON
	c.address_id = c.address_id
INNER JOIN main.city ct ON
	a.city_id = ct.city_id
INNER JOIN main.country cty ON
	ct.country_id = cty.country_id
WHERE
	c.first_name LIKE 'J%'
	AND c.last_name LIKE 'D%'; -- det blir samma person men som bor i flera olika cities och countries?

-- e) retreive a list of all customers and what films they have rented.
SELECT
	c.first_name,
	c.last_name,
	f.title
FROM
	main.customer c
INNER JOIN main.rental r ON
	c.customer_id = r.customer_id
INNER JOIN main.inventory i ON
	r.inventory_id = i.inventory_id
INNER JOIN main.film f ON
	i.film_id = f.film_id
ORDER BY
	c.first_name,
	c.last_name;
