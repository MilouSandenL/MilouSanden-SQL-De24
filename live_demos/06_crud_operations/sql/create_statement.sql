-- DDL -> data definition language. Create. 
-- flera schemas i databasen, varje databas innehåller flera tabeller.
-- tabellerna hamnar i main-schema om man inte specifierar var dom ska hamna.
-- lägger till IF NOT EXISTIS för att den inte ska klaga, och sedan krascha om vi försöker spara två lika data.
CREATE SCHEMA IF NOT EXISTS database;

SELECT * FROM information_schema.schemata;

-- för att få auto incremence sekvenser. id ska öka med 1 varje gång en ny rad data kommer in.
CREATE SEQUENCE IF NOT EXISTS id_duckdb_sequence START 1;

SELECT * FROM pg_catalog.pg_sequences;

-- går in i schemat database (som vi skapade innan), för att skapa tabellen duckdb. alltså inte under main.
-- sätter default för att ha ett id värde, om vi inte specar id värde.
-- nextval (next value), ökar för varje värde.
CREATE TABLE IF NOT EXISTS database.duckdb (
	id INTEGER DEFAULT nextval ('id_duckdb_sequence'),
	word STRING,
	description STRING
);


