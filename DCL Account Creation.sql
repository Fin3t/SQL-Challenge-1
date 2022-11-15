USE [krautundrueben]
----------------------------------------------------
-- Erstellung der Rolle Azubis
----------------------------------------------------
CREATE ROLE [Azubis]
GRANT SELECT TO [Azubis]
DENY SELECT ON [dbo].[Kunde] TO [Azubis]
----------------------------------------------------
-- Erstellung eines Logins auf dem Server
-- Erstellung von Hans:
CREATE LOGIN [Hans] WITH PASSWORD=N'Passwort123',
DEFAULT_DATABASE=[krautundrueben],
DEFAULT_LANGUAGE=[us_english],
CHECK_EXPIRATION=OFF,
CHECK_POLICY=OFF
-- User Erstellen
CREATE USER [Hans] FOR LOGIN [Hans]
-- Hans ist der Geschäftsführer und möchte einen Read Access auf alle Tabellen:
GRANT SELECT TO [Hans];
-- Commit
-- Rollback
-------------------------------------------------
-- Erstellung von Kevin/Pevin, die Azubis
begin tran
USE [krautundrueben]
CREATE LOGIN [Pevin] WITH PASSWORD=N'Passwort123',
DEFAULT_DATABASE=[krautundrueben],
DEFAULT_LANGUAGE=[us_english],
CHECK_EXPIRATION=OFF,
CHECK_POLICY=OFF
------ CREATE USER FOR PEVIN
CREATE USER [Pevin] FOR LOGIN [Pevin]
------- ADD PEVIN TO ROLE AZUBIS
ALTER ROLE [Azubis] ADD MEMBER [Pevin]
---------------------------------------------------------
--Erstellung eines Accountes für die IT Solution, damit die Datenbank modifiziert werden kann
begin tran
USE [krautundrueben]
CREATE LOGIN [itsolution_admin] WITH PASSWORD=N'Passwort123',
DEFAULT_DATABASE=[krautundrueben],
DEFAULT_LANGUAGE=[us_english],
CHECK_EXPIRATION=OFF,
CHECK_POLICY=OFF

CREATE USER [itsolution_admin] FOR LOGIN [itsolution_admin]

GRANT SELECT, INSERT, UPDATE, DELETE TO [itsolution_admin] ;
-----------------------------------------------------------------------------
--Account für die IT, die den SQL Server betreut
begin tran
USE [krautundrueben]
CREATE LOGIN [db_admin] WITH PASSWORD=N'Passwort123',
DEFAULT_DATABASE=[krautundrueben],
DEFAULT_LANGUAGE=[us_english],
CHECK_EXPIRATION=OFF,
CHECK_POLICY=OFF

CREATE USER [db_admin] FOR LOGIN [db_admin]
use krautundrueben
GRANT CREATE TABLE TO [db_admin]
-------------------------------------------------------------------
-- revoke SELECT to [Kevin]
-----------------------------------------------------------------------
-- Zeige alle Berechtigungen:
SELECT 
    class_desc 
  , CASE WHEN class = 0 THEN DB_NAME()
         WHEN class = 1 THEN OBJECT_NAME(major_id)
         WHEN class = 3 THEN SCHEMA_NAME(major_id) END [Securable]
  , USER_NAME(grantee_principal_id) [User]
  , permission_name
  , state_desc
FROM sys.database_permissions
WHERE class_desc = 'DATABASE'


GRANT ALTER ON SCHEMA::dbo TO [DB_Admin]

