USE world_layoffs;

-- Check minimum and maximum dates
SELECT MIN(`date`), MAX(`date`) 
FROM layoffs_staging5;

-- Preview the date string conversion
SELECT `date`, STR_TO_DATE(`date`, '%m/%d/%Y') AS formatted_date 
FROM layoffs_staging5;

-- Update the column values to the converted date format
UPDATE layoffs_staging5 
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

-- Alter the table column type from text/varchar to actual DATE type
ALTER TABLE layoffs_staging5 
MODIFY COLUMN `date` DATE;
