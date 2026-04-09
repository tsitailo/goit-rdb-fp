SELECT
    e.entity_id,
    e.entity_name AS Entity,
    e.code AS Code,
    AVG(CAST(NULLIF(s.number_rabies, '') AS DECIMAL(18, 4))) AS avg_number_rabies,
    MIN(CAST(NULLIF(s.number_rabies, '') AS DECIMAL(18, 4))) AS min_number_rabies,
    MAX(CAST(NULLIF(s.number_rabies, '') AS DECIMAL(18, 4))) AS max_number_rabies,
    SUM(CAST(NULLIF(s.number_rabies, '') AS DECIMAL(18, 4))) AS sum_number_rabies
FROM pandemic.entities e
JOIN pandemic.infectious_case_stats s
    ON s.entity_id = e.entity_id
WHERE NULLIF(s.number_rabies, '') IS NOT NULL
GROUP BY e.entity_id, e.entity_name, e.code
ORDER BY avg_number_rabies DESC
LIMIT 10;