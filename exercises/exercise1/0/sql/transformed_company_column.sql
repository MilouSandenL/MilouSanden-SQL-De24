-- Transforme employment type column 
CREATE TABLE IF NOT EXISTS cleaned_salaries AS
SELECT
	work_year,
	experience_level,
	CASE 
		WHEN employment_type = 'CT' THEN 'Contract'
		WHEN employment_type = 'FL' THEN 'Freelance'
		WHEN employment_type = 'PT' THEN 'Part time'
		WHEN employment_type = 'FT' THEN 'Full time'
		ELSE employment_type
	END AS employment_type,
	job_title,
	salary,
	salary_currency,
	salary_in_usd,
	employee_residence,
	remote_ratio,
	company_location,
	company_size
FROM cleaned_salaries.duckdb;

SELECT
	*
FROM
	cleaned_salaries;

--  Do similar for company size
SELECT
	DISTINCT company_size
FROM
	cleaned_salaries;

UPDATE
	cleaned_salaries
SET
	company_size = CASE
		WHEN company_size = 'S' THEN 'Small'
		WHEN company_size = 'M' THEN 'Medium'
		WHEN company_size = 'L' THEN 'Large'
		ELSE company_size
	END;
	
SELECT
	DISTINCT company_size
FROM
	cleaned_salaries;