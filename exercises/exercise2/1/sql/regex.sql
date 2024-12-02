SELECT
	regexp_replace(trim(description),
	' +',
	' ',
	'g'),
	lower(regexp_replace(trim(example),
	' +',
	' ',
	'g')),
FROM
	staging.sql_glossary sg;
	
SELECT
	*
FROM
	staging.sql_glossary
WHERE
	lower(description) LIKE '%select%';
	
SELECT
	*
FROM
	staging.sql_glossary
WHERE
	regexp_matches(lower(description), 'select\b');