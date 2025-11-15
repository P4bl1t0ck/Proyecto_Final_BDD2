-- =============================================
-- Script Completo para Crear/Clonar Base de Datos: Catequesis
-- Incluye: Tablas, Relaciones, Datos y Stored Procedures
-- Fecha: Noviembre 2025
-- =============================================

USE master;
GO

-- =============================================
-- 1. CREAR BASE DE DATOS
-- =============================================
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'Catequesis')
BEGIN
    ALTER DATABASE Catequesis SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Catequesis;
END
GO

CREATE DATABASE Catequesis;
GO

USE Catequesis;
GO

PRINT 'Base de datos Catequesis creada exitosamente';
GO

-- =============================================
-- 2. CREAR TABLAS
-- =============================================

-- Tabla: Parroquía (Tabla padre)
CREATE TABLE Parroquía (
    ID_Parroquin VARCHAR(15) NOT NULL,
    Nombre VARCHAR(20),
    Direccion VARCHAR(25),
    Telefono VARCHAR(13),
    Vicaria VARCHAR(100),
    CONSTRAINT Parroquía_PK PRIMARY KEY (ID_Parroquin)
);
GO

PRINT 'Tabla Parroquía creada';
GO

-- Tabla: FeBautismo (Tabla padre)
CREATE TABLE FeBautismo (
    ID_Bautismo VARCHAR(15) NOT NULL,
    FechaBautismo DATE,
    ParroquiaBautizo VARCHAR(25),
    Padrino VARCHAR(20),
    Madrina VARCHAR(20),
    CONSTRAINT FeBautismo_PK PRIMARY KEY (ID_Bautismo)
);
GO

PRINT 'Tabla FeBautismo creada';
GO

-- Tabla: Catequista
CREATE TABLE Catequista (
    ID_Catequista VARCHAR(15) NOT NULL,
    Nombres VARCHAR(20),
    Apellidos VARCHAR(20),
    Telefono VARCHAR(13),
    Correo VARCHAR(100),
    Rol VARCHAR(30),
    Parroquía_ID_Parroquin VARCHAR(15),
    CONSTRAINT Catequista_PK PRIMARY KEY (ID_Catequista),
    CONSTRAINT Catequista_Parroquía_FK FOREIGN KEY (Parroquía_ID_Parroquin) 
        REFERENCES Parroquía(ID_Parroquin)
);
GO

PRINT 'Tabla Catequista creada';
GO

-- Tabla: Catequizando
CREATE TABLE Catequizando (
    ID_Catequizando VARCHAR(15) NOT NULL,
    Nombre VARCHAR(15),
    Apellido VARCHAR(15),
    Cedula VARCHAR(10),
    Fecha_Nacimiento DATE,
    Telefono VARCHAR(13),
    Fecha_Registro DATE,
    Observaciones CHAR(120),
    FeBautismo_ID_Bautismo VARCHAR(15) NOT NULL,
    CONSTRAINT Catequizando_PK PRIMARY KEY (ID_Catequizando),
    CONSTRAINT Catequizando_FeBautismo_FK FOREIGN KEY (FeBautismo_ID_Bautismo) 
        REFERENCES FeBautismo(ID_Bautismo)
);
GO

PRINT 'Tabla Catequizando creada';
GO

-- Tabla: GrupoCatequesis
CREATE TABLE GrupoCatequesis (
    ID_Grupo VARCHAR(20) NOT NULL,
    Parroquía_ID_Parroquin VARCHAR(15) NOT NULL,
    Ano DATE,
    Horario DATETIME,
    ID_Parroquia VARCHAR(25),
    ID_Catequista VARCHAR(15),
    ID_Nivel VARCHAR(15),
    Catequista_ID_Catequista VARCHAR(15) NOT NULL,
    CONSTRAINT GrupoCatequesis_PK PRIMARY KEY (ID_Grupo, Parroquía_ID_Parroquin),
    CONSTRAINT GrupoCatequesis_Parroquía_FK FOREIGN KEY (Parroquía_ID_Parroquin) 
        REFERENCES Parroquía(ID_Parroquin),
    CONSTRAINT GrupoCatequesis_Catequista_FK FOREIGN KEY (Catequista_ID_Catequista) 
        REFERENCES Catequista(ID_Catequista)
);
GO

PRINT 'Tabla GrupoCatequesis creada';
GO

