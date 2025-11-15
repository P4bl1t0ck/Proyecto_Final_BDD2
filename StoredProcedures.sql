-- =============================================
-- Stored Procedures para la Base de Datos Catequesis
-- Gestión de múltiples tablas
-- =============================================

USE Catequesis;
GO

-- =============================================
-- STORED PROCEDURES PARA CATEQUIZANDO
-- =============================================

-- SP: Consultar todos los Catequizandos
IF OBJECT_ID('sp_ConsultarCatequizandos', 'P') IS NOT NULL
    DROP PROCEDURE sp_ConsultarCatequizandos;
GO

CREATE PROCEDURE sp_ConsultarCatequizandos
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        ID_Catequizando,
        Nombre,
        Apellido,
        Cedula,
        Fecha_Nacimiento,
        Telefono,
        Fecha_Registro,
        Observaciones,
        FeBautismo_ID_Bautismo
    FROM Catequizando
    ORDER BY ID_Catequizando;
END
GO

-- SP: Insertar un nuevo Catequizando
IF OBJECT_ID('sp_InsertarCatequizando', 'P') IS NOT NULL
    DROP PROCEDURE sp_InsertarCatequizando;
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
    
    BEGIN TRY
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
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- SP: Actualizar Catequizando
IF OBJECT_ID('sp_ActualizarCatequizando', 'P') IS NOT NULL
    DROP PROCEDURE sp_ActualizarCatequizando;
GO

CREATE PROCEDURE sp_ActualizarCatequizando
    @ID_Catequizando VARCHAR(15),
    @Telefono VARCHAR(13),
    @Observaciones CHAR(120)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        UPDATE Catequizando
        SET Telefono = @Telefono,
            Observaciones = @Observaciones
        WHERE ID_Catequizando = @ID_Catequizando;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- SP: Eliminar Catequizando
IF OBJECT_ID('sp_EliminarCatequizando', 'P') IS NOT NULL
    DROP PROCEDURE sp_EliminarCatequizando;
GO

CREATE PROCEDURE sp_EliminarCatequizando
    @ID_Catequizando VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        DELETE FROM Catequizando
        WHERE ID_Catequizando = @ID_Catequizando;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- =============================================
-- STORED PROCEDURES PARA CATEQUISTA
-- =============================================

-- SP: Consultar todos los Catequistas
IF OBJECT_ID('sp_ConsultarCatequistas', 'P') IS NOT NULL
    DROP PROCEDURE sp_ConsultarCatequistas;
GO

CREATE PROCEDURE sp_ConsultarCatequistas
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        ID_Catequista,
        Nombres,
        Apellidos,
        Telefono,
        Correo,
        Rol,
        Parroquía_ID_Parroquin
    FROM Catequista
    ORDER BY ID_Catequista;
END
GO

-- SP: Insertar un nuevo Catequista
IF OBJECT_ID('sp_InsertarCatequista', 'P') IS NOT NULL
    DROP PROCEDURE sp_InsertarCatequista;
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
    
    BEGIN TRY
        INSERT INTO Catequista (
            ID_Catequista, Nombres, Apellidos, Telefono,
            Correo, Rol, Parroquía_ID_Parroquin
        )
        VALUES (
            @ID_Catequista, @Nombres, @Apellidos, @Telefono,
            @Correo, @Rol, @Parroquía_ID_Parroquin
        );
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- SP: Actualizar Catequista
IF OBJECT_ID('sp_ActualizarCatequista', 'P') IS NOT NULL
    DROP PROCEDURE sp_ActualizarCatequista;
GO

CREATE PROCEDURE sp_ActualizarCatequista
    @ID_Catequista VARCHAR(15),
    @Correo VARCHAR(100),
    @Telefono VARCHAR(13)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        UPDATE Catequista
        SET Correo = @Correo,
            Telefono = @Telefono
        WHERE ID_Catequista = @ID_Catequista;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- SP: Eliminar Catequista
IF OBJECT_ID('sp_EliminarCatequista', 'P') IS NOT NULL
    DROP PROCEDURE sp_EliminarCatequista;
GO

CREATE PROCEDURE sp_EliminarCatequista
    @ID_Catequista VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        DELETE FROM Catequista
        WHERE ID_Catequista = @ID_Catequista;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- =============================================
-- STORED PROCEDURES PARA PARROQUIA
-- =============================================

-- SP: Consultar todas las Parroquias
IF OBJECT_ID('sp_ConsultarParroquias', 'P') IS NOT NULL
    DROP PROCEDURE sp_ConsultarParroquias;
GO

CREATE PROCEDURE sp_ConsultarParroquias
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        ID_Parroquin,
        Nombre,
        Direccion,
        Telefono,
        Vicaria
    FROM Parroquía
    ORDER BY ID_Parroquin;
END
GO

-- SP: Insertar una nueva Parroquia
IF OBJECT_ID('sp_InsertarParroquia', 'P') IS NOT NULL
    DROP PROCEDURE sp_InsertarParroquia;
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
    
    BEGIN TRY
        INSERT INTO Parroquía (
            ID_Parroquin, Nombre, Direccion, Telefono, Vicaria
        )
        VALUES (
            @ID_Parroquin, @Nombre, @Direccion, @Telefono, @Vicaria
        );
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- SP: Actualizar Parroquia
IF OBJECT_ID('sp_ActualizarParroquia', 'P') IS NOT NULL
    DROP PROCEDURE sp_ActualizarParroquia;
