-- ===========================================
-- 1. Dataset Overview
-- ===========================================

SELECT MIN(`date`) AS start_date,
	   MAX(`date`) AS end_date
FROM layoffs_staging2;

-- ===========================================
-- 2. Company Analysis
-- ===========================================

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT company, 
       SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY company
ORDER BY total_layoffs DESC;

-- ===========================================
-- 3. Industry Analysis
-- ===========================================

SELECT industry, 
       SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY industry
ORDER BY total_layoffs DESC;

SELECT stage, 
	   SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY stage
ORDER BY total_layoffs DESC;

-- ===========================================
-- 4. Geographic Analysis
-- ===========================================

SELECT country, 
	   SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY country
ORDER BY total_layoffs DESC;

-- ===========================================
-- 5. Time Series Analysis
-- ===========================================

SELECT YEAR(`date`) AS year, 
	   SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY total_layoffs DESC;

SELECT SUBSTRING(`date`,1,7) AS `MONTH`, 
	   SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY `MONTH` ASC;

WITH Rolling_Total AS 
(
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, 
	   SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY `MONTH` ASC
)
SELECT `MONTH`, 
	   total_off, 
       SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total;

-- ===========================================
-- 6. Advanced Analysis
-- ===========================================

SELECT company, 
	   YEAR(`date`) AS year, 
       SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY company, year
ORDER BY total_layoffs DESC;

WITH Company_Year (company, year, total_laid_off) AS
(
	SELECT company, 
		   YEAR(`date`) AS year, 
		   SUM(total_laid_off) AS total_layoffs
	FROM layoffs_staging2
	GROUP BY company, year
), Company_Year_Rank AS
(
	SELECT *, DENSE_RANK() OVER(PARTITION BY year ORDER BY total_laid_off DESC) AS ranking
	FROM Company_Year
	WHERE year IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE ranking <= 5;

-- ===========================================
-- 7. Funding Efficiency Analysis
-- ===========================================
-- Excludes Post-IPO/Acquired/Unknown since "funds_raised_millions" doesn't
-- reflect real venture funding for those; floor avoids divide-by-small-number distortion.

SELECT company, industry, stage, total_laid_off, funds_raised_millions,
       ROUND(total_laid_off / NULLIF(funds_raised_millions, 0), 2) AS layoffs_per_million_raised
FROM layoffs_staging2
WHERE total_laid_off IS NOT NULL
  AND funds_raised_millions >= 50
  AND stage NOT IN ('Post-IPO', 'Acquired', 'Unknown')
ORDER BY layoffs_per_million_raised DESC
LIMIT 15;

-- ===========================================
-- 8. Funding Efficiency by Stage (controls for sample size)
-- ===========================================
SELECT stage,
       COUNT(*) AS num_companies,
       ROUND(AVG(total_laid_off / NULLIF(funds_raised_millions, 0)), 2) AS avg_layoffs_per_million
FROM layoffs_staging2
WHERE total_laid_off IS NOT NULL
  AND funds_raised_millions >= 50
  AND stage NOT IN ('Post-IPO', 'Acquired', 'Unknown')
GROUP BY stage
ORDER BY avg_layoffs_per_million DESC;