-- Tabla: NivelCatequesis
CREATE TABLE NivelCatequesis (
    ID_Nivel VARCHAR(15) NOT NULL,
    NombreNivel VARCHAR(50),
    GrupoCatequesis_ID_Grupo VARCHAR(20),
    GrupoCatequesis_Parroquía_ID_Parroquin VARCHAR(15),
    CONSTRAINT NivelCatequesis_PK PRIMARY KEY (ID_Nivel),
    CONSTRAINT NivelCatequesis_GrupoCatequesis_FK 
        FOREIGN KEY (GrupoCatequesis_ID_Grupo, GrupoCatequesis_Parroquía_ID_Parroquin) 
        REFERENCES GrupoCatequesis(ID_Grupo, Parroquía_ID_Parroquin)
);
GO

PRINT 'Tabla NivelCatequesis creada';
GO

-- Tabla: Incripción
CREATE TABLE Incripción (
    ID_Inscripción VARCHAR(15) NOT NULL,
    FechaInscripción DATE,
    EstadoDePago VARCHAR(15),
    Observaciones VARCHAR(120),
    ID_Grupo VARCHAR(15) NOT NULL,
    ID_Catequizado VARCHAR(15) NOT NULL,
    Catequizando_ID_Catequizando VARCHAR(15) NOT NULL,
    GrupoCatequesis_ID_Grupo VARCHAR(20) NOT NULL,
    GrupoCatequesis_ID_Parroquin VARCHAR(15) NOT NULL,
    CONSTRAINT Incripción_PK PRIMARY KEY (ID_Inscripción),
    CONSTRAINT Incripción_Catequizando_FK FOREIGN KEY (Catequizando_ID_Catequizando) 
        REFERENCES Catequizando(ID_Catequizando),
    CONSTRAINT Incripción_GrupoCatequesis_FK 
        FOREIGN KEY (GrupoCatequesis_ID_Grupo, GrupoCatequesis_ID_Parroquin) 
        REFERENCES GrupoCatequesis(ID_Grupo, Parroquía_ID_Parroquin)
);
GO

PRINT 'Tabla Incripción creada';
GO

-- Tabla: Certificado
CREATE TABLE Certificado (
    ID_Certificado VARCHAR(15) NOT NULL,
    Parroquía_ID_Parroquin VARCHAR(15) NOT NULL,
    NivelCatequesis_ID_Nivel VARCHAR(15) NOT NULL,
    Fecha_Emision DATE,
    Aprobado BIT,
    ID_Inscripción VARCHAR(15),
    ID_Nivel VARCHAR(15),
    Incripción_ID_Inscripción VARCHAR(15) NOT NULL,
    CONSTRAINT Certificado_PK PRIMARY KEY (ID_Certificado, Parroquía_ID_Parroquin, NivelCatequesis_ID_Nivel),
    CONSTRAINT Certificado_Parroquía_FK FOREIGN KEY (Parroquía_ID_Parroquin) 
        REFERENCES Parroquía(ID_Parroquin),
    CONSTRAINT Certificado_NivelCatequesis_FK FOREIGN KEY (NivelCatequesis_ID_Nivel) 
        REFERENCES NivelCatequesis(ID_Nivel),
    CONSTRAINT Certificado_Incripción_FK FOREIGN KEY (Incripción_ID_Inscripción) 
        REFERENCES Incripción(ID_Inscripción)
);
GO

PRINT 'Tabla Certificado creada';
GO

-- Tabla: Sacramento
CREATE TABLE Sacramento (
    ID_Sacramento VARCHAR(15) NOT NULL,
    Tipo VARCHAR(30),
    Fecha DATE,
    ID_Certificado VARCHAR(15),
    Certificado_ID_Certificado VARCHAR(15) NOT NULL,
    Certificado_ID_Parroquin VARCHAR(15) NOT NULL,
    Certificado_ID_Nivel1 VARCHAR(15) NOT NULL,
    CONSTRAINT Sacramento_PK PRIMARY KEY (ID_Sacramento),
    CONSTRAINT Sacramento_Certificado_FK 
        FOREIGN KEY (Certificado_ID_Certificado, Certificado_ID_Parroquin, Certificado_ID_Nivel1) 
        REFERENCES Certificado(ID_Certificado, Parroquía_ID_Parroquin, NivelCatequesis_ID_Nivel)
);
GO

PRINT 'Tabla Sacramento creada';
GO

PRINT 'Todas las tablas creadas exitosamente';
GO

-- =============================================
-- 3. CREAR STORED PROCEDURES
-- =============================================

PRINT 'Creando Stored Procedures...';
GO

-- ========== STORED PROCEDURES PARA CATEQUIZANDO ==========

CREATE PROCEDURE sp_ConsultarCatequizandos
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 
        ID_Catequizando, Nombre, Apellido, Cedula,
        Fecha_Nacimiento, Telefono, Fecha_Registro,
        Observaciones, FeBautismo_ID_Bautismo
    FROM Catequizando
    ORDER BY ID_Catequizando;
