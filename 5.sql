DELIMITER //

CREATE FUNCTION pandemic.year_diff_from_now(input_year INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(
        YEAR,
        STR_TO_DATE(CONCAT(input_year, '-01-01'), '%Y-%m-%d'),
        CURDATE()
    );
END//

DELIMITER ;

SELECT
    `year`,
    STR_TO_DATE(CONCAT(`year`, '-01-01'), '%Y-%m-%d') AS year_start_date,
    CURDATE() AS today_date,
    pandemic.year_diff_from_now(`year`) AS years_difference
FROM pandemic.infectious_case_stats;