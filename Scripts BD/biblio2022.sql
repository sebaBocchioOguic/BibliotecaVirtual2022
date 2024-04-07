USE [biblioteca2022]
CREATE TYPE [dbo].[TAutores] AS TABLE(
	[idAutor] [int] NOT NULL
)
GO
/****** Object:  Table [dbo].[Autores]    Script Date: 25/10/2021 10:17:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autores](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NULL,
	[IdPais] [int] NOT NULL,
 CONSTRAINT [PK_Autores] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 25/10/2021 10:17:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaAutores]    Script Date: 25/10/2021 10:17:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[VistaAutores]
as
select 
	a.ID as IdAutor,
	a.Apellido,
	a.Nombre,
	a.FechaNacimiento,
	p.Nombre as Pais
from autores as a
inner join paises as p on p.ID=a.IdPais
GO
/****** Object:  Table [dbo].[Editoriales]    Script Date: 25/10/2021 10:17:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editoriales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 25/10/2021 10:17:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 25/10/2021 10:17:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ISBN] [varchar](17) NULL,
	[Titulo] [varchar](max) NOT NULL,
	[Edicion] [int] NULL,
	[IdGenero] [int] NULL,
	[IdEditorial] [int] NULL,
 CONSTRAINT [PK__Libros__3214EC07F58F9696] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibrosAutores]    Script Date: 25/10/2021 10:17:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibrosAutores](
	[IdLibro] [int] NOT NULL,
	[IdAutor] [int] NOT NULL,
 CONSTRAINT [PK_LibrosAutores] PRIMARY KEY CLUSTERED 
(
	[IdLibro] ASC,
	[IdAutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogLibros]    Script Date: 25/10/2021 10:17:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogLibros](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdLibro] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Usuario] [varchar](30) NOT NULL,
 CONSTRAINT [PK_LogLibros] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autores] ON 
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (1, N'Borges', N'Jorge Luis', CAST(N'1899-08-08' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (2, N'Sabato', N'Ernesto', CAST(N'1920-10-12' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (3, N'Cortazar', N'Julio', CAST(N'1943-12-20' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (4, N'Garcia Marquez', N'Gabriel', CAST(N'1917-12-20' AS Date), 4)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (5, N'Bioy Casares', N'Adolfo', CAST(N'1927-12-20' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (6, N'Pigna', N'Felipe', CAST(N'1962-04-02' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (7, N'Galeano', N'Eduardo', CAST(N'1971-12-20' AS Date), 2)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (8, N'Neruda', N'Pablo', CAST(N'1918-12-20' AS Date), 5)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (9, N'Vargas Llosa', N'Mario', CAST(N'1940-05-01' AS Date), 7)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (10, N'Benedetti', N'Mario', CAST(N'1923-10-10' AS Date), 3)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (11, N'Paz', N'OctavO', CAST(N'1914-03-31' AS Date), 4)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (12, N'Mistral', N'Gabriela', CAST(N'1889-04-07' AS Date), 2)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (13, N'Allende', N'Isabel', CAST(N'1942-08-02' AS Date), 2)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (14, N'Hernandez', N'Jose', CAST(N'1834-11-10' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (15, N'Arlt', N'Roberto', CAST(N'1900-11-10' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (16, N'Coelho', N'Paulo', CAST(N'1947-11-10' AS Date), 4)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (17, N'Rulfo', N'Juan', CAST(N'1917-12-20' AS Date), 2)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (18, N'Mujica Lainez', N'Manuel', CAST(N'1920-12-26' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (19, N'Sarmiento', N'Domingo', CAST(N'1812-01-12' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (20, N'Tofler', N'Alvin', CAST(N'1939-12-26' AS Date), 3)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (23, N'Perez', N'Jorgelina', CAST(N'1999-07-17' AS Date), 2)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (24, N'Gonzalez', N'Carlos', CAST(N'1989-02-02' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (25, N'Iglesias', N'Maria Belen', CAST(N'1991-04-25' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (26, N'Velasquez', N'Julio', CAST(N'1991-10-24' AS Date), 4)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (27, N'Vazquez', N'Pablo', CAST(N'1990-04-04' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (28, N'Garcia', N'pepe', CAST(N'2018-07-01' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (30, N'Palacios', N'Ezequiel', CAST(N'1990-12-12' AS Date), 11)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (1032, N'Balmaceda', N'Daniel', CAST(N'1980-03-12' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (2029, N'Garcia', N'Juan', CAST(N'1980-03-12' AS Date), 8)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (2032, N'Garcia', N'Juan Jose', CAST(N'1980-01-05' AS Date), 4)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (2033, N'Bayones', N'Matias', CAST(N'1985-06-05' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (2034, N'Montenegro', N'Teresita', CAST(N'1980-01-01' AS Date), 4)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (5035, N'Perez', N'Enzo', CAST(N'1990-02-12' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (5036, N'Fernandez', N'Enzo', CAST(N'1990-02-12' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (5038, N'Rayan', N'Cristian', CAST(N'1980-09-05' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (5039, N'Romero', N'Brian', CAST(N'1996-01-01' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (5040, N'Di Maria', N'Angel', CAST(N'1993-01-01' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (5041, N'Girotti', N'Federico', CAST(N'2000-01-01' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (5042, N'Sacheri', N'Eduardo', CAST(N'1967-01-01' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (5043, N'Rojo', N'Alberto', CAST(N'1970-10-02' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[Autores] OFF
GO
SET IDENTITY_INSERT [dbo].[Editoriales] ON 
GO
INSERT [dbo].[Editoriales] ([Id], [Nombre]) VALUES (1, N'Sudamericana')
GO
INSERT [dbo].[Editoriales] ([Id], [Nombre]) VALUES (2, N'Planeta')
GO
INSERT [dbo].[Editoriales] ([Id], [Nombre]) VALUES (3, N'Alfaguara')
GO
INSERT [dbo].[Editoriales] ([Id], [Nombre]) VALUES (4, N'Santillana')
GO
INSERT [dbo].[Editoriales] ([Id], [Nombre]) VALUES (5, N'Kapeluz')
GO
INSERT [dbo].[Editoriales] ([Id], [Nombre]) VALUES (7, N'Ediciones EMECE')
GO
SET IDENTITY_INSERT [dbo].[Editoriales] OFF
GO
SET IDENTITY_INSERT [dbo].[Generos] ON 
GO
INSERT [dbo].[Generos] ([Id], [Nombre]) VALUES (2, N'Novelas')
GO
INSERT [dbo].[Generos] ([Id], [Nombre]) VALUES (3, N'Cuentos Infantiles')
GO
INSERT [dbo].[Generos] ([Id], [Nombre]) VALUES (4, N'Policial')
GO
INSERT [dbo].[Generos] ([Id], [Nombre]) VALUES (5, N'Ciencia Ficcion')
GO
INSERT [dbo].[Generos] ([Id], [Nombre]) VALUES (7, N'Cuentos')
GO
INSERT [dbo].[Generos] ([Id], [Nombre]) VALUES (8, N'Historia')
GO
SET IDENTITY_INSERT [dbo].[Generos] OFF
GO
SET IDENTITY_INSERT [dbo].[Libros] ON 
GO
INSERT [dbo].[Libros] ([Id], [ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (7, N'978-987-738-054-5', N'Los dueños del mundo', 2019, 7, 3)
GO
INSERT [dbo].[Libros] ([Id], [ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (8, N'978-987-629-977-0', N'Borges Y la Fisica Cuantica', 2013, 7, 3)
GO
INSERT [dbo].[Libros] ([Id], [ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (9, N'950-49-1342-3', N'Los Mitos de la Argentina II', 2003, 2, 3)
GO
INSERT [dbo].[Libros] ([Id], [ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (10, N'978-842-0-419862', N'La tía Julia y el escribidor', 2010, 2, 2)
GO
INSERT [dbo].[Libros] ([Id], [ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (11, N'978-987-545-484-2', N'Historias insolitas de la hist', 2009, 2, 2)
GO
INSERT [dbo].[Libros] ([Id], [ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (12, N'978-987-738-249-5', N'Te conozco mendizabal', 2012, 7, 3)
GO
INSERT [dbo].[Libros] ([Id], [ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial]) VALUES (13, N'978-950-07-5242-8', N'BORN', 2015, 8, 1)
GO
SET IDENTITY_INSERT [dbo].[Libros] OFF
GO
INSERT [dbo].[LibrosAutores] ([IdLibro], [IdAutor]) VALUES (7, 5042)
GO
INSERT [dbo].[LibrosAutores] ([IdLibro], [IdAutor]) VALUES (8, 5042)
GO
INSERT [dbo].[LibrosAutores] ([IdLibro], [IdAutor]) VALUES (8, 5043)
GO
INSERT [dbo].[LibrosAutores] ([IdLibro], [IdAutor]) VALUES (9, 6)
GO
INSERT [dbo].[LibrosAutores] ([IdLibro], [IdAutor]) VALUES (9, 7)
GO
INSERT [dbo].[LibrosAutores] ([IdLibro], [IdAutor]) VALUES (9, 9)
GO
INSERT [dbo].[LibrosAutores] ([IdLibro], [IdAutor]) VALUES (10, 9)
GO
INSERT [dbo].[LibrosAutores] ([IdLibro], [IdAutor]) VALUES (10, 10)
GO
INSERT [dbo].[LibrosAutores] ([IdLibro], [IdAutor]) VALUES (11, 1)
GO
INSERT [dbo].[LibrosAutores] ([IdLibro], [IdAutor]) VALUES (11, 1032)
GO
INSERT [dbo].[LibrosAutores] ([IdLibro], [IdAutor]) VALUES (12, 5042)
GO
INSERT [dbo].[LibrosAutores] ([IdLibro], [IdAutor]) VALUES (13, 2)
GO
INSERT [dbo].[LibrosAutores] ([IdLibro], [IdAutor]) VALUES (13, 3)
GO
SET IDENTITY_INSERT [dbo].[LogLibros] ON 
GO
INSERT [dbo].[LogLibros] ([Id], [IdLibro], [Fecha], [Usuario]) VALUES (1, 1, CAST(N'2021-08-12T21:42:21.417' AS DateTime), N'dbo')
GO
INSERT [dbo].[LogLibros] ([Id], [IdLibro], [Fecha], [Usuario]) VALUES (2, 3, CAST(N'2021-08-12T21:47:59.673' AS DateTime), N'dbo')
GO
INSERT [dbo].[LogLibros] ([Id], [IdLibro], [Fecha], [Usuario]) VALUES (3, 4, CAST(N'2021-08-17T16:59:59.897' AS DateTime), N'dbo')
GO
INSERT [dbo].[LogLibros] ([Id], [IdLibro], [Fecha], [Usuario]) VALUES (4, 5, CAST(N'2021-08-17T17:21:14.643' AS DateTime), N'dbo')
GO
INSERT [dbo].[LogLibros] ([Id], [IdLibro], [Fecha], [Usuario]) VALUES (5, 6, CAST(N'2021-08-17T17:23:29.420' AS DateTime), N'dbo')
GO
INSERT [dbo].[LogLibros] ([Id], [IdLibro], [Fecha], [Usuario]) VALUES (6, 7, CAST(N'2021-08-17T17:36:42.970' AS DateTime), N'dbo')
GO
INSERT [dbo].[LogLibros] ([Id], [IdLibro], [Fecha], [Usuario]) VALUES (7, 8, CAST(N'2021-08-17T17:53:56.710' AS DateTime), N'dbo')
GO
INSERT [dbo].[LogLibros] ([Id], [IdLibro], [Fecha], [Usuario]) VALUES (8, 9, CAST(N'2021-08-17T17:55:33.420' AS DateTime), N'dbo')
GO
INSERT [dbo].[LogLibros] ([Id], [IdLibro], [Fecha], [Usuario]) VALUES (9, 10, CAST(N'2021-08-17T17:57:15.923' AS DateTime), N'dbo')
GO
INSERT [dbo].[LogLibros] ([Id], [IdLibro], [Fecha], [Usuario]) VALUES (10, 11, CAST(N'2021-08-17T19:52:13.177' AS DateTime), N'dbo')
GO
INSERT [dbo].[LogLibros] ([Id], [IdLibro], [Fecha], [Usuario]) VALUES (11, 12, CAST(N'2021-08-17T19:59:46.233' AS DateTime), N'dbo')
GO
INSERT [dbo].[LogLibros] ([Id], [IdLibro], [Fecha], [Usuario]) VALUES (12, 13, CAST(N'2021-08-17T21:06:37.590' AS DateTime), N'dbo')
GO
SET IDENTITY_INSERT [dbo].[LogLibros] OFF
GO
SET IDENTITY_INSERT [dbo].[Paises] ON 
GO
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (1, N'Argentina')
GO
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (2, N'Uruguay')
GO
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (3, N'Brasil')
GO
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (4, N'Colombia')
GO
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (5, N'Chile')
GO
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (7, N'Peru')
GO
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (8, N'Paraguay')
GO
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (9, N'Rusia')
GO
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (10, N'España')
GO
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (11, N'Mexico')
GO
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (12, N'Finlandia')
GO
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (13, N'Italia')
GO
INSERT [dbo].[Paises] ([Id], [Nombre]) VALUES (15, N'Grecia')
GO
SET IDENTITY_INSERT [dbo].[Paises] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Libros__447D36EA22E5BCB8]    Script Date: 25/10/2021 10:17:49 ******/
ALTER TABLE [dbo].[Libros] ADD  CONSTRAINT [UQ__Libros__447D36EA22E5BCB8] UNIQUE NONCLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Autores]  WITH CHECK ADD  CONSTRAINT [FK_Autores_Paises] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Paises] ([Id])
GO
ALTER TABLE [dbo].[Autores] CHECK CONSTRAINT [FK_Autores_Paises]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Editoriales] FOREIGN KEY([IdEditorial])
REFERENCES [dbo].[Editoriales] ([Id])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Editoriales]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Generos] FOREIGN KEY([IdGenero])
REFERENCES [dbo].[Generos] ([Id])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Generos]
GO
ALTER TABLE [dbo].[LibrosAutores]  WITH CHECK ADD  CONSTRAINT [FK_LibrosAutores_Libros] FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libros] ([Id])
GO
ALTER TABLE [dbo].[LibrosAutores] CHECK CONSTRAINT [FK_LibrosAutores_Libros]
GO
/****** Object:  StoredProcedure [dbo].[ProcAltaAutor]    Script Date: 25/10/2021 10:17:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProcAltaAutor]
(
	@Apellido varchar(50),
	@Nombre varchar(50),
	@FechaNacimiento date,
	@IdPais int

)
as
begin try
	begin transaction
		insert into autores(apellido,Nombre,FechaNacimiento,IdPais)
		values(@apellido,@Nombre,@FechaNacimiento,@IdPais)

		declare @idAutor int
		set @idAutor=@@IDENTITY

		insert into LogAutores(Fecha,Usuario,idAutor,Apellido,Nombre,Estado)
		values(GETDATE(),CURRENT_USER,@idAutor,@Apellido,@Nombre,'ALTA')

		-- confirmo la tranaccion
		commit transaction

end try
begin catch
	-- cancelar la tranaccion
	rollback transaction

	-- informar del error
	raiserror('Hubo un error , no se agrego el autor',16,1)

end catch
GO
/****** Object:  StoredProcedure [dbo].[ProcBorraAutor]    Script Date: 25/10/2021 10:17:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProcBorraAutor]
(
	@ID int
)
as
begin try
	begin transaction
		declare @apellido varchar(50)
		declare @nombre varchar(50)
		-- busco apellido y nombre y asigno a las variables
		set @apellido=(select apellido from autores where id=@ID)
		set @nombre=(select nombre from autores where id=@ID)

		delete Autores where ID=@ID

		insert into LogAutores(Fecha,Usuario,idAutor,Apellido,Nombre,Estado)
		values(GETDATE(),CURRENT_USER,@ID,@Apellido,@Nombre,'BAJA')

		-- confirmo la tranaccion
		commit transaction

end try
begin catch
	-- cancelar la tranaccion
	rollback transaction

	-- informar del error
	raiserror('Hubo un error , no se elimino el autor',16,1)

end catch
GO
/****** Object:  StoredProcedure [dbo].[ProcModiAutor]    Script Date: 25/10/2021 10:17:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProcModiAutor]
(
	@ID int,
	@Apellido varchar(50),
	@Nombre varchar(50),
	@FechaNacimiento date,
	@IdPais int

)
as
begin try
	begin transaction
		
		update Autores
		set Apellido=@Apellido,
			Nombre=@Nombre,
			FechaNacimiento=@FechaNacimiento,
			IdPais=@IdPais
		where ID=@ID

		insert into LogAutores(Fecha,Usuario,idAutor,Apellido,Nombre,Estado)
		values(GETDATE(),CURRENT_USER,@ID,@Apellido,@Nombre,'MODIFICACION')

		-- confirmo la tranaccion
		commit transaction

end try
begin catch
	-- cancelar la tranaccion
	rollback transaction

	-- informar del error
	raiserror('Hubo un error , no se modifico el autor',16,1)

end catch
GO
USE [master]
GO
ALTER DATABASE [biblioteca2022] SET  READ_WRITE 
GO
