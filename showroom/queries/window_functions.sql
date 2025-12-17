--Display all sales with:
--SaleID
--SalePrice
--Running total of sales amount ordered by SaleDate

SELECT
    SaleID,
    SalePrice,
    SaleDate,
    SUM(SalePrice) OVER (
        ORDER BY SaleDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotal
FROM Sales
ORDER BY SaleDate;