SELECT adType, fp, COUNT(DISTINCT adNumber), SUM(Amount), avg(DISTINCT Amount)
FROM (
SELECT DISTINCT adNumber, adType, fp, SUM(Amount) AS Amount
FROM joa_data
WhERE (
GLAccount NOT LIKE "2%" AND
adType IS NOT NULL
)
GROUP BY adNumber, fp
)
GROUP BY adType, fp
ORDER BY adType