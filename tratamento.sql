-- Create and use the database
CREATE DATABASE Cliente;
USE Cliente;

-- 1ª Processing the database

-- Check for missing (NULL) values in key columns
SELECT *
FROM clientes
WHERE 
  `customer id` IS NULL OR
  `full name` IS NULL OR
  `date of purchase` IS NULL OR
  `age` IS NULL OR
  `State` IS NULL OR
  `MTN` IS NULL OR
  `gender` IS NULL OR
  `Customer Review` IS NULL OR
  `Data Usage` IS NULL OR
  `Number of Times Purchased` IS NULL OR
  `Subscription Plan` IS NULL OR
  `Satisfaction Rate` IS NULL OR
  `Customer Tenure in months` IS NULL OR
  `Total Revenue` IS NULL OR
  `Customer Churn Status` IS NULL;

-- Check for duplicate customer IDs
SELECT `ID do cliente`, COUNT(*) AS record_count
FROM clientes
GROUP BY `ID do cliente`
HAVING COUNT(*) > 1
LIMIT 1000;

-- Describe the table structure
DESCRIBE clientes_churn;

-- Fix encoding issue in column name
ALTER TABLE clientes_churn CHANGE COLUMN `ï»¿Customer ID` `Customer ID` TEXT;

-- Add new column for age range
ALTER TABLE clientes_churn ADD COLUMN age_range VARCHAR(50);

-- Initial incorrect update for age range (keep for reference if needed)
UPDATE clientes_churn
SET faixa_etaria = CASE
    WHEN Age < 18 THEN 'Menor que 18'
    WHEN Age BETWEEN 18 AND 24 THEN '18-24'
    WHEN Age BETWEEN 25 AND 34 THEN '25-34'
    WHEN Age BETWEEN 35 AND 44 THEN '35-44'
    WHEN Age BETWEEN 45 AND 54 THEN '45-54'
    WHEN Age BETWEEN 55 AND 64 THEN '55-64'
    WHEN Age >= 65 THEN '65 ou mais'
    ELSE 'Desconhecido'
END;

-- Check updated structure
DESCRIBE clientes_churn;

-- Disable safe updates (necessary for update without WHERE key condition)
SET SQL_SAFE_UPDATES = 0;

-- Correct update to populate the `age_range` column based on age
UPDATE clientes_churn
SET age_range = CASE
    WHEN Age < 18 THEN 'Under 18'
    WHEN Age BETWEEN 18 AND 24 THEN '18-24'
    WHEN Age BETWEEN 25 AND 34 THEN '25-34'
    WHEN Age BETWEEN 35 AND 44 THEN '35-44'
    WHEN Age BETWEEN 45 AND 54 THEN '45-54'
    WHEN Age BETWEEN 55 AND 64 THEN '55-64'
    WHEN Age >= 65 THEN '65 or older'
    ELSE 'Unknown'
END
WHERE `Customer ID` IS NOT NULL;

-- Check the populated age range column
SELECT `age_range` 
FROM clientes_churn;

-- Re-enable safe update mode
SET SQL_SAFE_UPDATES = 1;

-- Trim whitespace from the `Customer Review` column
UPDATE clientes_churn
SET `Customer Review` = TRIM(`Customer Review`);

-- View all distinct values in the `Customer Tenure in months` column
SELECT DISTINCT `Customer Tenure in months`
FROM clientes_churn
ORDER BY `Customer Tenure in months`;



	

