--Abfrage 6
--Auswahl aller Rezepte, die eine bestimmte Kalorienmenge nicht überschreiten 
USE krautundrueben;

DECLARE @KAnzahl VARCHAR(50)
SET @KAnzahl = 'HIER KALORIEN ANZAHL EINGEBEN' --Beispiel: 350

SELECT SUM(zutat.KALORIEN) AS "Gesamte Kalorien", rezepte.REZEPTNAME
FROM zutat,REZEPTEZUTAT,rezepte
WHERE rezepte.REZEPTID = REZEPTEZUTAT.REZEPTID
AND zutat.ZUTATENNR = REZEPTEZUTAT.ZUTATENNR
GROUP BY rezepte.REZEPTNAME
HAVING SUM(zutat.KALORIEN) < @KAnzahl;
