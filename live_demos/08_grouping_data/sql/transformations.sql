SELECT * FROM main.food;

-- id -> food, remove google_topic, year column, week_id -> week, value -> number_searches
-- substring = slicing i python.

CREATE TABLE IF NOT EXISTS main.cleaned_food AS(
SELECT
	id AS food,
	SUBSTRING(week_id, 1, 4) AS year,
	week_id[6:] AS week,
	value AS number_searches
FROM
	main.food);

-- visar vilka tabeller vi har; food och cleaned_food
DESC;