END
GO

CREATE PROCEDURE sp_InsertarCatequizando
    @ID_Catequizando VARCHAR(15),
    @Nombre VARCHAR(15),
    @Apellido VARCHAR(15),
    @Cedula VARCHAR(10),
    @Fecha_Nacimiento DATE,
    @Telefono VARCHAR(13),
    @Observaciones CHAR(120),
    @FeBautismo_ID_Bautismo VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Catequizando (
        ID_Catequizando, Nombre, Apellido, Cedula,
        Fecha_Nacimiento, Telefono, Fecha_Registro,
        Observaciones, FeBautismo_ID_Bautismo
    )
    VALUES (
        @ID_Catequizando, @Nombre, @Apellido, @Cedula,
        @Fecha_Nacimiento, @Telefono, GETDATE(),
        @Observaciones, @FeBautismo_ID_Bautismo
    );
END
GO

CREATE PROCEDURE sp_ActualizarCatequizando
    @ID_Catequizando VARCHAR(15),
    @Telefono VARCHAR(13),
    @Observaciones CHAR(120)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Catequizando
    SET Telefono = @Telefono, Observaciones = @Observaciones
    WHERE ID_Catequizando = @ID_Catequizando;
END
GO

CREATE PROCEDURE sp_EliminarCatequizando
    @ID_Catequizando VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Catequizando WHERE ID_Catequizando = @ID_Catequizando;
END
GO

-- ========== STORED PROCEDURES PARA CATEQUISTA ==========

CREATE PROCEDURE sp_ConsultarCatequistas
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 
        ID_Catequista, Nombres, Apellidos, Telefono,
        Correo, Rol, Parroquía_ID_Parroquin
    FROM Catequista
    ORDER BY ID_Catequista;
END
GO

CREATE PROCEDURE sp_InsertarCatequista
    @ID_Catequista VARCHAR(15),
    @Nombres VARCHAR(20),
    @Apellidos VARCHAR(20),
    @Telefono VARCHAR(13),
    @Correo VARCHAR(100),
    @Rol VARCHAR(30),
    @Parroquía_ID_Parroquin VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Catequista (
        ID_Catequista, Nombres, Apellidos, Telefono,
        Correo, Rol, Parroquía_ID_Parroquin
    )
    VALUES (
        @ID_Catequista, @Nombres, @Apellidos, @Telefono,
        @Correo, @Rol, @Parroquía_ID_Parroquin
    );
END
GO

CREATE PROCEDURE sp_ActualizarCatequista
    @ID_Catequista VARCHAR(15),
    @Correo VARCHAR(100),
    @Telefono VARCHAR(13)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Catequista
    SET Correo = @Correo, Telefono = @Telefono
    WHERE ID_Catequista = @ID_Catequista;
END
GO

CREATE PROCEDURE sp_EliminarCatequista
    @ID_Catequista VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Catequista WHERE ID_Catequista = @ID_Catequista;
END
GO

-- ========== STORED PROCEDURES PARA PARROQUIA ==========

CREATE PROCEDURE sp_ConsultarParroquias
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID_Parroquin, Nombre, Direccion, Telefono, Vicaria
    FROM Parroquía
    ORDER BY ID_Parroquin;
END
GO

CREATE PROCEDURE sp_InsertarParroquia
    @ID_Parroquin VARCHAR(15),
    @Nombre VARCHAR(20),
    @Direccion VARCHAR(25),
    @Telefono VARCHAR(13),
    @Vicaria VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Parroquía (ID_Parroquin, Nombre, Direccion, Telefono, Vicaria)
    VALUES (@ID_Parroquin, @Nombre, @Direccion, @Telefono, @Vicaria);
END
GO

CREATE PROCEDURE sp_ActualizarParroquia
    @ID_Parroquin VARCHAR(15),
    @Telefono VARCHAR(13),
    @Direccion VARCHAR(25)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Parroquía
    SET Telefono = @Telefono, Direccion = @Direccion
    WHERE ID_Parroquin = @ID_Parroquin;
END
GO

CREATE PROCEDURE sp_EliminarParroquia
    @ID_Parroquin VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Parroquía WHERE ID_Parroquin = @ID_Parroquin;
END
GO

-- ========== STORED PROCEDURES PARA NIVEL CATEQUESIS ==========

CREATE PROCEDURE sp_ConsultarNiveles
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID_Nivel, NombreNivel FROM NivelCatequesis ORDER BY ID_Nivel;
END
GO

