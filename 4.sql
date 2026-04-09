SELECT
    `year`,
    STR_TO_DATE(CONCAT(`year`, '-01-01'), '%Y-%m-%d') AS year_start_date,
    CURDATE() AS today_date,
    TIMESTAMPDIFF(
        YEAR,
        STR_TO_DATE(CONCAT(`year`, '-01-01'), '%Y-%m-%d'),
        CURDATE()
    ) AS years_difference
FROM pandemic.infectious_case_stats;