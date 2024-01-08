-- step 8

CREATE TABLE book (
    book_id INT PRIMARY KEY auto_increment,
    title VARCHAR(50), 
    author VARCHAR(30), 
    price DECIMAL(8,2), 
    amount int
);

-- step 9

INSERT INTO book (book_id, title, author, price, amount) 
VALUES 
(1, "Мастер и Маргарита", "Булгаков М.А.", 670.99, 3);

-- step 10

INSERT INTO book (title, author, price, amount) 
VALUES 
("Белая гвардия", "Булгаков М.А.", 540.50, 5),
("Идиот", "Достоевский Ф.М.", 460.00, 10),
("Братья Карамазовы", "Достоевский Ф.М.", 799.01, 2);