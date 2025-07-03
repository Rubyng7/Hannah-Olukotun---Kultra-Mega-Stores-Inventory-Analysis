# Hannah-Olukotun---Kultra-Mega-Stores-Inventory-Analysis
SQL analysis of  Kultra Mega Stores Inventory data and presentation of key insights and  findings.  

## Project Topic: Kultra-Mega-Stores-Inventory-Analysis

### Project Overview

### Data Sources 

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

### Result/Findings


### Recommendations


### Limitations


### References
