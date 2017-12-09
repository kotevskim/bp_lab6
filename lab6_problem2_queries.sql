/*
    1. Najdi gi sifrite i iminjata na site vraboteni i imeto na pretstavata
       vo koja igrale glavna uloga za koja se prodadeni bileti zza odrzuvanje
       na folema scena kako redovna pretstava.
*/

SELECT V.V, IMEV, IMEP
FROM (((VRABOTENI V JOIN ULOGI U ON V.V=U.V)
       JOIN PRETSTAVI P ON U.P=P.P)
       JOIN BILETI B ON B.P=P.P)
WHERE U.IMA_ULOGA='glavna' AND B.STATUS='redovna' AND B.SCENA='golema';

/*
    2. Najdi go akterot koj ucestvuval vo najgolem broj na pretstavi
*/
SELECT V, IMEV
FROM ULOGI NATURAL JOIN VRABOTENI 
GROUP BY V, IMEV
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                    FROM ULOGI
                    GROUP BY V
                    );
                    

/*
    3. Najdi go imeto na akterot so najvisok prosecen honorar
*/
SELECT IMEV
FROM ZARABOTUVA NATURAL JOIN VRABOTENI
GROUP BY V, IMEV
HAVING AVG(HONORAR) >= ALL(SELECT AVG(HONORAR)
                           FROM ZARABOTUVA
                           GROUP BY V
                          );
                          
/*
    3. Version 2:

SELECT IMEV
FROM VRABOTENI
WHERE V IN (SELECT V
            FROM ZARABOTUVA
            GROUP BY V
            HAVING AVG(HONORAR) >= ALL(SELECT AVG(HONORAR)
                                       FROM ZARABOTUVA
                                       GROUP BY V
                                      )  
            );
*/
            
            
/*
    4. Da se vrati pregled na brojot na razlicni pretstavi sto se igrale posebno 
       za sekoj grad, sortirani po imeto na gradot.
*/

SELECT GRAD, COUNT(DISTINCT P)
FROM BILETI NATURAL JOIN TEATRI
GROUP BY GRAD
ORDER BY GRAD;
            

/*
    5. Prikazi gi pretstavnicite za koi vkupniot profit od prodazba na bileti
       e pogolem od vkupnata suma isplatena kako honorar
*/
SELECT IMEP
FROM PRETSTAVI
WHERE P IN (SELECT P
            FROM BILETI B
            GROUP BY P
            HAVING SUM(CENA*PRODADENI) > (SELECT SUM(HONORAR)
                                          FROM ZARABOTUVA
                                          WHERE P = B.P
                                          GROUP BY P
                                          )
);



/*
    Dopolnitelno 1: Prikazi gi iminjata na produktite koi ne pripagjaat vo
    kategorijata parfemi, i nivnata cena e pogolema barem od eden produkt od 
    kategorijata parfemi.
*/
SELECT PRODUCTNAME
FROM PRODUCTS
WHERE CATEGORYID NOT IN (SELECT CATEGORYID
                         FROM CATEGORIES
                         WHERE CATEGORYNAME='Perfumes'
                         )
      AND PRODUCTPRICE > ANY (SELECT CATEGORYID
                         FROM CATEGORIES
                         WHERE CATEGORYNAME='Perfumes'
                         );
                         
/*
    Dopolnitelno 2: Prikazi ja preststavata so najgolema posetenost.
*/
SELECT IMEP
FROM PRETSTAVI
WHERE P IN (SELECT P
            FROM BILETI
            GROUP BY P
            HAVING SUM(PRODADENI) >= ALL(SELECT SUM(PRODADENI)
                                         FROM BILETI
                                         GROUP BY P
                                         )
            );







                      
                                              

