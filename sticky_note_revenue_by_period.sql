SELECT sum(Amount), fp, Product
FROM joa_data
WHERE adType LIKE "%Sticky Note%"
AND fp > "2019P09"
GROUP BY fp, Product
ORDER BY fp