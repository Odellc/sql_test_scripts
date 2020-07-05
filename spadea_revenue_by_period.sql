SELECT sum(Amount), fp, Product
FROM joa_data
WHERE Placement LIKE "%Spadea%"
AND fp > "2019P09"
GROUP BY fp, Product
ORDER BY fp