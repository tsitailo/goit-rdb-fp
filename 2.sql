CREATE TABLE pandemic.entities (
    entity_id INT AUTO_INCREMENT PRIMARY KEY,
    entity_name TEXT NOT NULL,
    code TEXT,
    UNIQUE KEY uq_entities_entity_code (entity_name(255), code(50))
);

CREATE TABLE pandemic.infectious_case_stats (
    stat_id INT AUTO_INCREMENT PRIMARY KEY,
    entity_id INT NOT NULL,
    year INT NOT NULL,
    number_yaws TEXT,
    polio_cases INT,
    cases_guinea_worm INT,
    number_rabies DOUBLE,
    number_malaria TEXT,
    number_hiv TEXT,
    number_tuberculosis TEXT,
    number_smallpox TEXT,
    number_cholera_cases TEXT,
    CONSTRAINT fk_infectious_case_stats_entity
        FOREIGN KEY (entity_id) REFERENCES pandemic.entities(entity_id)
);

INSERT INTO pandemic.entities (entity_name, code)
SELECT DISTINCT Entity, Code
FROM pandemic.infectious_cases;

INSERT INTO pandemic.infectious_case_stats (
    entity_id,
    year,
    number_yaws,
    polio_cases,
    cases_guinea_worm,
    number_rabies,
    number_malaria,
    number_hiv,
    number_tuberculosis,
    number_smallpox,
    number_cholera_cases
)
SELECT
    e.entity_id,
    ic.Year,
    ic.Number_yaws,
    ic.polio_cases,
    ic.cases_guinea_worm,
    ic.Number_rabies,
    ic.Number_malaria,
    ic.Number_hiv,
    ic.Number_tuberculosis,
    ic.Number_smallpox,
    ic.Number_cholera_cases
FROM pandemic.infectious_cases ic
JOIN pandemic.entities e
    ON e.entity_name = ic.Entity
   AND (e.code <=> ic.Code);


SELECT COUNT(*) FROM pandemic.infectious_case_stats;