-- det spelar ingen roll hur många rader dom har (dock måste dom ha lika många kolumner.)
SELECT * FROM synthetic.sales_jan
UNION
SELECT * FROM synthetic.sales_feb;

-- tar med allt som är unikt -> bara en monitor
SELECT product_name, amount FROM synthetic.sales_jan
UNION
SELECT product_name, amount FROM synthetic.sales_feb;

-- får med allt (behöver inte vara unikt.) får med två monitor
SELECT product_name, amount FROM synthetic.sales_jan
UNION ALL
SELECT product_name, amount FROM synthetic.sales_feb;

-- Får endast det som är gemensamt -> monitor 300 finns i båda resultatmängderna
SELECT product_name, amount FROM synthetic.sales_jan
INTERSECT
SELECT product_name, amount FROM synthetic.sales_feb;

-- får endas laptop och headphones från sales_jan
SELECT product_name, amount FROM synthetic.sales_jan
EXCEPT
SELECT product_name, amount FROM synthetic.sales_feb;

-- får en tom mängd, då alla datum är olika. så vi har inga lika i resultatmängderna.
SELECT * FROM synthetic.sales_jan
INTERSECT
SELECT * FROM synthetic.sales_feb;

