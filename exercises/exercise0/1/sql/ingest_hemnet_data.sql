CREATE TABLE 
    IF NOT EXISTS hemnet.duckdb AS (
SELECT
	*
FROM
	read_csv_auto('data/hemnet_data_clean.csv')
    );