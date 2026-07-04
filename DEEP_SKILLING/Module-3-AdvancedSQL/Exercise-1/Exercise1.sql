-- =====================================================
-- Exercise 1
-- Ranking and Window Functions
-- =====================================================

-- Display ROW_NUMBER(), RANK(), and DENSE_RANK()
-- for products within each category.

SELECT
    ProductID,
    ProductName,
    Category,
    Price,

    ROW_NUMBER() OVER
    (
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS RowNumber,

    RANK() OVER
    (
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS ProductRank,

    DENSE_RANK() OVER
    (
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS DenseRank

FROM Products;

-- =====================================================
-- Display Top 3 Most Expensive Products
-- in Each Category
-- =====================================================

WITH RankedProducts AS
(
    SELECT
        ProductID,
        ProductName,
        Category,
        Price,

        ROW_NUMBER() OVER
        (
            PARTITION BY Category
            ORDER BY Price DESC
        ) AS RowNum

    FROM Products
)

SELECT
    ProductID,
    ProductName,
    Category,
    Price
FROM RankedProducts
WHERE RowNum <= 3;