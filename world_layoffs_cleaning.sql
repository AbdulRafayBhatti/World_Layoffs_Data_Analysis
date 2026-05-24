-- Create staging table
CREATE TABLE layoffs_staging LIKE layoffs;

INSERT INTO layoffs_staging
SELECT *
FROM layoffs;


-- Find duplicates using CTE
WITH duplicate_cte AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY company,
                            location,
                            industry,
                            total_laid_off,
                            percentage_laid_off,
                            `date`,
                            stage,
                            country,
                            funds_raised_millions
           ) AS row_num
    FROM layoffs_staging
)

SELECT *
FROM duplicate_cte
WHERE row_num > 1;


-- Create second staging table
CREATE TABLE layoffs_staging1 (
    company TEXT,
    location TEXT,
    industry TEXT,
    total_laid_off INT DEFAULT NULL,
    percentage_laid_off TEXT,
    `date` TEXT,
    stage TEXT,
    country TEXT,
    funds_raised_millions INT DEFAULT NULL,
    row_num INT
);


-- Insert data with row numbers
INSERT INTO layoffs_staging1
SELECT *,
       ROW_NUMBER() OVER (
           PARTITION BY company,
                        location,
                        industry,
                        total_laid_off,
                        percentage_laid_off,
                        `date`,
                        stage,
                        country,
                        funds_raised_millions
       ) AS row_num
FROM layoffs_staging;


-- Remove duplicates
SET SQL_SAFE_UPDATES = 0;

DELETE
FROM layoffs_staging1
WHERE row_num > 1;


-- Standardize company names
UPDATE layoffs_staging1
SET company = TRIM(company);


-- Standardize industry names
UPDATE layoffs_staging1
SET industry = 'Crypto'
WHERE industry LIKE '%Crypto%';


-- Standardize country names
UPDATE layoffs_staging1
SET country = TRIM(TRAILING '.' FROM country);


-- Convert date format
UPDATE layoffs_staging1
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging1
MODIFY COLUMN `date` DATE;


-- Handle blank industry values
UPDATE layoffs_staging1
SET industry = NULL
WHERE industry = '';


-- Fill missing industry values
UPDATE layoffs_staging1 t1
JOIN layoffs_staging1 t2
    ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
  AND t2.industry IS NOT NULL;


-- Remove unnecessary rows
DELETE
FROM layoffs_staging1
WHERE total_laid_off IS NULL
  AND percentage_laid_off IS NULL;


-- Drop helper column
ALTER TABLE layoffs_staging1
DROP COLUMN row_num;


-- Final cleaned dataset
SELECT *
FROM layoffs_staging1;