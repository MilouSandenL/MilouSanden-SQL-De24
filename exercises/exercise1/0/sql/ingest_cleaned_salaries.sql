CREATE TABLE 
    IF NOT EXISTS cleaned_salaries.duckdb AS (
SELECT 
    * 
FROM 
    read_csv_auto('data/salaries.csv')
    );