-- step 2

SELECT 
    author, 
    title, 
    price
FROM 
    book
WHERE 
    price - (
        SELECT 
            MIN(price) 
        FROM 
            book
    ) <= 150
ORDER BY 
    price DESC;

-- step 3

SELECT 
    author, 
    title, 
    price
FROM 
    book
WHERE 
    price - (
        SELECT 
            MIN(price) 
        FROM 
            book
    ) <= 150
ORDER BY 
    price;

-- step 4

SELECT 
    author, 
    title, 
    amount
FROM 
    book
WHERE 
    amount IN (
        SELECT 
            amount
        FROM 
            book 
        GROUP BY 
            amount 
        HAVING 
            COUNT(amount)=1
    );

-- step 5

SELECT 
    author, 
    title, 
    price 
FROM 
    book
WHERE 
    price < ANY (
        SELECT 
            MIN(price)
        FROM 
            book 
        GROUP BY 
            author
    );

-- step 6

SELECT 
    title, 
    author, 
    amount, 
    (
        SELECT 
            MAX(amount) 
        FROM 
            book
    ) - amount AS Заказ
FROM 
    book
HAVING 
    Заказ > 0;

-- step 7

-- All queries in 1.4 work