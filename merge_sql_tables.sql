CREATE TABLE joa_data
AS 
SELECT * FROM data_2015
UNION ALL
SELECT * FROM data_2016
UNION ALL
SELECT * FROM data_2017
UNION ALL
SELECT * FROM data_2018
UNION ALL
SELECT * FROM data_2019
UNION ALL
SELECT * FROM data_2020;