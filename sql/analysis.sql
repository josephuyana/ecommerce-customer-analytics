-- 1. Total monthly sales
SELECT 
  YEAR(InvoiceDate) AS year, 
  MONTH(InvoiceDate) AS month,
  SUM(UnitPrice * Quantity) AS revenue
FROM transactions
GROUP BY 1,2
ORDER BY 1,2;

-- 2. Top 10 products by revenue
SELECT 
  StockCode, 
  Description, 
  SUM(UnitPrice * Quantity) AS total_revenue
FROM transactions
GROUP BY StockCode, Description
ORDER BY total_revenue DESC
LIMIT 10;

-- 3. Sales by country
SELECT 
  Country, 
  SUM(UnitPrice * Quantity) AS revenue
FROM transactions
GROUP BY Country
ORDER BY revenue DESC;

-- 4. Active customers per month
SELECT 
  YEAR(InvoiceDate) AS yr, 
  MONTH(InvoiceDate) AS mth,
  COUNT(DISTINCT CustomerID) AS active_customers
FROM transactions
GROUP BY 1,2
ORDER BY 1,2;

-- 5. Sample customer detail (ID = 12583)
SELECT 
  t.InvoiceDate, 
  t.StockCode, 
  p.Description, 
  t.Quantity, 
  t.UnitPrice,
  (t.Quantity * t.UnitPrice) AS line_total
FROM transactions t
JOIN products p USING (StockCode)
WHERE t.CustomerID = 12583
ORDER BY t.InvoiceDate;