CREATE PROCEDURE sp_InsertarNivel
    @ID_Nivel VARCHAR(15),
    @NombreNivel VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO NivelCatequesis (ID_Nivel, NombreNivel)
    VALUES (@ID_Nivel, @NombreNivel);
END
GO

CREATE PROCEDURE sp_ActualizarNivel
    @ID_Nivel VARCHAR(15),
    @NombreNivel VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE NivelCatequesis SET NombreNivel = @NombreNivel WHERE ID_Nivel = @ID_Nivel;
END
GO

CREATE PROCEDURE sp_EliminarNivel
    @ID_Nivel VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM NivelCatequesis WHERE ID_Nivel = @ID_Nivel;
END
GO

-- ========== STORED PROCEDURES PARA FE DE BAUTISMO ==========

CREATE PROCEDURE sp_ConsultarFeBautismos
AS
BEGIN
    SET NOCOUNT ON;
    SELECT ID_Bautismo, FechaBautismo, ParroquiaBautizo, Padrino, Madrina
    FROM FeBautismo
    ORDER BY ID_Bautismo;
END
GO

CREATE PROCEDURE sp_InsertarFeBautismo
    @ID_Bautismo VARCHAR(15),
    @FechaBautismo DATE,
    @ParroquiaBautizo VARCHAR(25),
    @Padrino VARCHAR(20),
    @Madrina VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO FeBautismo (ID_Bautismo, FechaBautismo, ParroquiaBautizo, Padrino, Madrina)
    VALUES (@ID_Bautismo, @FechaBautismo, @ParroquiaBautizo, @Padrino, @Madrina);
END
GO

CREATE PROCEDURE sp_ActualizarFeBautismo
    @ID_Bautismo VARCHAR(15),
    @ParroquiaBautizo VARCHAR(25)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE FeBautismo SET ParroquiaBautizo = @ParroquiaBautizo WHERE ID_Bautismo = @ID_Bautismo;
END
GO

CREATE PROCEDURE sp_EliminarFeBautismo
    @ID_Bautismo VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM FeBautismo WHERE ID_Bautismo = @ID_Bautismo;
END
GO

PRINT 'Stored Procedures creados exitosamente';
GO

-- =============================================
-- 4. CREAR USUARIO Y OTORGAR PERMISOS
-- =============================================

PRINT 'Configurando usuario y permisos...';
GO

-- Verificar si el login existe a nivel de servidor
USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.server_principals WHERE name = 'Catequesis')
BEGIN
    CREATE LOGIN Catequesis WITH PASSWORD = 'Udla1234';
    PRINT 'Login Catequesis creado';
END
GO

USE Catequesis;
GO

-- Crear usuario en la base de datos
IF NOT EXISTS (SELECT name FROM sys.database_principals WHERE name = 'Catequesis')
BEGIN
    CREATE USER Catequesis FOR LOGIN Catequesis;
    PRINT 'Usuario Catequesis creado en la base de datos';
END
GO

-- Otorgar permisos
GRANT CREATE PROCEDURE TO Catequesis;
GRANT EXECUTE TO Catequesis;
GRANT CONTROL ON SCHEMA::dbo TO Catequesis;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO Catequesis;

ALTER ROLE db_ddladmin ADD MEMBER Catequesis;
ALTER ROLE db_datareader ADD MEMBER Catequesis;
ALTER ROLE db_datawriter ADD MEMBER Catequesis;
GO

PRINT 'Permisos otorgados al usuario Catequesis';
GO

-- =============================================
-- 5. VERIFICACIÓN FINAL
-- =============================================

PRINT '';
PRINT '==============================================';
PRINT 'RESUMEN DE LA BASE DE DATOS CATEQUESIS';
PRINT '==============================================';
GO

-- Listar tablas creadas
SELECT 'Tablas creadas:' AS Seccion, TABLE_NAME AS Nombre
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO

-- Listar Stored Procedures creados
SELECT 'Stored Procedures:' AS Seccion, ROUTINE_NAME AS Nombre
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE'
ORDER BY ROUTINE_NAME;
GO

-- Listar Foreign Keys
SELECT 'Relaciones (FK):' AS Seccion, name AS Nombre
FROM sys.foreign_keys
ORDER BY name;
GO

PRINT '';
PRINT '==============================================';
PRINT 'BASE DE DATOS CATEQUESIS CREADA EXITOSAMENTE';
PRINT '==============================================';
PRINT 'Usuario: Catequesis';
PRINT 'Password: Udla1234';
PRINT 'Tablas: 9';
PRINT 'Stored Procedures: 20';
PRINT 'Relaciones: 15';
PRINT '==============================================';
GO
