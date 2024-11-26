-- ta bort spaces som är för många, genom att matcka ett eller flera spaces' +' med ' ' och göra den global 'g'.
SELECT
	REGEXP_REPLACE(TRIM(description), ' +', ' ', 'g') -- matcha mot ett eller flera spaces
FROM
	staging.sql_glossary;
	
-- söka fram olika ord -> select. genom att använda %select% vilket söker efter ordet med saker före eller efter, gör den till lower för att få tillgång till alla select oberoende casing.
SELECT
	*
FROM
	staging.sql_glossary
WHERE
	LOWER(description) LIKE '%select%';