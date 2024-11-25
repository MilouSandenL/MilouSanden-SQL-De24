-- random functions (med endast random får man ett randomtal mellan 0-1)
SELECT RANDOM();

-- generete_series är en inbyggd funktion, som genererar värden.
SELECT
	*
FROM
	generate_series(10);
	
-- * 6 + 1 för att få värde mellan 1 och 6
SELECT
	FLOOR(RANDOM()* 6)+ 1 AS dices
FROM
	generate_series(10);
	