CREATE TABLE 
    IF NOT EXISTS sql_course_structure AS (
SELECT
	*
FROM
	read_csv_auto('data/course_schema.csv')
    );