GO

CREATE PROCEDURE sp_ActualizarParroquia
    @ID_Parroquin VARCHAR(15),
    @Telefono VARCHAR(13),
    @Direccion VARCHAR(25)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        UPDATE Parroquía
        SET Telefono = @Telefono,
            Direccion = @Direccion
        WHERE ID_Parroquin = @ID_Parroquin;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- SP: Eliminar Parroquia
IF OBJECT_ID('sp_EliminarParroquia', 'P') IS NOT NULL
    DROP PROCEDURE sp_EliminarParroquia;
GO

CREATE PROCEDURE sp_EliminarParroquia
    @ID_Parroquin VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        DELETE FROM Parroquía
        WHERE ID_Parroquin = @ID_Parroquin;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- =============================================
-- STORED PROCEDURES PARA NIVEL CATEQUESIS
-- =============================================

-- SP: Consultar todos los Niveles
IF OBJECT_ID('sp_ConsultarNiveles', 'P') IS NOT NULL
    DROP PROCEDURE sp_ConsultarNiveles;
GO

CREATE PROCEDURE sp_ConsultarNiveles
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        ID_Nivel,
        NombreNivel
    FROM NivelCatequesis
    ORDER BY ID_Nivel;
END
GO

-- SP: Insertar un nuevo Nivel
IF OBJECT_ID('sp_InsertarNivel', 'P') IS NOT NULL
    DROP PROCEDURE sp_InsertarNivel;
GO

CREATE PROCEDURE sp_InsertarNivel
    @ID_Nivel VARCHAR(15),
    @NombreNivel VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        INSERT INTO NivelCatequesis (ID_Nivel, NombreNivel)
        VALUES (@ID_Nivel, @NombreNivel);
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- SP: Actualizar Nivel
IF OBJECT_ID('sp_ActualizarNivel', 'P') IS NOT NULL
    DROP PROCEDURE sp_ActualizarNivel;
GO

CREATE PROCEDURE sp_ActualizarNivel
    @ID_Nivel VARCHAR(15),
    @NombreNivel VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        UPDATE NivelCatequesis
        SET NombreNivel = @NombreNivel
        WHERE ID_Nivel = @ID_Nivel;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- SP: Eliminar Nivel
IF OBJECT_ID('sp_EliminarNivel', 'P') IS NOT NULL
    DROP PROCEDURE sp_EliminarNivel;
GO

CREATE PROCEDURE sp_EliminarNivel
    @ID_Nivel VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        DELETE FROM NivelCatequesis
        WHERE ID_Nivel = @ID_Nivel;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- =============================================
-- STORED PROCEDURES PARA FE DE BAUTISMO
-- =============================================

-- SP: Consultar todas las Fe de Bautismo
IF OBJECT_ID('sp_ConsultarFeBautismos', 'P') IS NOT NULL
    DROP PROCEDURE sp_ConsultarFeBautismos;
GO

CREATE PROCEDURE sp_ConsultarFeBautismos
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        ID_Bautismo,
        FechaBautismo,
        ParroquiaBautizo,
        Padrino,
        Madrina
    FROM FeBautismo
    ORDER BY ID_Bautismo;
END
GO

-- SP: Insertar una nueva Fe de Bautismo
IF OBJECT_ID('sp_InsertarFeBautismo', 'P') IS NOT NULL
    DROP PROCEDURE sp_InsertarFeBautismo;
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
    
    BEGIN TRY
        INSERT INTO FeBautismo (
            ID_Bautismo, FechaBautismo, ParroquiaBautizo, Padrino, Madrina
        )
        VALUES (
            @ID_Bautismo, @FechaBautismo, @ParroquiaBautizo, @Padrino, @Madrina
        );
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- SP: Actualizar Fe de Bautismo
IF OBJECT_ID('sp_ActualizarFeBautismo', 'P') IS NOT NULL
    DROP PROCEDURE sp_ActualizarFeBautismo;
GO

CREATE PROCEDURE sp_ActualizarFeBautismo
    @ID_Bautismo VARCHAR(15),
    @ParroquiaBautizo VARCHAR(25)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        UPDATE FeBautismo
        SET ParroquiaBautizo = @ParroquiaBautizo
        WHERE ID_Bautismo = @ID_Bautismo;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- SP: Eliminar Fe de Bautismo
IF OBJECT_ID('sp_EliminarFeBautismo', 'P') IS NOT NULL
    DROP PROCEDURE sp_EliminarFeBautismo;
GO

CREATE PROCEDURE sp_EliminarFeBautismo
    @ID_Bautismo VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        DELETE FROM FeBautismo
        WHERE ID_Bautismo = @ID_Bautismo;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- =============================================
-- Verificar que los Stored Procedures se crearon correctamente
-- =============================================
SELECT 
    ROUTINE_NAME AS 'Stored Procedure',
    CREATED AS 'Fecha Creación'
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE'
    AND ROUTINE_NAME LIKE 'sp_%'
ORDER BY ROUTINE_NAME;
GO

