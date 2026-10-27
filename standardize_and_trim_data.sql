USE world_layoffs;

-- Check distinct industries matching Crypto variations
SELECT DISTINCT industry 
FROM layoffs_staging5 
WHERE industry LIKE 'Crypto%';

-- Update industry variations to a standardized name
UPDATE layoffs_staging5 
SET industry = 'Crypto' 
WHERE industry LIKE 'Crypto%';

-- Trim whitespace from company names
SELECT DISTINCT company, TRIM(company) 
FROM layoffs_staging2;

UPDATE layoffs_staging2 
SET company = TRIM(company);
