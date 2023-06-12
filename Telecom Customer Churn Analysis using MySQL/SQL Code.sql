-- 1. What is the total customer count in the telecom industry?

SELECT 
    count(distinct (CustomerID)) as Total_Customers
FROM
    new_schema.`telecom customer churn data`;
    
    
-- 2. Perform churn classification on the total count of churners based on their age

SELECT 
    CASE
        WHEN Age >= 18 AND Age <= 25 THEN '18-25'
        WHEN Age > 25 AND Age <= 35 THEN '26-35'
        WHEN Age > 35 AND Age <= 45 THEN '36-45'
        WHEN Age > 45 AND Age <= 55 THEN '46-55'
        ELSE '55+'
    END AS AgeGroup,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY AgeGroup
ORDER BY ChurnRate DESC;


-- 3. Compute the aggregate count of churners based on their gender

SELECT 
    Gender,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY Gender
ORDER BY ChurnRate DESC;


-- 4. Compute the aggregate count of churners based on their marital status

SELECT 
    CASE
        WHEN Married = 'Yes' THEN 'Married'
        WHEN Married = 'No' THEN 'Single'
        ELSE 'Unknown'
    END AS MaritalStatus,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY MaritalStatus
ORDER BY ChurnRate DESC;


-- 5. Compute the aggregate count of churners within the top 5 cities

SELECT 
    City,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY City
ORDER BY ChurnedCustomers DESC
LIMIT 5;


-- 6. Compute the aggregate count of churners based on their tenure

SELECT
    CASE
        WHEN TenureinMonths < 6 THEN 'Less than 6 Months'
        WHEN TenureinMonths >= 6 AND TenureinMonths <= 12 THEN '6 Months to 1 Year'
        WHEN TenureinMonths > 12 AND TenureinMonths <= 24 THEN '1 Year'
        WHEN TenureinMonths > 24 AND TenureinMonths <= 36 THEN '2 Years'
        WHEN TenureinMonths > 36 AND TenureinMonths <= 48 THEN '3 Years'
        WHEN TenureinMonths > 48 AND TenureinMonths <= 60 THEN '4 Years'
        WHEN TenureinMonths > 60 AND TenureinMonths <= 72 THEN '5 Years'
        WHEN TenureinMonths > 72 THEN '6 Years'
    END AS TenureGroup,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN CustomerStatus = 'Churned' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE WHEN CustomerStatus = 'Churned' THEN 1 ELSE 0 END) / COUNT(*), 2), '%') AS ChurnRate
FROM
   new_schema.`telecom customer churn data`
GROUP BY
    TenureGroup
ORDER BY
    ChurnedCustomers desc;


-- 7. Compute the aggregate count of churners based on internet type

SELECT 
    InternetType,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY InternetType
ORDER BY ChurnRate DESC;


-- 8. Identify the churners who subscribed to internet service

SELECT 
    CASE
        WHEN InternetService = 'Yes' THEN 'Internet Subscribed'
        WHEN InternetService = 'No' THEN 'No Internet'
        ELSE 'Unknown'
    END AS InternetService,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY InternetService
ORDER BY ChurnRate DESC;


-- 9. Perform churn classification on the total count of churners based on the contract type

SELECT 
    Contract,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY Contract
ORDER BY ChurnRate DESC;


-- 10. Perform churn classification on the total count of churners based on the offer

SELECT 
    Offer,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY Offer
ORDER BY ChurnedCustomers DESC;


-- 11. Compute the aggregate count of churners who subscribed to phone service

SELECT 
    PhoneService,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY PhoneService
ORDER BY ChurnRate DESC;




-- 12. Perform churn classification on the total count of churners based on payment method

SELECT 
    PaymentMethod,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY PaymentMethod
ORDER BY ChurnRate DESC;



-- 13. Perform customer status classification on the total count of churners

SELECT 
    CustomerStatus,
    CONCAT(ROUND(SUM(TotalRevenue) / (SELECT 
                            SUM(TotalRevenue)
                        FROM
                            new_schema.`telecom customer churn data`) * 100,
                    2),
            '%') AS RevenuePercentage
FROM
    new_schema.`telecom customer churn data`
GROUP BY CustomerStatus
ORDER BY RevenuePercentage DESC;


-- 14. Perform churn classification on the total count of churners based on churn reason and churn category

SELECT 
    ChurnReason, ChurnCategory,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY ChurnReason, ChurnCategory
ORDER BY ChurnRate DESC;


-- 15. Compute the total count of churners who subscribed to the online security feature

SELECT 
    OnlineSecurity,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY OnlineSecurity
ORDER BY ChurnRate DESC
;


-- 16. Calculate the aggregate number of churners who utilized the online backup service

SELECT 
    OnlineBackup,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY OnlineBackup
ORDER BY ChurnRate DESC;


-- 17. Compute the total count of churners who enrolled in the device protection plan

SELECT 
    DeviceProtectionPlan,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY DeviceProtectionPlan
ORDER BY ChurnRate DESC
;


-- 18. Calculate the aggregate number of churners who subscribed to premium technical support services

SELECT 
    PremiumTechSupport,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY PremiumTechSupport
ORDER BY ChurnRate DESC
;


-- 19. Compute the total count of churners who had access to the Streaming TV feature

SELECT 
    StreamingTV,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY StreamingTV
ORDER BY ChurnRate DESC;
;


-- 20. Calculate the total count of churners who utilized the Streaming Music feature

SELECT 
    StreamingMusic,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY StreamingMusic
ORDER BY ChurnRate DESC;
;


-- 21. Compute the aggregate count of churners who subscribed to Unlimited Data

SELECT 
    UnlimitedData,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY UnlimitedData
ORDER BY ChurnRate DESC;
;


-- 22. Determine the count of churners who opted for Paperless Billing

SELECT 
    PaperlessBilling,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN CustomerStatus = 'Churned' THEN 1
        ELSE 0
    END) AS ChurnedCustomers,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY PaperlessBilling
ORDER BY ChurnRate DESC
;


-- 23. Perform churn classification on the total number of churners based on the Churn Category

SELECT 
    ChurnCategory,
    CONCAT('$',
            FORMAT(SUM(CASE
                    WHEN CustomerStatus = 'Churned' THEN TotalRevenue
                    ELSE 0
                END),
                2)) AS ChurnedRevenue,
    CONCAT(ROUND(100 * SUM(CASE
                        WHEN CustomerStatus = 'Churned' THEN 1
                        ELSE 0
                    END) / COUNT(*),
                    2),
            '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY ChurnCategory
ORDER BY ChurnRate DESC;



-- 24. Categorize the total number of churners according to their internet type

SELECT
    InternetType,
    ChurnCategory,
    CONCAT(ROUND(100 * SUM(CASE WHEN CustomerStatus = 'Churned' THEN 1 ELSE 0 END) / COUNT(*), 2), '%') AS ChurnRate
FROM
    new_schema.`telecom customer churn data`
GROUP BY
    InternetType, ChurnCategory
HAVING
    ChurnCategory = 'Competitor';
    
    
