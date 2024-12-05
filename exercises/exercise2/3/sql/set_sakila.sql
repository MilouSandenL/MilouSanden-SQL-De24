-- a) retrieve a list of all customers and actors wich last name start with G.
SELECT * FROM main.customer c;

SELECT
	c.last_name
FROM
	main.customer c
WHERE
	c.last_name LIKE 'G%'
UNION 
SELECT 
	a.last_name
FROM
	main.actor a
WHERE
	a.last_name LIKE 'G%';

-- b) how many customers and actors starts with 'ann' in their first names? --> 13
SELECT
	COUNT(c.first_name)
FROM
	main.customer c
WHERE
	c.first_name LIKE '%ANN%'; 

-- c) in which cities and countries do the costumers live in?
SELECT
	name,
	city,
	country
FROM
	main.customer_list cl;