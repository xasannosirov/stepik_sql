-- step 2

SELECT 
    DISTINCT amount 
FROM 
    book 
ORDER BY 
    amount;

-- step 3

SELECT 
    author AS Автор, 
    COUNT(author) AS Различных_книг, 
    SUM(amount) AS Количество_экземпляров
FROM 
    book
GROUP BY 
    author;

-- step 4

SELECT
    author,
    MIN(price) AS Минимальная_цена,
    MAX(price) AS Максимальная_цена,
    AVG(price) AS Средняя_цена
FROM
    book
GROUP BY
    author;