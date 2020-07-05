SELECT adType, Year, Customer, adNumber, (SUM(Amount) / COUNT(DISTINCT adNumber)) AS Rate, SUM(Amount) AS Spend
FROM (
	SELECT DISTINCT adNumber, adType, substr(fp, 1, 4) AS Year, Customer, SUM(Amount) AS Amount
	FROM data_2019
	WHERE (
		GLAccount NOT LIKE "2%"
	)
	GROUP BY adNumber, Year, Customer
)
WHERE Customer in (
	SELECT Customer
	FROM (
		SELECT substr(fp, 1, 4) AS Year, Customer, SUM(Amount) AS Spend, RANK() OVER (
			PARTITION BY substr(fp, 1, 4)
			ORDER BY SUM(Amount) DESC
		) AS Ranking
		FROM data_2019
		WHERE GLAccount NOT LIKE "2%"
		GROUP BY Year, Customer
		ORDER BY Year DESC, Spend DESC
	)
	WHERE Ranking <= 20
)
GROUP BY Year, Customer, adType
