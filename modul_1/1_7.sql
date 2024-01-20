-- step 2

CREATE TABLE fine (
    fine_id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(30), 
    number_plate VARCHAR(6),
    violation VARCHAR(50), 
    sum_fine DECIMAL(8,2), 
    date_violation DATE, 
    date_payment DATE
);

-- step 3

INSERT INTO fine(fine_id, name, number_plate, violation, sum_fine, date_violation, date_payment) 
VALUES(6, "Баранов П.Е.", 'Р523ВТ', 'Превышение скорости(от 40 до 60)', Null, '2020-02-14', Null);

INSERT INTO fine(fine_id, name, number_plate, violation, sum_fine, date_violation, date_payment) 
VALUES(7, "Абрамова К.А.", 'О111АВ', 'Проезд на запрещающий сигнал', Null, '2020-02-23', Null);

INSERT INTO fine(fine_id, name, number_plate, violation, sum_fine, date_violation, date_payment) 
VALUES(8, "Яковлев Г.Р.", 'Т330ТТ', 'Проезд на запрещающий сигнал', Null, '2020-03-03', Null);

-- step 4

UPDATE 
    fine AS f, 
    traffic_violation AS tv
SET 
    f.sum_fine=tv.sum_fine
WHERE 
    f.violation=tv.violation 
AND 
    f.sum_fine IS NULL;

-- step 5

SELECT 
    name, 
    number_plate, 
    violation
FROM 
    fine
GROUP BY 
    name, 
    number_plate, 
    violation
HAVING 
    COUNT(*) > 1
ORDER BY 
    name;

-- step 6

UPDATE fine, (
    SELECT 
        name, 
        number_plate, 
        violation
    FROM 
        fine
    GROUP BY 
        name, 
        number_plate, 
        violation
    HAVING 
        count(*) > 1
    ORDER BY 
        name
    ) AS new_fine
SET 
    fine.sum_fine=fine.sum_fine*2
WHERE 
    date_payment IS NULL 
AND 
    new_fine.name = fine.name 
AND 
    new_fine.number_plate = fine.number_plate 
AND 
    new_fine.violation = fine.violation;

-- step 7

UPDATE 
    fine, 
    payment
SET 
    fine.date_payment = payment.date_payment,
    fine.sum_fine = IF(
        DATEDIFF(payment.date_payment, fine.date_violation) <= 20, 
        fine.sum_fine/2, fine.sum_fine
    )
WHERE 
    fine.name = payment.name 
AND 
    fine.number_plate=payment.number_plate 
AND 
    fine.violation = payment.violation 
AND  
    fine.date_payment IS NULL;

-- step 8

CREATE TABLE back_payment AS (
    SELECT 
        name, 
        number_plate, 
        violation, 
        sum_fine, 
        date_violation 
    FROM 
        fine
    WHERE 
        date_payment IS NULL
    );

-- step 9

DELETE FROM 
    fine
WHERE 
    date_violation < '2020-02-01';