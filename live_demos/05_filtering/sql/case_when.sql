SELECT * FROM main.data_jobs;

-- EN -< entry level
-- MI -> mid level
-- SE -> senior 
-- EX -> expert
SELECT
	CASE
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'MI' THEN 'Mid level'
		WHEN experience_level = 'EX' THEN 'Expert'
		WHEN experience_level = 'EN' THEN 'Entry level'
		ELSE experience_level 
	END AS experience_level,
	* EXCLUDE (experience_level)
FROM
	main.data_jobs;
	
-- have i transformed my data?
SELECT * FROM main.data_jobs;

-- to persist changes in the table --> update it
UPDATE
	main.data_jobs
SET
	experience_level = CASE
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'MI' THEN 'Mid level'
		WHEN experience_level = 'EX' THEN 'Expert'
		WHEN experience_level = 'EN' THEN 'Entry level'
		ELSE experience_level  -- perserve existing value if no match
	END
WHERE 
	experience_level IN ('SE', 'MI', 'EN', 'EX');

-- för att dubbelkolla att vi har uppdaterat databasen, så kan vi använda 'distinct'
SELECT
	DISTINCT experience_level
FROM
	main.data_jobs;



