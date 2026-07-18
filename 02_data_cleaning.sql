-- ===========================================
-- Data Cleaning Project - World Layoffs
-- ===========================================

-- Disable safe updates 
SET SQL_SAFE_UPDATES = 0;

-- Remove old staging tables if they exist
DROP TABLE IF EXISTS layoffs_staging;
DROP TABLE IF EXISTS layoffs_staging2;

-- Create a staging table
CREATE TABLE layoffs_staging LIKE layoffs;

INSERT INTO layoffs_staging
SELECT *
FROM layoffs;

-- ===========================================
-- 1. Identifying and Deleting Duplicate Rows
-- ===========================================

-- Identify duplicate records before removing them
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location, industry, total_laid_off, percentage_laid_off, `date`, 
stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

-- Create a second staging table
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
	PARTITION BY company,location, industry, 
				 total_laid_off, percentage_laid_off, 
                 `date`, stage, country, funds_raised_millions
	) AS row_num
FROM layoffs_staging;

-- Remove  duplicate rows
DELETE 
FROM layoffs_staging2
WHERE row_num > 1;

-- ===========================================
-- 2. Standardizing Data
-- ===========================================

-- Remove leading and trailing spaces
UPDATE layoffs_staging2
SET company = TRIM(company); 

-- Standardize industry names
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- Remove trailing periods from country names
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- Convert dates to proper DATE format
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

-- ===========================================
-- 3. Handling NULL and Blank Values
-- ===========================================

-- Replace blank industries with NULL
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

-- Populate missing industries using existing company records
UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL;

-- Remove rows where both layoff metrics are missing
DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- ===========================================
-- 4. Removing Unnecessary Columns
-- ===========================================

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

-- ===========================================
-- Final Cleaned Dataset
-- ===========================================

SELECT *
FROM layoffs_staging2;

-- Re-enable safe updates 
SET SQL_SAFE_UPDATES = 1;