--Abfrage 5
--Auswahl aller Zutaten, die bisher keinem Rezept zugeordnet sind
USE krautundrueben

SELECT t1.BEZEICHNUNG
FROM [ZUTAT] t1
LEFT JOIN [REZEPTEZUTAT] t2 ON t2.ZUTATENNR = t1.ZUTATENNR
WHERE t2.ZUTATENNR IS NULL

--USE krautundrueben

--SELECT [ZUTAT].BEZEICHNUNG
--FROM [ZUTAT]
--LEFT JOIN [REZEPTEZUTAT]  ON [REZEPTEZUTAT].ZUTATENNR = [ZUTAT].ZUTATENNR
--WHERE [REZEPTEZUTAT].ZUTATENNR IS NULL
---------------------------------------------------------------------------
--select * from [dbo].[REZEPTE]
--select * from [dbo].[REZEPTEZUTAT]
--select * from [dbo].[ZUTAT]

