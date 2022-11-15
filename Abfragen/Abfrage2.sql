--Abfrage 2
--Auswahl aller Rezepte einer bestimmten Ernährungskategorie
USE krautundrueben

DECLARE @EKategorie VARCHAR(50)
SET @EKategorie = 'KATEGORIE HIER EINGEBEN' -- Beispiel: Low Carb

SELECT REZEPTE.REZEPTNAME
FROM [dbo].[REZEPTE],[dbo].[ERNAEHRUNGREZEPTE],[dbo].[ERNAEHRUNGSKATEGORIE]
WHERE ERNAEHRUNGSKATEGORIE.ERNAEHRUNGSART = @EKategorie --OR REZEPTE.REZEPTID ='R001'
AND REZEPTE.REZEPTID = ERNAEHRUNGREZEPTE.REZEPTID
AND ERNAEHRUNGSKATEGORIE.ERNAEHRUNGSID = ERNAEHRUNGREZEPTE.ERNAEHRUNGSID
---------------------------------------------------------------------------
--select top 1 * from [dbo].[REZEPTE]
--select top 1 * from [dbo].[ERNAEHRUNGREZEPTE]
--select  * from [dbo].[ERNAEHRUNGSKATEGORIE]