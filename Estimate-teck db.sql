CREATE DATABASE estimate_teck
GO

USE estimate_teck
GO

CREATE TABlE Estado_UsuarioEmpleado
(
    Estado_Id INT NOT NULL IDENTITY CONSTRAINT Pk_Estado_Empleado PRIMARY KEY(Estado_Id),
    Estado VARCHAR(15) NOT NULL
)
GO

CREATE TABLE Cargo
(
    Cargo_Id INT NOT NULL IDENTITY CONSTRAINT Pk_cargo_Id PRIMARY KEY(Cargo_Id),
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL
)
GO

CREATE TABLE Empleado
(
    Empleado_Id INT NOT NULL IDENTITY(1,1) CONSTRAINT Pk_empleadoId PRIMARY KEY(empleado_Id),
    Estado_Id INT NOT NULL CONSTRAINT FK_Estado_UsuarioEmpleado FOREIGN KEY REFERENCES Estado_UsuarioEmpleado(Estado_Id),
    Cargo_Id INT NOT NULL CONSTRAINT Fk_Cargo_Empleado FOREIGN KEY REFERENCES Cargo(Cargo_Id),
    Nombre VARCHAR(25) NOT NULL,
    Apellido VARCHAR(25) NOT NULL,
    Identifiacion VARCHAR(15) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Telefono_Redidencial VARCHAR(15) NULL,
    Celular VARCHAR(15) NOT NULL,
    Ciudad VARCHAR(255) NOT NULL,
    Calle VARCHAR(255) NOT NULL,
    Sector VARCHAR(255) NOT NULL,
    Fecha_Creacion DATETIME NOT NULL
)
GO

CREATE TABLE Rol
(
    Id_rol INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Rol PRIMARY KEY(Id_rol),
    Nombre VARCHAR(25) NOT NULL,
    Fecha_creacion DATETIME DEFAULT GETDATE()
);
GO