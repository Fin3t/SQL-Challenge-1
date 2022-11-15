--Abfrage 1
--Auswahl aller Zutaten eines Rezeptes nach Rezeptname
USE krautundrueben

DECLARE @RezeptName VARCHAR(50)
SET @RezeptName = 'HIER REZEPT EINGEBEN' --Beispiel: Karotten-Kichererbsen-Salat

SELECT ZUTAT.BEZEICHNUNG
FROM ZUTAT,REZEPTE,REZEPTEZUTAT
WHERE REZEPTE.REZEPTNAME = @RezeptName --OR REZEPTE.REZEPTID ='R001'
AND ZUTAT.ZUTATENNR = REZEPTEZUTAT.ZUTATENNR
AND REZEPTE.REZEPTID = REZEPTEZUTAT.REZEPTID
------------------------------------------------------------------------
--select * from REZEPTE
--select top 1 * from ZUTAT
--select top 1* from REZEPTEZUTAT