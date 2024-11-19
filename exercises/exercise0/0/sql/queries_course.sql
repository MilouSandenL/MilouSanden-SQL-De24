SELECT
	*
FROM
	sql_course_structure;
-- select all exercises in this course
SELECT
	*
FROM
	sql_course_structure
WHERE
	Content_type = ('exercise');
	
-- select all the lectures in this course
SELECT
	*
FROM
	sql_course_structure
WHERE
	Content_type = ('lecture');
	
-- select all records for week 48
SELECT
	*
FROM
	sql_course_structure
WHERE
	Week = (48);
	
-- Select all records for week 47-49
SELECT
	*
FROM
	sql_course_structure
WHERE
	Week IN (47, 48, 49);
	
-- how many lectures are in this table?
SELECT
	COUNT(*)
FROM
	sql_course_structure
WHERE
	Content_type = ('lecture');

-- how many other content are there?
SELECT
	COUNT (DISTINCT Content_type)
FROM
	sql_course_structure;

-- Which are the unique content types in this table?
SELECT
	DISTINCT Content_type
FROM
	sql_course_structure;


