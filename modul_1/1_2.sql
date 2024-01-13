-- step 2

SELECT * FROM book;

-- step 3

SELECT 
    author, 
    title, 
    price 
FROM 
    book;

-- step 4

SELECT 
    title AS Название, 
    author AS Автор 
FROM 
    book;

-- step 5

SELECT 
    title, 
    amount, 
    amount*1.65 AS pack 
FROM 
    book;

-- step 6

SELECT 
    title, 
    author, 
    amount, 
    ROUND(price-price*0.3, 2) AS new_price 
FROM 
    book;

-- step 7

SELECT 
    author, 
    title,
    ROUND(
        IF(author="Булгаков М.А.", price*1.1, 
        IF(author="Есенин С.А.",price*1.05, price)), 2
        ) AS new_price
FROM 
    book

-- step 8

SELECT 
    author, 
    title, 
    price 
FROM 
    book 
WHERE 
    amount < 10;

-- step 9

SELECT 
    title, 
    author, 
    price, 
    amount 
FROM 
    book
WHERE 
    price < 500 
AND 
    price*amount >= 5000 
OR 
    price > 600 
AND 
    price*amount >= 5000;

-- step 10

SELECT 
    title, 
    author 
FROM 
    book
WHERE  
    price 
BETWEEN 
    540.50 AND 800 
AND 
    amount IN (2,3,5,7);

-- step 11

SELECT 
    author, 
    title 
FROM 
    book
WHERE 
    amount 
BETWEEN 
    2 AND 14
ORDER BY 
    author DESC, 
    title;

-- step 12

SELECT 
    title, 
    author 
FROM 
    book 
WHERE 
    title LIKE "_% _%"
AND 
    (author LIKE "% С._." OR author LIKE "% _.С.")    
ORDER BY 
    title;

-- step 13

SELECT 
    book_id, 
    title, 
    author, 
    price, 
    amount 
FROM 
    book 
WHERE 
    author 
LIKE '%Дос%';