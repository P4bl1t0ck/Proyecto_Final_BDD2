-- =============================================
-- Script para otorgar permisos al usuario Catequesis
-- Base de Datos: Catequesis
-- =============================================

USE Catequesis;
GO

-- =============================================
-- 1. Otorgar permisos para CREAR Stored Procedures
-- =============================================
GRANT CREATE PROCEDURE TO Catequesis;
GO

-- =============================================
-- 2. Otorgar permisos para EJECUTAR Stored Procedures
-- =============================================
GRANT EXECUTE TO Catequesis;
GO

-- =============================================
-- 3. Otorgar permisos para ALTERAR Stored Procedures
-- =============================================
GRANT ALTER ANY SCHEMA TO Catequesis;
GO

-- =============================================
-- 4. Otorgar permisos completos sobre el esquema dbo
-- =============================================
GRANT CONTROL ON SCHEMA::dbo TO Catequesis;
GO

-- =============================================
-- 5. Otorgar permisos de SELECT, INSERT, UPDATE, DELETE en todas las tablas
-- =============================================
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO Catequesis;
GO

-- =============================================
-- 6. Añadir el usuario al rol db_ddladmin (permite crear/modificar objetos)
-- =============================================
ALTER ROLE db_ddladmin ADD MEMBER Catequesis;
GO

-- =============================================
-- 7. Añadir el usuario al rol db_datareader (lectura de datos)
-- =============================================
ALTER ROLE db_datareader ADD MEMBER Catequesis;
GO

-- =============================================
-- 8. Añadir el usuario al rol db_datawriter (escritura de datos)
-- =============================================
ALTER ROLE db_datawriter ADD MEMBER Catequesis;
GO

-- =============================================
-- Verificar permisos otorgados
-- =============================================
SELECT 
    dp.name AS Usuario,
    dp.type_desc AS TipoUsuario,
    o.name AS Objeto,
    p.permission_name AS Permiso,
    p.state_desc AS Estado
FROM sys.database_permissions p
INNER JOIN sys.database_principals dp ON p.grantee_principal_id = dp.principal_id
LEFT JOIN sys.objects o ON p.major_id = o.object_id
WHERE dp.name = 'Catequesis'
ORDER BY Permiso;
GO

-- =============================================
-- Verificar roles del usuario
-- =============================================
SELECT 
    r.name AS Rol,
    m.name AS Usuario
FROM sys.database_role_members rm
INNER JOIN sys.database_principals r ON rm.role_principal_id = r.principal_id
INNER JOIN sys.database_principals m ON rm.member_principal_id = m.principal_id
WHERE m.name = 'Catequesis';
GO

PRINT 'Permisos otorgados exitosamente al usuario Catequesis';
PRINT 'El usuario ahora puede:';
PRINT '  - Crear Stored Procedures';
PRINT '  - Ejecutar Stored Procedures';
PRINT '  - Modificar Stored Procedures';
PRINT '  - Realizar operaciones CRUD en todas las tablas';
GO
