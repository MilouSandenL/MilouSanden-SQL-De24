SELECT
	*
FROM
	main.cleaned_food;
	
-- filtrera baserat på food
SELECT
	food,
	SUM(number_searches) AS total_searches
FROM
	main.cleaned_food
GROUP BY
	food
ORDER BY
	total_searches DESC
LIMIT 10;

SELECT
	*
FROM
	main.cleaned_food;

-- filtrera baserat på year
SELECT
	year,
	SUM(number_searches) AS total_searches
FROM
	main.cleaned_food
GROUP BY
	year
ORDER BY
	total_searches DESC
LIMIT 10;

-- för att se dom olika åren som är
SELECT
	DISTINCT year
FROM
	main.cleaned_food;

SELECT
	year,
	SUM(number_searches) AS total_searches
FROM
	main.cleaned_food
GROUP BY
	YEAR
HAVING
	total_searches < 300000
ORDER BY
	total_searches DESC;

