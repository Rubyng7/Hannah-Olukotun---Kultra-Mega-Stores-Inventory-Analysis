create database KMS_DBS;

use KMS_DBS;


1. ----Which product category had the highest sales?
 
SELECT `Product Category`, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY `Product Category`
ORDER BY Total_Sales DESC
LIMIT 1;

2. ----Top 3 and Bottom 3 regions by sales

SELECT Region, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC
LIMIT 3;

SELECT Region, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Region
ORDER BY Total_Sales ASC
LIMIT 3;

3. ----Total sales of appliances in Ontario
 
SELECT SUM(Sales) AS Appliances_Sales_Ontario
FROM orders
WHERE `Product Sub-Category` = 'Appliances' AND Province = 'Ontario';

4. ---- Bottom 10 Customers by Total Sales

SELECT `Customer Name`, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY `Customer Name`
ORDER BY Total_Sales ASC
LIMIT 10;

5.---- Shipping method with the highest total shipping cost

SELECT `Ship Mode`, SUM(`Shipping Cost`) AS Total_Shipping_Cost
FROM orders
GROUP BY `Ship Mode`
ORDER BY Total_Shipping_Cost DESC
LIMIT 1;

6.---- Most valuable customers and what they purchase
-- Top customers by total profit

SELECT `Customer Name`, SUM(Profit) AS Total_Profit
FROM orders
GROUP BY `Customer Name`
ORDER BY Total_Profit DESC
LIMIT 10;


---- Top Categories

SELECT o.`Customer Name`, o.`Product Category`, SUM(o.Sales) AS Total_Sales
FROM orders o
JOIN (
    SELECT `Customer Name`
    FROM orders
    GROUP BY `Customer Name`
    ORDER BY SUM(Profit) DESC
    LIMIT 10
) top_customers ON o.`Customer Name` = top_customers.`Customer Name`
GROUP BY o.`Customer Name`, o.`Product Category`
ORDER BY o.`Customer Name`, Total_Sales DESC;


7. ----  Which small business customer had the highest sales?

SELECT `Customer Name`, SUM(Sales) AS Total_Sales
FROM orders
WHERE `Customer Segment` = 'Small Business'
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 1;

8. ---- Corporate customer with most orders (2009–2012)

SELECT `Customer Name`, COUNT(DISTINCT `Order ID`) AS Order_Count
FROM orders
WHERE `Customer Segment` = 'Corporate'
  AND YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) BETWEEN 2009 AND 2012
GROUP BY `Customer Name`
ORDER BY Order_Count DESC
LIMIT 1;

9. ---- Most profitable consumer customer

SELECT `Customer Name`, SUM(Profit) AS Total_Profit
FROM orders
WHERE `Customer Segment` = 'Consumer'
GROUP BY `Customer Name`
ORDER BY Total_Profit DESC
LIMIT 1;

10. ---- Which customer returned items and what segment? 

SELECT `Customer Name`, `Customer Segment`, COUNT(*) AS Suspected_Returns
FROM orders
WHERE Profit < 0
GROUP BY `Customer Name`, `Customer Segment`
ORDER BY Suspected_Returns DESC;


11. ---- Was shipping cost spent appropriately based on Order Priority?
-- Check average shipping cost by shipping method and order priority:

SELECT `Order Priority`, `Ship Mode`, 
       COUNT(*) AS Order_Count,
       AVG(`Shipping Cost`) AS Avg_Shipping_Cost
FROM orders
GROUP BY `Order Priority`, `Ship Mode`
ORDER BY `Order Priority`, Avg_Shipping_Cost DESC;

