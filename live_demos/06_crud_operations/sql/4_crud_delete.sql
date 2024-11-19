-- DML --> data manipulation language. Delete
SELECT
	*
FROM
	database.duckdb
WHERE
	id IN (5, 8);

DELETE
FROM
	database.duckdb
WHERE
	word IN ('TIMESTAMPTZ','DROP SCHEMA');

SELECT * FROM database.duckdb;