SELECT
	*
FROM
	sql_course_structure;
	
-- Delete the row with content 02_setup_duckdb and add it again.
DELETE
FROM
	sql_course_structure
WHERE
	Content = ('02_setup_duckdb');
	
INSERT
	INTO
	sql_course_structure (Content,
	Week,
	Content_type)
VALUES ('02_setup_duckdb',
46,
'lecture');

-- You see that 02_setup_duckdb comes in the end of your table, even though the week is 46. Now make a query where you sort the weeks in ascending order.
SELECT
	*
FROM
	sql_course_structure
WHERE
	Content_type = 'lecture'
ORDER BY
	Week ASC;
