-- eda för att förstå datasettet
SELECT
	*
FROM
	main.food;
	
--
SELECT
	COUNT(DISTINCT id)
FROM
	main.food;
	

SELECT
	COUNT(*) AS number_rows
FROM
	main.food;

-- beskriv kolumner
DESC main.food;

-- filtrera veckor
SELECT
	*
FROM
	main.food
WHERE
	week_id BETWEEN '2004-04' AND '2004-06';