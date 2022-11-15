--Abfrage 7
--Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten
USE krautundrueben

SELECT COUNT(REZEPTEZUTAT.ZUTATENNR) AS [Anzahl der Zutaten],REZEPTE.REZEPTNAME AS [Rezeptname]
FROM ZUTAT,REZEPTE,REZEPTEZUTAT
WHERE ZUTAT.ZUTATENNR = REZEPTEZUTAT.ZUTATENNR
AND REZEPTE.REZEPTID = REZEPTEZUTAT.REZEPTID
GROUP BY REZEPTE.REZEPTNAME
HAVING COUNT(REZEPTEZUTAT.ZUTATENNR) < 5

---------------------------------------------------------------------------
--select * from [dbo].[REZEPTE]
--select * from [dbo].[REZEPTEZUTAT]
--select * from [dbo].[ZUTAT]

