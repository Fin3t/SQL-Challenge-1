--Höchster Nettopreis der Zutaten pro Lieferant
USE krautundrueben;
/*Auswahl der Daten die gewünscht sind*/
SELECT LIEFERANT.LIEFERANTENNAME,max(zutat.NETTOPREIS) AS [Höhster Preis einer Zutat]

/*Aus welchen Tabellen?*/
FROM zutat inner JOIN lieferant
ON zutat.Lieferant = lieferant.LIEFERANTENNR
/*Was ist der höchste Nettopreis pro Lieferant*/
GROUP BY LIEFERANT.LIEFERANTENNAME
ORDER BY max(zutat.nettopreis) desc
