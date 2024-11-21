SELECT
	*
FROM
	cleaned_salaries;
	
-- Make a salary column with Swedish currency for yearly salary.
ALTER TABLE cleaned_salaries ADD COLUMN salary_in_sek DOUBLE;

UPDATE
	cleaned_salaries
SET
	salary_in_sek = salary_in_usd * 11;
	
SELECT
	salary_in_usd,
	salary_in_sek
FROM
	cleaned_salaries;
	
-- Make a salary column with Swedish currency for monthly salary.
ALTER TABLE cleaned_salaries ADD COLUMN monthly_salary_sek DOUBLE;

UPDATE
	cleaned_salaries
SET
	monthly_salary_sek = salary_in_sek / 12;

-- färre decimaler
UPDATE
	cleaned_salaries
SET
	monthly_salary_sek = ROUND(monthly_salary_sek,
	2);

-- kontrollera att det sparats som jag vill
SELECT
	salary_in_sek,
	monthly_salary_sek
FROM
	cleaned_salaries;
	
SELECT
	*
FROM
	cleaned_salaries;
	
-- Make a salary_level column with the following categories: low, medium, high, insanely_high. 
ALTER TABLE cleaned_salaries ADD COLUMN salary_level VARCHAR;

UPDATE
	cleaned_salaries
SET
	salary_level = 
	CASE
		WHEN monthly_salary_sek < 20000 THEN 'Low'
		WHEN monthly_salary_sek BETWEEN 20000 AND 50000 THEN 'Medium'
		WHEN monthly_salary_sek BETWEEN 50000 AND 100000 THEN 'High'
		WHEN monthly_salary_sek > 100000 THEN 'Insanely_high'
		ELSE 'undefined'
	END;

SELECT
	monthly_salary_sek,
	salary_level
FROM
	cleaned_salaries;

SELECT
	*
FROM
	cleaned_salaries;
	
	