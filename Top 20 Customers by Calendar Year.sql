SELECT *
FROM (
	SELECT substr(fp, 1, 4) AS Year, Customer, SUM(Amount) AS Spend, RANK() OVER (
		PARTITION BY substr(fp, 1, 4)
		ORDER BY SUM(Amount) DESC
	) AS Ranking
	FROM joa_data
	WHERE GLAccount NOT LIKE "2%"
	GROUP BY Year, Customer
	ORDER BY Year DESC, Spend DESC
)
WHERE Ranking <= 20