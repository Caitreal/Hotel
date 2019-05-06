SET IDENTITY_INSERT [dbo].[Usuario] ON
INSERT INTO [dbo].[Usuario] ([Id], [NombreUsuario], [Clave], [TipoUsuarioId]) VALUES (1, N'PERRITO', N'GUAU', 1)
INSERT INTO [dbo].[Usuario] ([Id], [NombreUsuario], [Clave], [TipoUsuarioId]) VALUES (2, N'GATITO', N'MIAU', 2)
INSERT INTO [dbo].[Usuario] ([Id], [NombreUsuario], [Clave], [TipoUsuarioId]) VALUES (3, N'POLLITO', N'PIO', 2)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
