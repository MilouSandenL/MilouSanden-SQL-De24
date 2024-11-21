SELECT
	*
FROM
	cleaned_salaries;

SELECT DISTINCT experience_level FROM cleaned_salaries;
	
UPDATE cleaned_salaries
SET experience_level = 
	CASE 
		WHEN experience_level = 'EN' THEN 'Entry level'
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'MI' THEN 'Medium experience'
		WHEN experience_level = 'EX' THEN 'Expert'
		ELSE experience_level
	END;

SELECT
	DISTINCT experience_level
FROM
	cleaned_salaries;
	