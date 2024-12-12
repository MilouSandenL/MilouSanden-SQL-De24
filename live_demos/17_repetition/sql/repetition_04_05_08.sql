DESC;

-- wildcard selection/ select star/ select all
-- returns result sets and all columns and their respective rows
-- from the table/ veiw - i detta fall veiw - main.payment (schema.veiw(table))
-- when using main.payment we mean schema.table_name/schema.veiw_name --> namespacing.
-- 
SELECT * FROM main.payment;

-- without spacifying schema, duckdb will look at main schema by default.
SELECT * FROM payment;

-- fully qualified name - databasnamn.schema.table/veiw
SELECT * FROM sakila.main.payment;


-- limits the number of returnt rows
SELECT
	*
FROM
	main.payment p
LIMIT 10;

-- choose which columns to return
SELECT
	customer_id,
	amount
FROM
	main.payment;

-- för att exkludera specifika kolumner så kan man använda EXCLUDE
SELECT
	* EXCLUDE(customer_id,
	amount)
FROM
	main.payment;

-- aggregate functions --> many to one mapping
-- olika former av matchningar - matchar input variabler med output variabler. 
SELECT
	COUNT(*) AS number_payments,
	MIN(amount) AS min_amount,
	ROUND(AVG(amount), 2) AS mean_mean,
	MEDIAN(amount) AS median_amount,
	MAX(amount) AS max_amount
FROM
main.payment;

-- filtrera data -> 
-- WHERE (filtrerar på raderna med ett villkor) när villkoret är uppnåt är raden i resultat setet
-- ORDER BY (filtrerar efter kolumn)
SELECT
	*
FROM
	main.payment
WHERE
	amount > 4.2
ORDER BY
	amount;

-- create a new column with amount classificatiton - med CASE WHEN
SELECT
	amount,
	CASE
		WHEN amount < 3.5 THEN 'low cost'
		WHEN amount < 7.5 THEN 'medium cost'
		ELSE 'high cost'
	END AS cost_level
FROM
	main.payment;

-- lägga in det i vår payment tabell
SELECT
	*,
	CASE
		WHEN amount < 3.5 THEN 'low cost'
		WHEN amount < 7.5 THEN 'medium cost'
		ELSE 'high cost'
	END AS cost_level
FROM
	main.payment;

-- skapar en ny view av den kolumnen vi gjort
CREATE VIEW IF NOT EXISTS main.payment_level AS (
SELECT
	*,
	CASE
		WHEN amount < 3.5 THEN 'low cost'
		WHEN amount < 7.5 THEN 'medium cost'
		ELSE 'high cost'
	END AS cost_level
FROM
	main.payment);

-- grupperar datat
SELECT
	cost_level,
	COUNT(amount) AS number_per_level,
	ROUND(AVG(amount), 2) AS mean_amount
FROM
	main.payment_level
GROUP BY
	cost_level;
	
