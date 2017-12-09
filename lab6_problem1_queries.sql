/*
    1.1 Prikazi gi konsultantite cie prezime pocnuva na bukvata P.
*/
SELECT *
FROM CONSULTANTS
WHERE CONSULTANTNAME LIKE 'P%';

/*
    1.2 Prikazi gi konsultantite cie prezime zavrsuva na ska, a imeto im pocnuva
        na bukvata M.
*/
SELECT *
FROM CONSULTANTS
WHERE CONSULTANTNAME LIKE '%ska M%';

/*
    1.3 Prikazi gi konsultantite cie ime sodrzi tocno 5 karakteri.
*/
SELECT *
FROM CONSULTANTS
WHERE CONSULTANTNAME LIKE '% ___';

/*
    1.4 Prikazi gi produktite koi vo imeto sodrzat barem dva zbora.
*/
SELECT *
FROM PRODUCTS
WHERE PRODUCTNAME LIKE '% %';


/*
    1.5 Prikazi gi produktite koi vo imeto ja sodrzat bukvata "d", bez razlika
        dali e golema ili mala bukva.
*/
SELECT *
FROM PRODUCTS
WHERE PRODUCTNAME LIKE '%d%' OR PRODUCTNAME LIKE '%D%';

/*
    1.6 Prikazi gi iminjata na produktite koi ne se naracani vo ni edna naracka.
*/
SELECT PRODUCTNAME
FROM PRODUCTS
WHERE PRODUCTID NOT IN (SELECT DISTINCT PRODUCTID
                        FROM ORDER_DETAILS
                       );

/*
    1.7 Prikazi ja vkupnata suma na prodazva poedinecno za sekoja naracka.
*/
SELECT ORDERID, SUM(QUANTITY*PRODUCTPRICE)
FROM ORDER_DETAILS NATURAL JOIN PRODUCTS
GROUP BY ORDERID;


/*
    1.8 Da se najdat produktite koi se naraci vo barem dve naracki.
*/
SELECT PRODUCTID
FROM ORDER_DETAILS
GROUP BY PRODUCTID
HAVING COUNT(*) >= 2;

/*
    1.9 Da se prikaze vkupniot profit ostvaren od konsultantite, za sekoj
        konsultant posebno.
*/
SELECT CONSULTANTID, SUM(QUANTITY*PRODUCTPRICE) PROFIT
FROM ((ORDERS NATURAL JOIN ORDER_DETAILS) NATURAL JOIN PRODUCTS)
GROUP BY CONSULTANTID;