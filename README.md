# Hannah-Olukotun---Kultra-Mega-Stores-Inventory-Analysis

SQL analysis of  Kultra Mega Stores Inventory data and presentation of key insights and findings.  

## Project Topic: Kultra-Mega-Stores-Inventory-Analysis

### Project Overview
This project presents an inventory and sales analysis of Kultra Mega Stores using SQL. The focus is to generate actionable insights for business decision-making by querying a relational database containing customer orders, product categories, shipping, and profitability data.

### Data Sources
The data originates from the transactional records of Kultra Mega Stores. It includes:
- Order and Sales Records
- Product Categories and Sub-categories
- Customer Demographics
- Regional Sales Data
- Shipping Methods and Costs

### Tools Used
- [Microsoft Excel](https://www.microsoft.com/en-gb/microsoft-365/excel) – For initial data review and column alignment.
- **SQL** – For querying the relational database and generating insights, trends, and reports.

### Exploratory Data Analysis
Exploratory analysis involved:
- Profiling key tables (e.g., `orders`)
- Identifying NULLs, duplicates, and inconsistent formats
- Filtering data by segment, region, category, and time frame


### Data Analysis
SQL scripts were used to generate insights from the dataset, including:

 ##### 1. **Product Category with Highest Sales**

```sql
SELECT `Product Category`, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY `Product Category`
ORDER BY Total_Sales DESC
LIMIT 1;
```

##### 2. Top 3 and Bottom 3 Regions by Sales

```sql
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
```

##### 3. Total Sales of Appliances in Ontario

```sql
SELECT SUM(Sales) AS Appliances_Sales_Ontario
FROM orders
WHERE `Product Sub-Category` = 'Appliances' AND Province = 'Ontario';
```

##### 4. Bottom 10 Customers by Total Sales

```sql
SELECT `Customer Name`, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY `Customer Name`
ORDER BY Total_Sales ASC
LIMIT 10;
```

##### 5. Shipping Method with the Highest Total Shipping Cost

```sql
SELECT `Ship Mode`, SUM(`Shipping Cost`) AS Total_Shipping_Cost
FROM orders
GROUP BY `Ship Mode`
ORDER BY Total_Shipping_Cost DESC
LIMIT 1;
```

##### 6. Most Valuable Customers and What They Purchase

**Top Customers by Total Profit**

```sql
SELECT `Customer Name`, SUM(Profit) AS Total_Profit
FROM orders
GROUP BY `Customer Name`
ORDER BY Total_Profit DESC
LIMIT 10;
```

**Top Categories Purchased by Top Customers**

```sql
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
```

##### 7. Small Business Customer with the Highest Sales

```sql
SELECT `Customer Name`, SUM(Sales) AS Total_Sales
FROM orders
WHERE `Customer Segment` = 'Small Business'
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 1;
```

##### 8. Corporate Customer with Most Orders (2009–2012)

```sql
SELECT `Customer Name`, COUNT(DISTINCT `Order ID`) AS Order_Count
FROM orders
WHERE `Customer Segment` = 'Corporate'
  AND YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) BETWEEN 2009 AND 2012
GROUP BY `Customer Name`
ORDER BY Order_Count DESC
LIMIT 1;
```

##### 9. Most Profitable Consumer Customer

```sql
SELECT `Customer Name`, SUM(Profit) AS Total_Profit
FROM orders
WHERE `Customer Segment` = 'Consumer'
GROUP BY `Customer Name`
ORDER BY Total_Profit DESC
LIMIT 1;
```

##### 10. Customers Who Returned Items (Profit < 0) by Segment

```sql
SELECT `Customer Name`, `Customer Segment`, COUNT(*) AS Suspected_Returns
FROM orders
WHERE Profit < 0
GROUP BY `Customer Name`, `Customer Segment`
ORDER BY Suspected_Returns DESC;
```

##### 11. Shipping Cost Analysis by Order Priority

```sql
SELECT `Order Priority`, `Ship Mode`, 
       COUNT(*) AS Order_Count,
       AVG(`Shipping Cost`) AS Avg_Shipping_Cost
FROM orders
GROUP BY `Order Priority`, `Ship Mode`
ORDER BY `Order Priority`, Avg_Shipping_Cost DESC;
```

Additional insights include:
- Top and Bottom 3 regions by sales
- Total sales of appliances in Ontario
- Bottom 10 customers by total sales
- Most profitable and valuable customers
- Shipping method with highest cost
- Corporate customer with most orders (2009–2012)
- Relationship between shipping cost and order priority

### Result/Findings
- **Furniture** was the highest-grossing product category.
- **Ontario** showed strong appliance sales, suggesting regional preferences.
- **Standard Class** shipping incurred the highest cost overall.
- **Most profitable customers** were from the Consumer segment.
- Several customers with **negative profit** values indicate possible returns or shipping issues.
- **Corporate customers** showed high frequency of orders between 2009–2012, indicating sustained loyalty.

### Recommendations
- Focus marketing and promotions on high-performing regions like Ontario.
- Review shipping practices, especially in the Standard Class, for cost optimization.
- Introduce loyalty benefits for top consumer and corporate customers.
- Investigate recurring negative-profit orders to improve return policies and profit margins.

### Limitations
- The analysis is based on historical and static data; real-time trends are not captured.
- Profit loss does not indicate actual returns; assumptions are made based on negative profit.
- Data does not include inventory stock levels or warehouse performance, limiting supply chain visibility.

### References
- Internal KMS Orders Database
- SQL Documentation: [https://dev.mysql.com/doc/](https://dev.mysql.com/doc/)
