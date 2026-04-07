-- 1. Total Overpayment Impact (Identifying the $134,579 leak)
SELECT Product_Category, Product_Name, SUM(Unit_Sold) AS Total_Units_Sold, 
AVG(Unit_price) AS Avg_Price_Paid, AVG(Vendor_unit_price) AS Avg_Vendor_Price, 
AVG(Unit_price - Vendor_unit_price) AS Avg_Price_Variance 
FROM "Procurement Analysis" 
GROUP BY Product_Category, Product_Name 
ORDER BY Avg_Price_Variance DESC;

-- 2. Burn Rate & Velocity (Identifying Auto_Doorkeypads as the fastest mover)
SELECT Product_Category, Product_Name, SUM(Unit_Sold) AS Total_Units_Sold, 
COUNT(Transaction_ID) AS Total_Transactions, 
ROUND(SUM(Unit_Sold) * 1.0 / COUNT(Transaction_ID), 2) AS Avg_Units_Per_Transaction 
FROM "Procurement Analysis" 
GROUP BY Product_Category, Product_Name 
ORDER BY Avg_Units_Per_Transaction DESC;

-- 3. Regional Bleeding (Detecting the $66,690 East Coast Laptop risk)
SELECT WareHouse_Region, Product_Category, SUM(Unit_Sold) AS Total_Units_Sold, 
ROUND(AVG(Unit_price - Vendor_unit_price), 2) AS Avg_Price_Variance, 
ROUND(SUM((Unit_price - Vendor_unit_price) * Unit_Sold), 2) AS Total_Variance_Impact 
FROM "Procurement Analysis" 
GROUP BY WareHouse_Region, Product_Category 
ORDER BY Total_Variance_Impact DESC;

-- 4. Monthly Volatility (Tracking 24 months of procurement trends)
SELECT strftime('%Y-%m', Order_Date) AS Month, 
ROUND(SUM((Unit_price - Vendor_unit_price) * Unit_Sold), 2) AS Total_Variance_Impact, 
SUM(Unit_Sold) AS Total_Units_Sold 
FROM "Procurement Analysis" 
GROUP BY Month 
ORDER BY Month ASC;

-- 5. Executive Risk Register (Automated CASE Statement Classification)
SELECT Product_Category, Product_Name, WareHouse_Region, 
CASE 
    WHEN AVG(Unit_price - Vendor_unit_price) > 15 THEN 'High Overpayment Risk' 
    WHEN AVG(Unit_price - Vendor_unit_price) BETWEEN 1 AND 15 THEN 'Moderate Overpayment Risk' 
    WHEN AVG(Unit_price - Vendor_unit_price) = 0 THEN 'At Market Rate' 
    WHEN AVG(Unit_price - Vendor_unit_price) < 0 THEN 'Underpaying Vendor' 
END AS Risk_Flag 
FROM "Procurement Analysis" 
GROUP BY Product_Category, Product_Name, WareHouse_Region 
ORDER BY Risk_Flag;