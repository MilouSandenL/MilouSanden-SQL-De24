SELECT
	*
FROM
	cleaned_salaries;
	
-- How many percentage of the jobs are fully remote, 50 percent remote and fully not remote
SELECT
	CASE
		WHEN remote_ratio = 100 THEN 'Fully remote'
		WHEN remote_ratio = 50 THEN '50% remote'
		WHEN remote_ratio = 0 THEN 'Not remote'
		ELSE 'Other'
	END AS remote_status,
	ROUND(COUNT(*) * 100.0 / (
	SELECT
		COUNT(*)
	FROM
		cleaned_salaries),
	2) AS percentage
FROM
	cleaned_salaries
GROUP BY
	remote_status;

-- Pick out a job title of interest and figure out if company size affects the salary
SELECT
	company_size,
	ROUND(AVG(monthly_salary_sek), 2) AS average_salary
FROM
	cleaned_salaries
WHERE
	job_title = 'Data Engineer'
GROUP BY
	company_size
ORDER BY
	average_salary DESC;
