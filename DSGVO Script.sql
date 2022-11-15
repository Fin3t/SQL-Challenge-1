--Bitte teilen Sie uns die Email (bei der Erstellung des Accounts) mit zur überprüfungen Ihrer Daten
USE krautundrueben
DECLARE @KEmail varchar(50)

SET @KEmail = 'armin@gessert.de' --Beispiel: armin@gessert.de

SELECT * 
FROM KUNDE
WHERE EMAIL = @KEmail
-------------------------------------------------------------------------------------------
--DATEN SOLLEN ENTFERNT WERDEN:
DECLARE @KunNR varchar(50)
DECLARE @KEmailGDPR varchar(50)

SET @KunNR = 'K2007'            --Beispiel: K2007
SET @KEmailGDPR = 'armin@gessert.de'   --Beispiel: armin@gessert.de

begin tran
UPDATE Kunde 
SET NACHNAME = 'GDPR DELETION',
VORNAME = 'GDPR DELETION', 
STRASSE = 'GDPR DELETION',
ORT = 'GDPR DELETION', 
EMAIL = 'GDPR DELETION',
HAUSNR = '0',
GEBURTSDATUM ='9999-01-01', 
TELEFON = '9999999',
PLZ ='00000'
WHERE EMAIL = @KEmailGDPR
AND KUNDENNR = @KunNR
--commit
--rollback