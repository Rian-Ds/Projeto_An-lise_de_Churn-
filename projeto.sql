/* 1. Analyzing the database */

/* 1.1 Average age of churned customers */
SELECT
   AVG(`Age`) AS mean_age_churn
FROM 
    clientes_churn
WHERE 
    `Customer Churn Status` = 'Yes';


/* 1.2 Average tenure by age range */
SELECT 
    age_range,
    AVG(`Customer Tenure in months`) AS avg_tenure
FROM 
    clientes_churn
GROUP BY 
    age_range
ORDER BY 
    avg_tenure ASC;


/* 2. State with the highest churn */

/* Average tenure by state (only churned customers) */
SELECT 
    state,
    AVG(`Customer Tenure in months`) AS avg_tenure
FROM 
    clientes_churn
WHERE
    `Customer Churn Status` = 'Yes'
GROUP BY
    state
ORDER BY
    avg_tenure ASC;


/* 3. Services with the highest churn */

/* Churn rate by device type */
SELECT 
    `MTN Device` AS device,
    COUNT(*) AS total_users,
    SUM(CASE WHEN `Customer Churn Status` = 'Yes' THEN 1 ELSE 0 END) AS churn_count,
    ROUND(SUM(CASE WHEN `Customer Churn Status` = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS churn_rate
FROM 
    clientes_churn
GROUP BY 
    `MTN Device`
ORDER BY 
    churn_rate DESC;

/* Average tenure by device type */
SELECT 
    `MTN Device` AS device,
    ROUND(AVG(`Customer Tenure in months`), 2) AS avg_tenure_months,
    COUNT(*) AS total_users
FROM 
    clientes_churn
GROUP BY 
    device
ORDER BY 
    avg_tenure_months ASC;


/* 4. Gender with the highest churn */

/* Churn rate by gender and device */
SELECT 
    `MTN Device`,
    Gender,
    COUNT(*) AS total,
    SUM(CASE WHEN `Customer Churn Status` = 'Yes' THEN 1 ELSE 0 END) AS churn_total,
    ROUND(SUM(CASE WHEN `Customer Churn Status` = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM 
    clientes_churn
GROUP BY 
    Gender, `MTN Device`
ORDER BY 
    churn_rate DESC;

/* Average tenure by gender */
SELECT 
    Gender,
    ROUND(AVG(`Customer Tenure in months`), 2) AS avg_tenure
FROM 
    clientes_churn
GROUP BY 
    Gender;

/* Gender with highest average tenure */
SELECT 
    Gender,
    AVG(`Customer Tenure in months`) AS avg_tenure
FROM 
    clientes_churn
GROUP BY 
    Gender
ORDER BY 
    avg_tenure DESC
LIMIT 1;


/* 5. Satisfaction most associated with churn */

/* Most common satisfaction rate among churned customers */
SELECT 
    `Satisfaction Rate`,
    COUNT(*) AS num_customers
FROM 
    clientes_churn
WHERE 
    `Customer Churn Status` = 'Yes'
GROUP BY 
    `Satisfaction Rate`
ORDER BY 
    num_customers DESC
LIMIT 1;

/* Average tenure by satisfaction rate */
SELECT 
    `Satisfaction Rate`,
    AVG(`Customer Tenure in months`) AS avg_tenure
FROM 
    clientes_churn
GROUP BY 
    `Satisfaction Rate`
ORDER BY 
    avg_tenure ASC;


/* 6. Do buyers stay longer? */

/* Average tenure by number of purchases */
SELECT
    `Number of Times Purchased` AS shopping,
    COUNT(*) AS number_buyers,
    AVG(`Customer Tenure in months`) AS average_stay
FROM 
    clientes_churn
GROUP BY 
    shopping
ORDER BY
    shopping DESC;

/* Churn percentage by number of purchases */
SELECT 
    `Number of Times Purchased` AS shopping,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN `Customer Churn Status` = 'Yes' THEN 1 ELSE 0 END) AS churn_count,
    ROUND(100.0 * SUM(CASE WHEN `Customer Churn Status` = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_percent
FROM 
    clientes_churn
GROUP BY 
    shopping
ORDER BY 
    shopping ASC;


/* 7. Plans with higher churn */

/* Churn rate by subscription plan */
SELECT 
    `Subscription Plan` AS plan, 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN `Customer Churn Status` = 'Yes' THEN 1 ELSE 0 END) AS churn_total,
    ROUND(
        (SUM(CASE WHEN `Customer Churn Status` = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 
        2
    ) AS churn_rate
FROM 
    clientes_churn
GROUP BY 
    `Subscription Plan`
ORDER BY 
    churn_rate DESC;

/* Average tenure by subscription plan */
SELECT 
    `Subscription Plan` AS plan,
    ROUND(AVG(`Customer Tenure in months`), 2) AS avg_tenure
FROM 
    clientes_churn
GROUP BY 
    `Subscription Plan`
ORDER BY 
    avg_tenure DESC;


/* 8. Reasons for churn by state */

/* Most frequent churn reasons by state */
SELECT 
    `State`, 
    `Reasons for Churn`, 
    COUNT(*) AS total_churn
FROM 
    clientes_churn
GROUP BY 
    `State`, 
    `Reasons for Churn`
ORDER BY 
    total_churn DESC;
