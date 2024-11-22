--- make a wildcard selection
SELECT
	*
FROM
	main.hemnet_data;
	
-- testing percentage difference
SELECT 6950000*0.07;

-- 486500
SELECT 6950000-6950000*0.07;

-- find out how many row theres in the table
SELECT
	COUNT(*) AS total_rows
FROM
	main.hemnet_data;
	
-- describe the table
DESC;

DESC TABLE hemnet_data;

-- find the most expencive hom sold
SELECT
	address,
	commune,
	final_price
FROM
	main.hemnet_data
ORDER BY
	final_price DESC
LIMIT 5; 

-- find the 5 cheapest homes sold
SELECT
	address,
	commune,
	area,
	rooms,
	final_price
FROM
	main.hemnet_data
ORDER BY
	final_price ASC
LIMIT 5;

-- explore rooms
SELECT
	rooms,
	area,
	final_price
FROM
	main.hemnet_data
WHERE
	rooms <= 3;

-- find out statics on min, med, max homes sold
SELECT
	MIN(final_price) AS min,
	MEDIAN(final_price) AS median,
	MAX(final_price) AS max,
	AVG(final_price) AS average
FROM
	main.hemnet_data;

-- how many percentage of homes cost more than 5 million
-- (delen/hela) * 100
SELECT
	COUNT(*)/ 500 * 100 AS percentage_over_10M
FROM
	main.hemnet_data
WHERE
	final_price > 10000000;

