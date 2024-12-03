DESC;

-- film_id, title
SELECT * FROM main.film f;
-- film_id, actor_id
SELECT * FROM main.film_actor fa;
-- actor_id, first_name, last_name
SELECT * FROM main.actor a;

-- Med NULLS finns det olika strategier - "fylla dom med ett kvalificerat värde", eller "kasta dom värderna beroende på vad man är ute efter.", "man kan fylla dom med medelvärde, median, eller ex: info saknas osv."
-- Q: vilka skådespelare spelar i vilka filmer?
SELECT
	a.first_name,
	a.last_name,
	f.title AS film_title
FROM
	main.film f
LEFT JOIN main.film_actor fa ON
	f.film_id = fa.film_id 
LEFT JOIN main.actor a ON a.actor_id = fa.actor_id;