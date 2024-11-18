SELECT * FROM data_jobs;

-- namespace
SELECT * FROM main.data_jobs;

-- fully qualified name
SELECT * FROM salaries.main.data_jobs;

SELECT * FROM main.data_jobs LIMIT 10;

SELECT
	work_year,
	salary_in_usd,
	job_title,
	remote_ratio
FROM
	main.data_jobs;
	
SELECT 
	* EXCLUDE(salary,
	employee_residence,
	work_year)
FROM
	main.data_jobs;



