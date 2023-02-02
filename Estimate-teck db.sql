CREATE DATABASE estimate_teck
GO

USE estimate_teck
GO

CREATE TABlE Estado_UsuarioEmpleado
(
    Estado_Id INT NOT NULL IDENTITY CONSTRAINT Pk_Estado_Empleado PRIMARY KEY(Estado_Id),
    Estado VARCHAR(15) NOT NULL
);
GO

CREATE TABLE Cargo
(
    Cargo_Id INT NOT NULL IDENTITY CONSTRAINT Pk_cargo_Id PRIMARY KEY(Cargo_Id),
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL
);
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
    Fecha_Creacion DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Rol
(
    Id_rol INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Rol PRIMARY KEY(Id_rol),
    Nombre VARCHAR(25) NOT NULL
);
GO

CREATE TABLE Usuario
(
	Usuario_Id INT NOT NULL IDENTITY CONSTRAINT Pk_Usuario PRIMARY KEY (Usuario_Id),
	Empleado_Id INT NOT NULL CONSTRAINT Fk_EmpleadoUsuarioId FOREIGN KEY REFERENCES Empleado (Empleado_Id),
	EstadoUsuario_Id INT NOT NULL CONSTRAINT FK_Estado_Usuario FOREIGN KEY REFERENCES Estado_UsuarioEmpleado(Estado_Id),
	Id_rol INT NOT NULL CONSTRAINT Fk_RolUsuario FOREIGN KEY REFERENCES Rol (Id_rol),
	Clave VARCHAR (max) NOT NULL,
	fechaCreacion DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE TipoCliente
(
	Tipo_Id int not null identity constraint Pk_TipoCliente Primary key(Tipo_Id),
	NombreTipo_Cliente VARCHAR(25) NOT NULL
);
GO

CREATE TABLE Cliente
(
	Cliente_Id INT NOT NULL IDENTITY CONSTRAINT Pk_Cliente Primary key (Cliente_Id),
	Tipo_Id INT NOT NULL CONSTRAINT Fk_TipoClienteId FOREIGN KEY REFERENCES TipoCliente (Tipo_Id),
	Nombre VARCHAR(25) NOT NULL,
    Apellido VARCHAR(25) NOT NULL,
    Identifiacion VARCHAR(15) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Telefono_Redidencial VARCHAR(15) NULL,
    Celular VARCHAR(15) NOT NULL,
    Ciudad VARCHAR(255) NOT NULL,
    Calle VARCHAR(255) NOT NULL,
    Sector VARCHAR(255) NOT NULL,
    Fecha_Creacion DATETIME DEFAULT GETDATE()

);
GO

CREATE TABLE TarifarioHora
(
	Tarifario_Id int not null identity constraint Pk_TarifarioId primary key (Tarifario_Id),
	Cargo_Id INT NOT NULL CONSTRAINT Fk_Cargo_Usuario FOREIGN KEY REFERENCES Cargo(Cargo_Id),
	Usuario_Id INT NOT NULL CONSTRAINT Fk_Usuario_Id FOREIGN KEY REFERENCES Usuario(Usuario_Id),
	MontoTarifa money not null,
	Fecha_Creacion DATETIME NOT NULL
);
GO

CREATE TABLE ProductividadPuntoFuncion
(
	Productividad_Id int not null identity constraint Pk_ProductividadId primary key (Productividad_Id),
	Usuario_Id int not null constraint Fk_UsuarioProductividad_Id foreign key references Usuario (Usuario_Id),
	NombrePlataforma VARCHAR(255) NOT NULL,
	NivelBajo int,
	NivelMedio int,
	NivelAlto int,
	Fecha_Creacion DATETIME DEFAULT GETDATE()
);
Go

CREATE TABLE EstadoProyecto
(
	EstadoProyecto_Id INT NOT NULL IDENTITY CONSTRAINT Pk_EstadoProyecto Primary key (EstadoProyecto_Id),
	Nombre_EstadoProyecto VARCHAR(50) NOT NULL
);
GO


CREATE TABLE Proyecto
(
	Proyecto_Id INT NOT NULL IDENTITY CONSTRAINT Pk_ProyectoId Primary key (Proyecto_Id),
	EstadoProyecto_Id INT NOT NULL CONSTRAINT Fk_EstadoProyecto_Id FOREIGN KEY REFERENCES EstadoProyecto (EstadoProyecto_Id),
	Usuario_Id INT NOT NULL CONSTRAINT Fk_UsuarioProyecto_Id FOREIGN KEY REFERENCES Usuario(Usuario_Id),
	Cliente_Id INT NOT NULL CONSTRAINT Fk_ClienteProyecto_Id FOREIGN KEY REFERENCES Cliente(Cliente_Id),
	NombreProyecto VARCHAR(max) NOT NULL,
	Descripcion VARCHAR(max) NOT NULL,
	FechaInicio datetime,
	FechaFinalizacion datetime,
	FechaCreacion DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE RequerimientosCliente
(
	Requerimiento_Id int not null identity constraint Pk_RequerimientoCliente_Id primary key (Requerimiento_Id),
	Proyecto_Id int not null constraint Fk_ProyectoRequerimiento_Id foreign key references Proyecto (Proyecto_Id),
	TipoRequerimiento varchar (50),
	Descripcion varchar (max),
	FechaCreacion DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE HistorialProyecto
(
	HistorialProyecto_Id int not null identity constraint Pk_HistorialProyecto_Id primary key (HistorialProyecto_Id),
	Proyecto_Id int not null constraint Fk_HistorialProyecto_Id foreign key references Proyecto (Proyecto_Id),
	Usuario_Id int not null constraint Fk_HistorialUsurario_Id foreign key references Usuario (Usuario_Id),
	FechaCambio Datetime,
	AccionRealizada varchar (50),
	Descripcion varchar (max)
);
GO

CREATE TABLE TipoComponente
(
	TipoComponente_Id int not null identity constraint Pk_TipoComponente_Id primary key (TipoComponente_Id),
	NombreComponente varchar (100)

);
GO

CREATE TABLE Estimacion(

	Estimacion_Id int not null identity constraint Pk_Estimacion_Id primary key (Estimacion_Id),
	Proyecto_Id int not null constraint Fk_ProyectoEstimacion_Id foreign key references Proyecto (Proyecto_Id),
	Productividad_Id int not null constraint Fk_ProductividadEstimacion_Id foreign key references ProductividadPuntoFuncion (Productividad_Id),
	FactorAjuste decimal (10,2),
	TotalPuntoFuncionAjustado decimal (10,2),
	TotalPuntoFuncionSinAjustar decimal (10,2)


);

GO