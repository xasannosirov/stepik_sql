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

-- step 5

SELECT
    author, 
    SUM(price*amount) AS Стоимость, 
    ROUND(SUM(price*amount)*0.18/1.18, 2) AS НДС, 
    ROUND(SUM(price*amount)/1.18, 2) AS Стоимость_без_НДС
FROM
    book
GROUP BY
    author;

-- step 6

SELECT 
    MIN(price) AS Минимальная_цена, 
    MAX(price) AS Максимальная_цена, 
    ROUND(AVG(price), 2) AS Средняя_цена
FROM 
    book;

-- step 7

SELECT 
    ROUND(AVG(price), 2) AS Средняя_цена, 
    ROUND(SUM(amount*price), 2) AS Стоимость
FROM 
    book
WHERE 
    amount 
BETWEEN 5 AND 14;

-- step 8

SELECT 
    author, 
    SUM(price*amount) AS Стоимость
FROM 
    book
WHERE 
    title 
NOT IN 
    ("Идиот", "Белая гвардия")
GROUP BY 
    author
HAVING 
    SUM(price*amount) > 5000
ORDER BY Стоимость DESC;

-- step 9

SELECT 
    author, 
    title, 
    price
FROM 
    book
WHERE 
    price<=(
        SELECT 
            AVG(price) 
        FROM 
        book
    )
ORDER BY 
    price DESC;