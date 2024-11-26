-- gör ett nytt schema (werehose/refined) för att transformera vår data
CREATE SCHEMA IF NOT EXISTS refined;

-- (allt fungerar förutom att det fortfarnade är blandat små och stpra bokstäver.)
CREATE TABLE IF NOT EXISTS refined.sql_glossary AS (
SELECT
	UPPER(TRIM(sql_word)) AS sql_word,
	REGEXP_REPLACE(TRIM(description),
	' +',
	' ',
	'g') AS description,
	LOWER(
            REGEXP_REPLACE(
                TRIM(example),
                ' +',
                ' ',
                'g'
            )
        ) AS example
FROM
	staging.sql_glossary
);


-- testar
SELECT 
    example, 
    LOWER(REGEXP_REPLACE(TRIM(example), ' +', ' ', 'g')) AS cleaned_example
FROM 
    staging.sql_glossary;
   

	
SELECT * FROM refined.sql_glossary LIMIT 10;