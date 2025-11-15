-- 1. Crear Login
USE MASTER
GO
CREATE LOGIN [Catequesis] WITH PASSWORD='Udla1234',
DEFAULT_DATABASE=[Catequesis]
GO
-- 2. Conceder permiso de Conexion
use [master]
GO
GRANT CONNECT SQL TO [Catequesis]
GO
-- 3. Asignar o Crear Usuario de Base de Datos
USE [Catequesis];
GO
CREATE USER Catequesis FOR LOGIN Catequesis
GO
-- 4.1 Condeder todos los Permisos de lectura y escritura -- para todos los objetos de la BDD
ALTER ROLE db_datareader ADD MEMBER Catequesis
GO
ALTER ROLE db_datawriter ADD MEMBER Catequesis