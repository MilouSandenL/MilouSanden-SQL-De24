SELECT * FROM main.data_jobs;
-- count(*) ger oss antalet rader
SELECT COUNT (*) FROM main.data_jobs;

SELECT * FROM main.data_jobs WHERE salary_in_usd < 50000;

-- filtering salary_in_usd lower than 50k
SELECT
	COUNT(*) AS number_rows
FROM
	main.data_jobs
WHERE
	salary_in_usd < 50000;
	
-- focus on experience_level
-- DISTINCT för hur många Unika värden vi har i en kolumn
SELECT
	DISTINCT experience_level
FROM
	main.data_jobs;

-- filtrering på ett villkor (condition)
SELECT
	*
FROM
	main.data_jobs
WHERE
	experience_level = 'EN';


SELECT
	MEDIAN(salary_in_usd)
FROM
	main.data_jobs
WHERE
	experience_level = 'EN';

SELECT
	MEDIAN(salary_in_usd)
FROM
	main.data_jobs
WHERE
	experience_level = 'MI';


	
