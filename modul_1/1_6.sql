-- step 2

SELECT 
    name, 
    city, 
    per_diem, 
    date_first, 
    date_last
FROM 
    trip
WHERE 
    name LIKE '%а %.'
ORDER BY 
    date_last DESC;

-- step 3

SELECT 
    DISTINCT name 
FROM 
    trip
WHERE 
    city='Москва'
ORDER BY 
    name;

-- step 4

SELECT 
    city, 
    COUNT(*) AS Количество
FROM 
    trip
GROUP BY 
    city
ORDER BY 
    city;

-- step 5

SELECT 
    city, 
    COUNT(*) AS Количество
FROM 
    trip
GROUP BY 
    city
ORDER BY 
    Количество DESC
LIMIT 2;

-- step 6

SELECT 
    name, 
    city, 
    DATEDIFF(date_last, date_first)+1 AS Длительность
FROM 
    trip
WHERE 
    city NOT IN ('Москва', "Санкт-Петербург")
ORDER BY 
    Длительность DESC, 
    city DESC;

-- step 7

SELECT 
    name, 
    city, 
    date_first, 
    date_last
FROM 
    trip
WHERE 
    DATEDIFF(date_last, date_first) = (
        SELECT 
            MIN(
                DATEDIFF(date_last, date_first)
            )
        FROM 
            trip
    );

-- step 8

SELECT 
    name, 
    city, 
    date_first, 
    date_last
FROM 
    trip
WHERE 
    month(date_last)=month(date_first)
ORDER BY 
    city, 
    name;

-- step 9

SELECT 
    MONTHNAME(date_first) AS Месяц, 
    COUNT(*) AS Количество
FROM 
    trip
GROUP BY 
    Месяц
ORDER BY 
    Количество DESC, 
    Месяц;

-- step 10

SELECT 
    name, 
    city, 
    date_first, 
    per_diem*(
        DATEDIFF(date_last, date_first)+1
    ) AS Сумма
FROM 
    trip
WHERE 
    month(date_first) IN (2, 3)
ORDER BY 
    name, 
    Сумма DESC;

-- step 11

SELECT 
    name, 
    SUM(
        (
            DATEDIFF(date_last, date_first)+1
        )*per_diem
    ) AS Сумма
FROM 
    trip
GROUP BY 
    name
HAVING 
    COUNT(*) > 3
ORDER BY 
    2 DESC;