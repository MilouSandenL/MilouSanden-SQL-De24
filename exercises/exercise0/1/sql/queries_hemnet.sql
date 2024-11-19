SELECT
	*
FROM
	hemnet.duckdb;
	
-- Find out how many rows there are in the table
SELECT
	COUNT(*)
FROM
	hemnet.duckdb;
	
-- Describe the table that you have ingested to see the columns and data types.
DESCRIBE hemnet.duckdb;

-- Find out the 5 most expensive homes sold.
SELECT
	*
FROM
	hemnet.duckdb
ORDER BY
	final_price DESC
LIMIT 5;

-- Find out the 5 cheapest homes sold.
SELECT
	*
FROM
	hemnet.duckdb
ORDER BY
	final_price ASC
LIMIT 5;

-- Find out statistics on minimum, mean, median and maximum prices of homes sold.

