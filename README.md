# Hannah-Olukotun---Kultra-Mega-Stores-Inventory-Analysis
SQL analysis of  Kultra Mega Stores Inventory data and presentation of key insights and  findings.  

## Project Topic: Kultra-Mega-Stores-Inventory-Analysis

## Project Overview
This project presents an inventory and sales analysis of Kultra Mega Stores using SQL. The focus is to generate actionable insights for business decision-making by querying a relational database containing customer orders, product categories, shipping, and profitability data.

## Data Sources
The data originates from the transactional records of Kultra Mega Stores. It includes:
- Order and Sales Records
- Product Categories and Sub-categories
- Customer Demographics
- Regional Sales Data
- Shipping Methods and Costs

## Tools Used
- [Microsoft Excel](https://www.microsoft.com/en-gb/microsoft-365/excel) – For initial data review and column alignment.
- **SQL** – For querying the relational database and generating insights, trends, and reports.

## Exploratory Data Analysis
Exploratory analysis involved:
- Profiling key tables (e.g., `orders`)
- Identifying NULLs, duplicates, and inconsistent formats
- Filtering data by segment, region, category, and time frame

### Tools Used
- MS Excel for Data Cleaning [Download here](https://www.microsoft.com/en-gb/microsoft-365/excel)
- SQL for querying database
  -  for generating insight

### Exploratory Data Analysis


### Data Analysis
```
SELECT `Product Category`, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY `Product Category`
ORDER BY Total_Sales DESC
LIMIT 1;

```



## Data Analysis
SQL scripts were used to generate insights from the dataset, including:

```sql
-- Product Category with Highest Sales
SELECT `Product Category`, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY `Product Category`
ORDER BY Total_Sales DESC
LIMIT 1;
```

Additional insights include:
- Top and Bottom 3 regions by sales
- Total sales of appliances in Ontario
- Bottom 10 customers by total sales
- Most profitable and valuable customers
- Shipping method with highest cost
- Corporate customer with most orders (2009–2012)
- Relationship between shipping cost and order priority

## Result/Findings
- **Furniture** was the highest-grossing product category.
- **Ontario** showed strong appliance sales, suggesting regional preferences.
- **Standard Class** shipping incurred the highest cost overall.
- **Most profitable customers** were from the Consumer segment.
- Several customers with **negative profit** values indicate possible returns or shipping issues.
- **Corporate customers** showed high frequency of orders between 2009–2012, indicating sustained loyalty.

## Recommendations
- Focus marketing and promotions on high-performing regions like Ontario.
- Review shipping practices, especially in the Standard Class, for cost optimization.
- Introduce loyalty benefits for top consumer and corporate customers.
- Investigate recurring negative-profit orders to improve return policies and profit margins.

## Limitations
- The analysis is based on historical and static data; real-time trends are not captured.
- Profit loss does not indicate actual returns; assumptions are made based on negative profit.
- Data does not include inventory stock levels or warehouse performance, limiting supply chain visibility.

## References
- Internal KMS Orders Database
- SQL Documentation: [https://dev.mysql.com/doc/](https://dev.mysql.com/doc/)
