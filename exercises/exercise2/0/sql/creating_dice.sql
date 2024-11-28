-- generera 10 rader med tärningsslag
CREATE TABLE IF NOT EXISTS dice AS
SELECT
	CAST(RANDOM() * 6 + 1 AS INT) AS roll
FROM
	range(10);
	
SELECT * FROM dice;

-- beräkna genomsnittet av att slå en 6a. (0,1)
SELECT
	AVG(CASE WHEN roll = 6 THEN 1 ELSE 0 END) AS average_six
FROM
	dice;
	
-- generera 100 rader och beräkna genomsnittet av att få en sexa (0.13)
INSERT
	INTO
	dice
SELECT
	CAST(RANDOM() * 6 + 1 AS INT) AS roll
FROM
	range(90);
-- 
SELECT
	AVG(CASE WHEN roll = 6 THEN 1 ELSE 0 END) AS average_six
FROM
	dice;
	
-- upprepa exprimentet med 1000(0.1577), 10 000(0.1645, 100 000, 1 000 000 slag.
INSERT
	INTO
	dice
SELECT
	CAST(RANDOM() * 6 + 1 AS INT) AS roll
FROM
	range(990);
	
-- 
SELECT
	AVG(CASE WHEN roll = 6 THEN 1 ELSE 0 END) AS average_six
FROM
	dice;
	
INSERT
	INTO
	dice
SELECT
	CAST(RANDOM() * 6 + 1 AS INT) AS roll
FROM
	range(9010);
	
SELECT
	AVG(CASE WHEN roll = 6 THEN 1 ELSE 0 END) AS average_six
FROM
	dice;
	
-- vadär det teoretiska medelvärdet? (0.1667)
SELECT
	AVG(CASE WHEN roll = 6 THEN 1 ELSE 0 END) AS experimental_average,
	1.0 / 6 AS teoretical_average
FROM
	dice;