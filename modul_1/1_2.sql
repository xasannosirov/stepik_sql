-- step 2

SELECT * FROM book;

-- step 3

SELECT author, title, price FROM book;

-- step 4

SELECT title AS Название, author AS Автор FROM book;

-- step 5

SELECT title, amount, amount*1.65 AS pack FROM book;

-- step 6

SELECT title, author, amount, ROUND(price-price*0.3, 2) AS new_price FROM book;

-- step 8

SELECT author, title, price FROM book WHERE amount < 10;