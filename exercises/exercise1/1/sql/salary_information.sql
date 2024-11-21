SELECT
	*
FROM
	cleaned_salaries;
	
-- find out the median and mean salaries for each seniority level
SELECT
	experience_level,
	ROUND(AVG(monthly_salary_sek),2) AS mean_salary
FROM
	cleaned_salaries
GROUP BY
	experience_level;
	
-- medianlön för alla experience levels
WITH ranked_salaries AS (
SELECT
	monthly_salary_sek,
	experience_level,
	ROW_NUMBER() OVER (PARTITION BY experience_level
ORDER BY
	monthly_salary_sek) AS row_num,
	COUNT(*) OVER (PARTITION BY experience_level) AS total_count
FROM
	cleaned_salaries
)
SELECT
	experience_level,
	AVG(monthly_salary_sek) AS median_salary
FROM
	ranked_salaries
WHERE
	row_num IN (total_count / 2, total_count / 2 + 1)
GROUP BY
	experience_level;

-- Find out the top earning job titles based on their median salaries and how much they earn
WITH ranked_salaries AS (
SELECT
	monthly_salary_sek,
	job_title,
	ROW_NUMBER() OVER (PARTITION BY job_title
ORDER BY
	monthly_salary_sek) AS row_num,
	COUNT(*) OVER (PARTITION BY job_title) AS total_count
FROM
	cleaned_salaries
)
SELECT
	job_title,
	AVG(monthly_salary_sek) AS median_salary
FROM
	ranked_salaries
WHERE
	row_num IN (total_count / 2, total_count / 2 + 1)
GROUP BY
	job_title
ORDER BY
	median_salary DESC
LIMIT 10;




