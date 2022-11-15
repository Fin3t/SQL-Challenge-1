--Abfrage 4
--Berechnung der durchschnittlichen Nährwerte aller Bestellungen eines Kunden
USE krautundrueben;

DECLARE @KName VARCHAR(50)
SET @KName = 'HIER KUNDENNR EINGEBEN' --Beispiel: K2002

select CONVERT(DECIMAL(10,2),sum(ZUTAT.KALORIEN * bestellungzutat.Menge) / COUNT(bestellungzutat.ZUTATENNR)) AS KALORIEN,
CONVERT(DECIMAL(10,2),sum(ZUTAT.KOHLENHYDRATE * bestellungzutat.Menge) / COUNT(bestellungzutat.ZUTATENNR)) AS KOHLENHYDRATE,
CONVERT(DECIMAL(10,2),sum(ZUTAT.PROTEIN * bestellungzutat.Menge) / COUNT(bestellungzutat.ZUTATENNR)) AS PROTEIN
FROM ZUTAT,bestellungzutat,KUNDE,BESTELLUNG
where ZUTAT.ZUTATENNR = bestellungzutat.ZUTATENNR 
AND BESTELLUNG.BESTELLNR = bestellungzutat.BESTELLNR
AND KUNDE.KUNDENNR = BESTELLUNG.KUNDENNR
AND KUNDE.KUNDENNR = @KName






