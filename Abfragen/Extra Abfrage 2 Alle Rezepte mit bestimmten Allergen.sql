--Zeige alle Rezepte die das Allergen Eier haben 

USE krautundrueben;

SELECT rezepte.REZEPTNAME
	, allergene.ALLERGENNAME
FROM rezepte
INNER JOIN [dbo].[ALLERGENEREZEPTE] 
	ON rezepte.REZEPTID = [dbo].[ALLERGENEREZEPTE].REZEPTID
INNER JOIN allergene 
	ON allergene.ALLERGENID = [dbo].[ALLERGENEREZEPTE].ALLERGENID

WHERE allergene.ALLERGENNAME = 'Eier';
