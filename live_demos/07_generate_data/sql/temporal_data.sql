-- temporal -> (tid) innebär datum och tid.
SELECT
	*
FROM
	generate_series(DATE '2024-11-01',
	DATE '2024-11-30',
	INTERVAL 1 day);
	
