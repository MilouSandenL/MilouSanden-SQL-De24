-- 10 most searched foods
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

-- total searches by year 
-- (group by är att gruppera kolumnens samma värden till en -> funkar på en kolumn som distinct gör)
-- man måste gruppera innan man gör order by, så gruppera innan filtrering.
-- vilken ordning du skriver koden:
SELECT -- 3
	year,
	SUM(number_searches) AS total_searches
FROM -- 1
	main.cleaned_food
GROUP BY -- 2
	year
ORDER BY -- 4
	total_searches DESC;

-- having är motsvarande where, men har man en gruppering använder man having.
SELECT
	year,
	SUM(number_searches) AS total_searches
FROM 
	main.cleaned_food
GROUP BY 
	year
HAVING total_searches > 300000 
ORDER BY 
	total_searches DESC;

-- gruppera två stycken kolumner (för varje år och maträtt)
SELECT
	year,
	food,
SUM(number_searches) AS total_searches
FROM
	main.cleaned_food
GROUP BY
	food,
	year
ORDER BY total_searches DESC;

-- most popular food in summer
SELECT
    week
FROM
    main.cleaned_food
WHERE
    week NOT LIKE '____-__'
    OR TRY_CAST(SUBSTRING(week, 6, 2) AS INTEGER) IS NULL;
   
--
SELECT
    food,
    SUM(number_searches) AS total_searches
FROM
    main.cleaned_food
WHERE
    CAST(SUBSTRING(week, 1, 2) AS INTEGER) BETWEEN 22 AND 35
GROUP BY
    food
ORDER BY
    total_searches DESC
LIMIT 5;

-- most popular food in winter

SELECT
    food,
    SUM(number_searches) AS total_searches
FROM
    main.cleaned_food
WHERE
    CAST(SUBSTRING(week, 1, 2) AS INTEGER) BETWEEN 48 AND 52
    OR CAST(SUBSTRING(week, 1, 2) AS INTEGER) BETWEEN 1 AND 8
GROUP BY
    food
ORDER BY
    total_searches DESC
LIMIT 5;
