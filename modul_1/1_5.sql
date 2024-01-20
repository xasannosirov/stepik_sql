-- step 2

CREATE TABLE supply (
    supply_id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(50), 
    author VARCHAR(30), 
    price DECIMAL(8, 2), 
    amount INT
);

-- step 3

INSERT INTO supply(supply_id, title, author, price, amount) VALUES 
(1, 'Лирика', 'Пастернак Б.Л.', 518.99, 2);

INSERT INTO supply(supply_id, title, author, price, amount) VALUES 
(2, 'Черный человек', 'Есенин С.А.', 570.20, 6);

INSERT INTO supply(supply_id, title, author, price, amount) VALUES 
(3, 'Белая гвардия', 'Булгаков М.А.', 540.50, 7);

INSERT INTO supply(supply_id, title, author, price, amount) VALUES 
(4, 'Идиот', 'Достоевский Ф.М.', 360.80, 3);

-- step 4

INSERT INTO book (title, author, price, amount)
SELECT 
    title, 
    author, 
    price, 
    amount
FROM 
    supply
WHERE 
    author 
NOT IN 
    ('Булгаков М.А.', 'Достоевский Ф.М.');

-- step 5

INSERT INTO book (title, author, price, amount)
SELECT 
    title, 
    author, 
    price, 
    amount
FROM 
    supply
WHERE 
    author 
NOT IN 
    (
    SELECT 
         DISTINCT author 
     FROM 
         book
    );

-- step 6

UPDATE 
    book 
SET 
    price = 0.9*price
WHERE 
    amount 
BETWEEN 5 AND 10;

-- step 7

UPDATE 
    book 
SET 
    buy = IF(buy > amount, amount, buy),
    price = IF(buy = 0, price * 0.9, price);

-- step 8

UPDATE 
    book, 
    supply 
SET 
    book.amount=supply.amount+book.amount, 
    book.price=(book.price+supply.price)/2
WHERE 
    book.title=supply.title;

-- step 9

DELETE FROM 
    supply 
WHERE 
    author IN (
        SELECT 
            author
        FROM 
            book
        GROUP BY 
            author
        HAVING 
            SUM(amount) > 10
    );

-- step 10

CREATE TABLE ordering AS
SELECT 
    author, 
    title, 
    (
        SELECT 
            AVG(amount) 
        FROM 
            book
    ) AS amount
FROM 
    book
WHERE 
    amount<(
        SELECT 
            AVG(amount) 
        FROM 
            book
    );

-- step 11

-- All queries in 1.5 work