SELECT
	*
FROM
	cleaned_salaries;
	
-- count number of data engineer jobs -> 3,464st
SELECT
	COUNT(*)
FROM
	cleaned_salaries
WHERE
	job_title = 'Data Engineer';
	
-- count number of unique job titles in total -> 155
SELECT
	COUNT(DISTINCT job_title)
FROM
	cleaned_salaries;
	
-- find out how many jobs go into each salary level - > m: 707, H:3,975, L:58,IH: 11,794
SELECT
	salary_level,
	COUNT(*) AS job_count
FROM
	cleaned_salaries
GROUP BY
	salary_level;