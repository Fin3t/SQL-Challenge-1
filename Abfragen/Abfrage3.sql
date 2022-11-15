--Abfrage 3
--Auswahl aller Rezepte, die eine gewisse Zutat enthalten
USE krautundrueben

DECLARE @ZutatName VARCHAR(50)
SET @ZutatName = 'HIER ZUTAT EINGEBEN' -- Beispiel: Tomate

SELECT REZEPTE.REZEPTNAME
FROM [dbo].[REZEPTE],[dbo].[REZEPTEZUTAT],[dbo].[ZUTAT]
WHERE ZUTAT.BEZEICHNUNG = @ZutatName --OR REZEPTE.REZEPTID ='R001'
AND ZUTAT.ZUTATENNR = REZEPTEZUTAT.ZUTATENNR
AND REZEPTE.REZEPTID = REZEPTEZUTAT.REZEPTID
---------------------------------------------------------------------------
--select * from [dbo].[REZEPTE]
--select * from [dbo].[REZEPTEZUTAT]
--select * from [dbo].[ZUTAT]