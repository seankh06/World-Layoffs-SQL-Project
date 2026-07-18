SET GLOBAL local_infile = ON;

CREATE TABLE world_layoffs.layoffs (
    company TEXT,
    location TEXT,
    industry TEXT,
    total_laid_off INT DEFAULT NULL,
    percentage_laid_off TEXT,
    `date` TEXT,
    stage TEXT,
    country TEXT,
    funds_raised_millions INT DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/Users/sean/Documents/MySQL-YouTube-Series-main/layoffs.csv'
INTO TABLE layoffs
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    company,
    location,
    industry,
    total_laid_off,
    percentage_laid_off,
    `date`,
    stage,
    country,
    funds_raised_millions
);

SELECT count(*) 
FROM layoffs;