-- View cleaned dataset
SELECT *
FROM layoffs_staging1;


-- Maximum layoffs and layoff percentage
SELECT MAX(total_laid_off) AS max_laid_off,
       MAX(percentage_laid_off) AS max_percentage_laid_off
FROM layoffs_staging1;


-- Companies with 100% layoffs
SELECT *
FROM layoffs_staging1
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;


-- Total layoffs by company
SELECT company,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging1
GROUP BY company
ORDER BY total_laid_off DESC;


-- Dataset date range
SELECT MIN(`date`) AS start_date,
       MAX(`date`) AS end_date
FROM layoffs_staging1;


-- Total layoffs by industry
SELECT industry,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging1
GROUP BY industry
ORDER BY total_laid_off DESC;


-- Total layoffs by country
SELECT country,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging1
GROUP BY country
ORDER BY total_laid_off DESC;


-- Total layoffs by year
SELECT YEAR(`date`) AS layoff_year,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging1
GROUP BY layoff_year
ORDER BY total_laid_off DESC;


-- Total layoffs by company stage
SELECT stage,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging1
GROUP BY stage
ORDER BY total_laid_off DESC;


-- Monthly layoffs trend
SELECT SUBSTR(`date`, 1, 7) AS month,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging1
WHERE SUBSTR(`date`, 1, 7) IS NOT NULL
GROUP BY month
ORDER BY month;


-- Rolling total layoffs by month
WITH month_total AS (
    SELECT SUBSTR(`date`, 1, 7) AS month,
           SUM(total_laid_off) AS total_off
    FROM layoffs_staging1
    WHERE SUBSTR(`date`, 1, 7) IS NOT NULL
    GROUP BY month
)

SELECT month,
       total_off,
       SUM(total_off) OVER (ORDER BY month) AS rolling_total
FROM month_total;


-- Company layoffs by year
SELECT company,
       YEAR(`date`) AS layoff_year,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging1
GROUP BY company, layoff_year
ORDER BY total_laid_off DESC;


-- Top 5 companies with highest layoffs per year
WITH company_year AS (
    SELECT company,
           YEAR(`date`) AS years,
           SUM(total_laid_off) AS total_laid_off
    FROM layoffs_staging1
    GROUP BY company, years
),

company_year_rank AS (
    SELECT *,
           DENSE_RANK() OVER (
               PARTITION BY years
               ORDER BY total_laid_off DESC
           ) AS ranking
    FROM company_year
    WHERE years IS NOT NULL
)

SELECT *
FROM company_year_rank
WHERE ranking <= 5;