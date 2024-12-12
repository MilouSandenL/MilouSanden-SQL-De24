CREATE SCHEMA IF NOT EXISTS sql;

-- för att få fram schemas så skriver man så: - istället för desc;
SELECT
	*
FROM
	information_schema.schemata;

-- IF NOT EXISTS - idempotent (kommer hoppa över och inte göra något om man kör komandot en gång till)
-- Primery key - kan inte lägga in flera värden, study_week är permanent. 
CREATE TABLE IF NOT EXISTS sql.exercises (study_week INT PRIMARY KEY,
exercises TEXT,
studied BOOLEAN
);

CREATE TABLE IF NOT EXISTS sql.lectures (study_week INT PRIMARY KEY,
content TEXT,
lecture TEXT,
studied BOOLEAN
);

DESC;

INSERT INTO
    sql.lectures
VALUES
    (
        1,
        'intro, query, ingest csv, CLI, dbeaver, table, select',
        '00-04',
        TRUE
    ),
    (
        2,
        'filtering, CRUD, conditionals, sorting, functions, grouping',
        '05-08',
        TRUE
    ),
    (
        3,
        'grouping, strings, regexp, set operations, performing joins, querying multiple tables',
        '09-11',
        FALSE
    ),
    (
        4,
        'window functions, CTEs, connect duckdb to Python, data security, SQL injection',
        '12-14',
        FALSE
    ),
    (
        5,
        'duckdb tips and tricks, repetition',
        '15-16',
        TRUE
    ),
    (6, 'exam', '17', FALSE);

INSERT INTO
    sql.exercises
VALUES
    (1, '0', TRUE),
    (2, '1', TRUE),
    (3, '2', TRUE),
    (4, '3', TRUE),
    (5, 'old exam', TRUE);

   
SELECT
	*
FROM
	sql.lectures;

--
SELECT
	*
FROM
	sql.exercises;


-- innan vi uppdaterar week 4 och 6 så selectar vi dom för att vara säkra
SELECT
	*
FROM
	sql.lectures
WHERE
	study_week IN(4, 6);

-- kör sedan en uppdate som muterar datan - med UPDATE och SET
UPDATE
	sql.lectures
SET
	studied = TRUE
WHERE
	study_week IN (4, 6);


-- söka i vår kursplanering - vilket content har vi?
-- %strings% kommer ge resultatet med ordet strings, oberoende vad som finns innan o efter.
-- matchar dock strings case sensative (det måste vara skrivet exakt så)
SELECT
	*
FROM
	sql.lectures
WHERE
	content LIKE '%strings%';

-- make match insensative (gör den till lower så att den matchas oberoende case.)
SELECT
	*
FROM
	sql.lectures
WHERE
	LOWER(content) LIKE '%strings%';

-- kan använda 'ILIKE' istället för LOWER, den bortser från upper/ lower case
SELECT
	*
FROM
	sql.lectures
WHERE
	content ILIKE '%strings%';

-- join lectures och exercises
-- tittar på kolumnen study_week om vi har någon matchning 
-- högra tabellen (sql.exercises) så får vi NULL där det inte finns data som matchar vänstra
SELECT
	*
FROM
	sql.lectures l
LEFT JOIN sql.exercises e ON
	l.study_week = e.study_week;

-- left join
SELECT
	l.study_week, l.content, l.lecture, e.exercises 
FROM
	sql.lectures l
LEFT JOIN sql.exercises e ON
	l.study_week = e.study_week;

-- right join -> blir inga NULLS då vi utgår ifrån den högra som bara har 5 rader, så alla finns i vänstra.
SELECT
	*
FROM
	sql.lectures l
RIGHT JOIN sql.exercises e ON
	l.study_week = e.study_week;

-- inner join (intersection) -> det som är gemensamt mellan dom båda tabellerna.
SELECT
	*
FROM
	sql.lectures l
INNER JOIN sql.exercises e ON
	l.study_week = e.study_week;


