-- 
SELECT * FROM staging.sql_glossary sg;

-- array like slicing
SELECT
	sql_word,
	sql_word[:2],
	sql_word[2:5]
FROM
	staging.sql_glossary sg;
	
-- getitem []
SELECT
	sql_word,
	sql_word[0],
	sql_word[1],
	sql_word[-1]
FROM
	staging.sql_glossary sg;
	
--concatenation
SELECT 'fun' || ' joke';

SELECT
	'SQL command: ' || sql_word ,
FROM
	staging.sql_glossary sg ;
	
-- remove spaces
SELECT
	trim(sql_word) AS trimmed_word,
	trimmed_word[1],
	trimmed_word[-1]
FROM
	staging.sql_glossary sg;
	
SELECT
	UPPER(trim(sql_word)) AS trimmed_word,
	trimmed_word[1],
	trimmed_word[-1]
FROM
	staging.sql_glossary sg;
	
SELECT
	replace(trim(description),'  ', ' ') AS description
FROM
	staging.sql_glossary sg;