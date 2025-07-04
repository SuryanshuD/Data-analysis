USE db_churn;
GO
SELECT 
    Gender, 
    COUNT(Gender) AS TotalCount,
    CAST(COUNT(Gender) AS FLOAT) / (SELECT COUNT(*) FROM dbo.stg_Churn) AS Percentage
FROM 
    dbo.stg_Churn
GROUP BY 
    Gender;
SELECT 
    Contract, 
    COUNT(Contract) AS TotalCount,
    CAST(COUNT(Contract) AS FLOAT) / (SELECT COUNT(*) FROM stg_Churn) AS Percentage
FROM 
    stg_Churn
GROUP BY 
    Contract;
SELECT 
    Customer_Status, 
    COUNT(Customer_Status) AS TotalCount, 
    SUM(Total_Revenue) AS TotalRev,
    SUM(Total_Revenue) * 100.0 / (SELECT SUM(Total_Revenue) FROM stg_Churn) AS RevPercentage
FROM 
    stg_Churn
GROUP BY 
    Customer_Status;
SELECT 
    State, 
    COUNT(State) AS TotalCount,
    CAST(COUNT(State) AS FLOAT) / (SELECT COUNT(*) FROM stg_Churn) AS Percentage
FROM 
    stg_Churn
GROUP BY 
    State
ORDER BY 
    Percentage DESC;


