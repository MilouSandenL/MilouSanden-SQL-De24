-- räknar alla rader i csv
SELECT
	COUNT(*)
FROM
	main.data_jobs;

-- agrigeringsfunktioner -> tar ett antal rader som input och får andra värde som output.
-- gör en alias med AS
SELECT
	MIN(salary_in_usd) AS min_salary_usd,
	ROUND(AVG(salary_in_usd)) AS mean_salary_usd,
	MEDIAN(salary_in_usd) AS median_salary_usd,
	MAX(salary_in_usd) AS max_salary_usd
FROM
	main.data_jobs;


	
