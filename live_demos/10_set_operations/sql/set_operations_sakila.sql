-- slå ihop actors och customers till en tabell
-- plockar inte allting för att kraven för mängdoperationer är lika måånga kolumner och likadana datatyper
-- tar ut förnamn och efternamn och sedan söker efter alla som börjar med A.
SELECT
	'Customer' AS type,
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE
	c.first_name LIKE 'A%'
UNION ALL -- set operation
SELECT
	'Actor' AS type,
	a.first_name,
	a.last_name
FROM
	main.actor a
WHERE
	a.first_name LIKE 'A%';
	
-- motsvarande men gör med intersect, kolla om någon kund delar namn med en kändis/ tvärtom. alltså har lika data(namn i detta fall) i båda tabellerna.
SELECT
	c.first_name,
	c.last_name
FROM
	main.customer c
INTERSECT -- set operation
SELECT
	a.first_name,
	a.last_name
FROM
	main.actor a;
	
--
SELECT
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE c.first_namne LIKE 'J%' AND c.last_name LIKE 'D%';
UNION ALL
SELECT
	a.first_name,
	a.last_name
FROM
	main.actor a
WHERE a.first_namne LIKE 'J%' AND a.last_name LIKE 'D%';