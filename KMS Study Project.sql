select* from [KMS Study]

SELECT TOP 1 Product_Category, SUM(Sales) AS TotalSales
FROM [KMS Study]
GROUP BY Product_Category
ORDER BY TotalSales DESC;

-- 2. Top 3 and Bottom 3 regions in terms of sales
-- Top 3
SELECT TOP 3 Region, SUM(Sales) AS TotalSales
FROM [KMS study]
GROUP BY Region
ORDER BY TotalSales DESC;

-- Bottom 3
SELECT TOP 3 Region, SUM(Sales) AS TotalSales
FROM [KMS study]
GROUP BY Region
ORDER BY TotalSales ASC;

-- 3. Total sales of appliances in Ontario
SELECT SUM(Sales) AS ApplianceSales
FROM [KMS study]
WHERE Product_Category = 'Appliances' AND Region = 'Ontario';

4. Bottom 10 customers by total sales

SELECT TOP 10 Customer_Name, SUM(Sales) AS TotalSales
FROM [KMS study]
GROUP BY Customer_Name
ORDER BY TotalSales ASC;

-- 5. Shipping method with the highest total shipping cost
SELECT TOP 1 Ship_Mode, SUM(Shipping_Cost) AS TotalShippingCost
FROM [KMS STUDY]
GROUP BY Ship_Mode
ORDER BY TotalShippingCost DESC;


-- Case Scenario II
-- 6. Most valuable customers and products they purchase
SELECT TOP 10 Customer_Name, Product_Name, SUM(Sales) AS TotalSales
FROM [KMS STUDY]
GROUP BY Customer_Name, Product_Name
ORDER BY TotalSales DESC;

-- 7. Highest spending small business customer
SELECT TOP 1 Customer_Name, SUM(Sales) AS TotalSales
FROM [KMS STUDY]
WHERE Customer_Segment = 'Small Business'
GROUP BY Customer_Name
ORDER BY TotalSales DESC;


-- 8. Corporate customer with the most number of orders between 2009–2012
SELECT TOP 1 Customer_Name, COUNT(Order_ID) AS TotalOrders
FROM [KMS STUDY]
WHERE Customer_Segment = 'Corporate' AND YEAR(Order_Date) BETWEEN 2009 AND 2012
GROUP BY Customer_Name
ORDER BY TotalOrders DESC;

-- 9. Most profitable consumer customer
SELECT TOP 1 Customer_Name, SUM(Profit) AS TotalProfit
FROM [KMS STUDY]
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Name
ORDER BY TotalProfit DESC;

-- 10. Customers who returned items and their segment
select* from Order_Status

SELECT DISTINCT k.Customer_Name, k.Customer_Segment
FROM [KMS STUDY] k
JOIN Order_Status o ON k.Order_ID = o.Order_ID
WHERE o.Status = 'Returned';


-- 11. Analyzing shipping cost and efficiency
SELECT
  Order_Priority,
  Ship_Mode,
  COUNT(Order_ID) AS OrderCount,
  SUM(Shipping_Cost) AS TotalShippingCost,
  AVG(DATEDIFF(day, Order_Date, Ship_Date)) AS AvgShipDays
FROM [KMS STUDY]
GROUP BY Order_Priority, Ship_Mode
ORDER BY Order_Priority, Ship_Mode;















