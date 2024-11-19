SELECT
	*
FROM
	hemnet.duckdb;
	
-- Find out statistics on minimum, mean, median and maximum prices of homes sold.
SELECT
	MIN(final_price) AS min_price,
	AVG(final_price) AS mean_price,
	MAX(final_price) AS max_price,
	MEDIAN(final_price) AS median_price
FROM
	hemnet.duckdb;
	
-- Find out statistics on minimum, mean, median and maximum prices of price per area
SELECT
	MIN(price_per_area) AS min_price_per_area,
	AVG(price_per_area) AS mean_price_per_area,
	MAX(price_per_area) AS max_price_per_area,
	MEDIAN(price_per_area) AS median_price_per_are
FROM
	hemnet.duckdb;
	
-- How many unique communes are represented in the dataset.
SELECT
	COUNT(DISTINCT commune) AS unique_commune
FROM
	hemnet.duckdb;
	
-- How many percentage of homes cost more than 10 million?
SELECT 
    (COUNT(CASE WHEN final_price > 10000000 THEN 1 END) * 100.0) / COUNT(*) AS percentage_above_10_million
FROM hemnet.duckdb;

-- alternativt
SELECT
	(COUNT (*) * 100/ (	SELECT COUNT (*)
	FROM
		hemnet.duckdb)) AS percentage_above_10_million
FROM
	hemnet.duckdb
WHERE
	final_price > 10000000;

