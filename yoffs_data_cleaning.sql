use world_layoffs;



SELECT * 
FROM world_layoffs.layoffs_staging5;

with dupacate_cte as
(
select *, 
row_number() 
over( partition by company, location, industry,
    total_laid_off,percentage_laid_off,
	`date`, stage, country, funds_raised_millions ) row_num
from layoffs_staging5
)
select *
from dupacate_cte 
where row_num > 1;

select distinct company, trim(company) 
from layoffs_staging5
;

-- 
UPDATE layoffs_staging5
SET company = TRIM(company);

-- Check distinct industries:
SELECT DISTINCT industry
FROM layoffs_staging5
ORDER BY 1;

-- Standardize 'Crypto' variants:
UPDATE layoffs_staging5
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';




-- Check distinct countries:
SELECT DISTINCT country
FROM layoffs_staging5
ORDER BY 1;
 
 
 
 -- Convert string format using STR_TO_DATE:
UPDATE layoffs_staging5
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

-- Change column data type permanently:
ALTER TABLE layoffs_staging5
MODIFY COLUMN `date` DATE;
 
-- Clean trailing dots:
UPDATE layoffs_staging5
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';


UPDATE layoffs_staging5
SET industry = NULL
WHERE industry = '' OR industry = ' ';


SELECT t1.company, t1.industry, t2.industry
FROM layoffs_staging5 t1
JOIN layoffs_staging5 t2
  ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
  AND t2.industry IS NOT NULL;


UPDATE layoffs_staging5 t1
JOIN layoffs_staging5 t2
    ON t1.company = t2.company
    AND t1.location = t2.location
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

DELETE
FROM layoffs_staging5
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;



ALTER TABLE layoffs_staging5
DROP COLUMN row_num;





















SELECT * 
FROM world_layoffs.layoffs_staging5;

