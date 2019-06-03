
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/02/2019 20:12:30
-- Generated from EDMX file: C:\Users\danya\source\repos\Caitreal\Hotel2\HotelTrivago.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [hotel];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Calificacion_ToCliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Calificacion] DROP CONSTRAINT [FK_Calificacion_ToCliente];
GO
IF OBJECT_ID(N'[dbo].[FK_Calificacion_ToHabitacion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Calificacion] DROP CONSTRAINT [FK_Calificacion_ToHabitacion];
GO
IF OBJECT_ID(N'[dbo].[FK_Cliente_ToTipoCliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cliente] DROP CONSTRAINT [FK_Cliente_ToTipoCliente];
GO
IF OBJECT_ID(N'[dbo].[FK_Cliente_ToUsuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cliente] DROP CONSTRAINT [FK_Cliente_ToUsuario];
GO
IF OBJECT_ID(N'[dbo].[FK_Reserva_ToCliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reserva] DROP CONSTRAINT [FK_Reserva_ToCliente];
GO
IF OBJECT_ID(N'[dbo].[FK_Habitacion_ToTipoHabitacion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Habitacion] DROP CONSTRAINT [FK_Habitacion_ToTipoHabitacion];
GO
IF OBJECT_ID(N'[dbo].[FK_Reserva_ToHabitacion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reserva] DROP CONSTRAINT [FK_Reserva_ToHabitacion];
GO
IF OBJECT_ID(N'[dbo].[FK_PagoReserva_ToReserva]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PagoReserva] DROP CONSTRAINT [FK_PagoReserva_ToReserva];
GO
IF OBJECT_ID(N'[dbo].[FK_Reserva_ToUsuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reserva] DROP CONSTRAINT [FK_Reserva_ToUsuario];
GO
IF OBJECT_ID(N'[dbo].[FK_Usuario_ToTipoUsuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Usuario] DROP CONSTRAINT [FK_Usuario_ToTipoUsuario];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Calificacion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Calificacion];
GO
IF OBJECT_ID(N'[dbo].[Cliente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cliente];
GO
IF OBJECT_ID(N'[dbo].[Habitacion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Habitacion];
GO
IF OBJECT_ID(N'[dbo].[PagoReserva]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PagoReserva];
GO
IF OBJECT_ID(N'[dbo].[Reserva]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reserva];
GO
IF OBJECT_ID(N'[dbo].[TipoCliente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TipoCliente];
GO
IF OBJECT_ID(N'[dbo].[TipoHabitacion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TipoHabitacion];
GO
IF OBJECT_ID(N'[dbo].[TipoUsuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TipoUsuario];
GO
IF OBJECT_ID(N'[dbo].[Usuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuario];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Calificacion'
CREATE TABLE [dbo].[Calificacion] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ClienteId] int  NULL,
    [HabitacionId] int  NULL,
    [Valoracion] int  NULL
);
GO

-- Creating table 'Cliente'
CREATE TABLE [dbo].[Cliente] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Rut] varchar(10)  NOT NULL,
    [UsuarioId] int  NOT NULL,
    [TipoClienteId] int  NOT NULL
);
GO

-- Creating table 'Habitacion'
CREATE TABLE [dbo].[Habitacion] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Precio] int  NULL,
    [Descripcion] varchar(max)  NULL,
    [TipoHabitacionId] int  NULL
);
GO

-- Creating table 'PagoReserva'
CREATE TABLE [dbo].[PagoReserva] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ReservaId] int  NOT NULL,
    [Pago] int  NOT NULL,
    [FechaPago] datetime  NOT NULL
);
GO

-- Creating table 'Reserva'
CREATE TABLE [dbo].[Reserva] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [FechaInicio] datetime  NOT NULL,
    [NumeroNoches] int  NOT NULL,
    [ClienteId] int  NULL,
    [UsuarioId] int  NULL,
    [HabitacionId] int  NULL,
    [CantidadPersonas] int  NULL
);
GO

-- Creating table 'TipoCliente'
CREATE TABLE [dbo].[TipoCliente] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(100)  NULL,
    [Descuento] int  NULL
);
GO

-- Creating table 'TipoHabitacion'
CREATE TABLE [dbo].[TipoHabitacion] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(100)  NOT NULL,
    [CantidadPersonas] int  NULL
);
GO

-- Creating table 'TipoUsuario'
CREATE TABLE [dbo].[TipoUsuario] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(100)  NULL
);
GO

-- Creating table 'Usuario'
CREATE TABLE [dbo].[Usuario] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NombreUsuario] varchar(100)  NOT NULL,
    [Clave] varchar(60)  NULL,
    [TipoUsuarioId] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Calificacion'
ALTER TABLE [dbo].[Calificacion]
ADD CONSTRAINT [PK_Calificacion]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cliente'
ALTER TABLE [dbo].[Cliente]
ADD CONSTRAINT [PK_Cliente]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Habitacion'
ALTER TABLE [dbo].[Habitacion]
ADD CONSTRAINT [PK_Habitacion]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PagoReserva'
ALTER TABLE [dbo].[PagoReserva]
ADD CONSTRAINT [PK_PagoReserva]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Reserva'
ALTER TABLE [dbo].[Reserva]
ADD CONSTRAINT [PK_Reserva]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TipoCliente'
ALTER TABLE [dbo].[TipoCliente]
ADD CONSTRAINT [PK_TipoCliente]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TipoHabitacion'
ALTER TABLE [dbo].[TipoHabitacion]
ADD CONSTRAINT [PK_TipoHabitacion]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TipoUsuario'
ALTER TABLE [dbo].[TipoUsuario]
ADD CONSTRAINT [PK_TipoUsuario]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [PK_Usuario]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ClienteId] in table 'Calificacion'
ALTER TABLE [dbo].[Calificacion]
ADD CONSTRAINT [FK_Calificacion_ToCliente]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Cliente]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Calificacion_ToCliente'
CREATE INDEX [IX_FK_Calificacion_ToCliente]
ON [dbo].[Calificacion]
    ([ClienteId]);
GO

-- Creating foreign key on [HabitacionId] in table 'Calificacion'
ALTER TABLE [dbo].[Calificacion]
ADD CONSTRAINT [FK_Calificacion_ToHabitacion]
    FOREIGN KEY ([HabitacionId])
    REFERENCES [dbo].[Habitacion]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Calificacion_ToHabitacion'
CREATE INDEX [IX_FK_Calificacion_ToHabitacion]
ON [dbo].[Calificacion]
    ([HabitacionId]);
GO

-- Creating foreign key on [TipoClienteId] in table 'Cliente'
ALTER TABLE [dbo].[Cliente]
ADD CONSTRAINT [FK_Cliente_ToTipoCliente]
    FOREIGN KEY ([TipoClienteId])
    REFERENCES [dbo].[TipoCliente]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Cliente_ToTipoCliente'
CREATE INDEX [IX_FK_Cliente_ToTipoCliente]
ON [dbo].[Cliente]
    ([TipoClienteId]);
GO

-- Creating foreign key on [UsuarioId] in table 'Cliente'
ALTER TABLE [dbo].[Cliente]
ADD CONSTRAINT [FK_Cliente_ToUsuario]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Cliente_ToUsuario'
CREATE INDEX [IX_FK_Cliente_ToUsuario]
ON [dbo].[Cliente]
    ([UsuarioId]);
GO

-- Creating foreign key on [ClienteId] in table 'Reserva'
ALTER TABLE [dbo].[Reserva]
ADD CONSTRAINT [FK_Reserva_ToCliente]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Cliente]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Reserva_ToCliente'
CREATE INDEX [IX_FK_Reserva_ToCliente]
ON [dbo].[Reserva]
    ([ClienteId]);
GO

-- Creating foreign key on [TipoHabitacionId] in table 'Habitacion'
ALTER TABLE [dbo].[Habitacion]
ADD CONSTRAINT [FK_Habitacion_ToTipoHabitacion]
    FOREIGN KEY ([TipoHabitacionId])
    REFERENCES [dbo].[TipoHabitacion]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Habitacion_ToTipoHabitacion'
CREATE INDEX [IX_FK_Habitacion_ToTipoHabitacion]
ON [dbo].[Habitacion]
    ([TipoHabitacionId]);
GO

-- Creating foreign key on [HabitacionId] in table 'Reserva'
ALTER TABLE [dbo].[Reserva]
ADD CONSTRAINT [FK_Reserva_ToHabitacion]
    FOREIGN KEY ([HabitacionId])
    REFERENCES [dbo].[Habitacion]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Reserva_ToHabitacion'
CREATE INDEX [IX_FK_Reserva_ToHabitacion]
ON [dbo].[Reserva]
    ([HabitacionId]);
GO

-- Creating foreign key on [ReservaId] in table 'PagoReserva'
ALTER TABLE [dbo].[PagoReserva]
ADD CONSTRAINT [FK_PagoReserva_ToReserva]
    FOREIGN KEY ([ReservaId])
    REFERENCES [dbo].[Reserva]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PagoReserva_ToReserva'
CREATE INDEX [IX_FK_PagoReserva_ToReserva]
ON [dbo].[PagoReserva]
    ([ReservaId]);
GO

-- Creating foreign key on [UsuarioId] in table 'Reserva'
ALTER TABLE [dbo].[Reserva]
ADD CONSTRAINT [FK_Reserva_ToUsuario]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Reserva_ToUsuario'
CREATE INDEX [IX_FK_Reserva_ToUsuario]
ON [dbo].[Reserva]
    ([UsuarioId]);
GO

-- Creating foreign key on [TipoUsuarioId] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [FK_Usuario_ToTipoUsuario]
    FOREIGN KEY ([TipoUsuarioId])
    REFERENCES [dbo].[TipoUsuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Usuario_ToTipoUsuario'
CREATE INDEX [IX_FK_Usuario_ToTipoUsuario]
ON [dbo].[Usuario]
    ([TipoUsuarioId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------