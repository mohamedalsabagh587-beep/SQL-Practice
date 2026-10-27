USE world_layoffs;

-- Check blank values for a specific company
SELECT * 
FROM layoffs_staging5 
WHERE company = 'Airbnb';

-- Convert empty string blanks to actual NULL values
UPDATE layoffs_staging5 
SET industry = NULL 
WHERE industry = '';

-- Preview the self-join to match NULL rows with valid rows of the same company
SELECT t1.industry, t2.industry 
FROM layoffs_staging5 t1 
JOIN layoffs_staging5 t2 
  ON t1.company = t2.company 
WHERE t1.industry IS NULL 
  AND t2.industry IS NOT NULL;

-- Execute the update using a self-join to fill in the missing industries
UPDATE layoffs_staging5 t1 
JOIN layoffs_staging5 t2 
  ON t1.company = t2.company 
SET t1.industry = t2.industry 
WHERE t1.industry IS NULL 
  AND t2.industry IS NOT NULL;
