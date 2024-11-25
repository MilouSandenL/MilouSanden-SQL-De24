-- EDA-> exploratory data analysis
SELECT * FROM main.food;

-- titta vilka sorters 'id' alltså mat det finns
-- 201 matkategorier
SELECT
	DISTINCT id AS food
FROM
	main.food;
	
-- 135,025 rader
SELECT COUNT(*) FROM main.food;

-- vilka kolumner och datatyper dom har
-- columner: id, googleTopic, week_id, value
DESC main.food;

-- sortera utifrån veckor
SELECT
	*
FROM
	main.food
WHERE
	week_id BETWEEN '2004-04' AND '2004-10';





