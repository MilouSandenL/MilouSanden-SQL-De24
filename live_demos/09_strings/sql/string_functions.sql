SELECT * FROM staging.sql_glossary;

-- ger oss index 1 och 2, 2 och 5 (inklusive dom imellan), sedan sista indexet
SELECT
	'SQL word' AS type, -- kommer på varje rad, för att kunna organisera var ifrån saker kommer när vi arbetar med flera olika.
	sql_word,
	sql_word[:2], -- (inlusive 1)
	sql_word[2:5], -- (inklusive 1, 3, 4)
	sql_word[-1]
FROM
	staging.sql_glossary;

-- konkatinerar stränar. här hej + mellanslag + de24. gör dom till Hej DE24
SELECT
	UPPER(SUBSTR('hej', 1, 1)) || 'ej' || ' ' || UPPER('de24');

-- rensa sql_word (nästlad funktion) -> ta bort mellanslag med trim, stora bokstäver med upper, = innersta funktionen fungerar först.
SELECT
	sql_word,
	UPPER(TRIM(sql_word)) AS sql_word
FROM
	staging.sql_glossary;

-- försöker ta bort för många mellanslag
SELECT
	REGEXP_REPLACE(TRIM(description), ' +', ' ', 'g'),
	REGEXP_REPLACE(TRIM(description), ' +', ' ', 'g')
FROM
	staging.sql_glossary;
	
