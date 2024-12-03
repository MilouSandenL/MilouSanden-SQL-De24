DESC;

SELECT * FROM main.plants p;

SELECT * FROM main.plant_care pc;

-- Left join -> (ALLT som finns i vänster tabell - och det som är en match med högra, det som inte finns i högra blir NULL.)
-- det är bra att undvika att använda *- bättra att speca vad man vill ska vara med
SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight
FROM
	main.plants p
LEFT JOIN main.plant_care pc ON
	p.plant_id = pc.plant_id;
	
-- RIGHT JOIN -> (ALLT från högra, det som matchar med vänster och resten från vänster som inte matchar blir NULL.)
SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight
FROM
	main.plants p
RIGHT JOIN main.plant_care pc ON
	p.plant_id = pc.plant_id;

-- INNER JOIN -> (EXAKTA MATCHEN från båda tabellerna, får inga NULLS tillbaka)
SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight
FROM
	main.plants p
INNER JOIN main.plant_care pc ON
	p.plant_id = pc.plant_id;

-- FULL JOIN (får matcherna från båda tabellerna (en form av union) - men retrnerar även NULLS där det inte finns någon match.)
SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight
FROM
	main.plants p
FULL JOIN main.plant_care pc ON
	p.plant_id = pc.plant_id;
	
