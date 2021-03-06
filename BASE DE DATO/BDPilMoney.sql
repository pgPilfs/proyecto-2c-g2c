USE [master]
GO
/****** Object:  Database [PILMONEY_GC]    Script Date: 31/08/2021 20:44:20 ******/
CREATE DATABASE [PILMONEY_GC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PILMONEY_GC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\PILMONEY_GC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PILMONEY_GC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\PILMONEY_GC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PILMONEY_GC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PILMONEY_GC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PILMONEY_GC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET ARITHABORT OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PILMONEY_GC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PILMONEY_GC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PILMONEY_GC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PILMONEY_GC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET RECOVERY FULL 
GO
ALTER DATABASE [PILMONEY_GC] SET  MULTI_USER 
GO
ALTER DATABASE [PILMONEY_GC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PILMONEY_GC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PILMONEY_GC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PILMONEY_GC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PILMONEY_GC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PILMONEY_GC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PILMONEY_GC', N'ON'
GO
ALTER DATABASE [PILMONEY_GC] SET QUERY_STORE = OFF
GO
USE [PILMONEY_GC]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 31/08/2021 20:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](30) NOT NULL,
	[apellido] [nchar](30) NOT NULL,
	[email] [nchar](30) NOT NULL,
	[contrasena] [nchar](10) NOT NULL,
	[domicilio] [nchar](30) NOT NULL,
	[idLocalidad] [int] NOT NULL,
	[dni] [int] NOT NULL,
	[fotoDniFrente] [image] NULL,
	[fotoDniDorso] [image] NULL,
	[id_cuenta] [int] NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUENTA]    Script Date: 31/08/2021 20:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUENTA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[saldo] [money] NOT NULL,
	[cvu] [char](22) NOT NULL,
	[comision] [float] NOT NULL,
	[cotizacion] [smallmoney] NOT NULL,
	[calificacion_cred] [char](1) NOT NULL,
	[giro_descubierto] [char](1) NOT NULL,
	[estado] [char](1) NOT NULL,
	[id_tipoCuenta] [int] NOT NULL,
	[id_movimiento] [int] NOT NULL,
 CONSTRAINT [PK_CUENTA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOCALIDAD]    Script Date: 31/08/2021 20:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOCALIDAD](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](30) NOT NULL,
	[cp] [smallint] NOT NULL,
	[id_provincia] [int] NOT NULL,
 CONSTRAINT [PK_LOCALIDAD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOVIMIENTO]    Script Date: 31/08/2021 20:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOVIMIENTO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[monto] [money] NOT NULL,
	[fecha_hora] [datetime] NOT NULL,
	[id_destino] [int] NOT NULL,
	[id_origen] [int] NOT NULL,
	[motivo] [nchar](30) NOT NULL,
	[id_tipoMovimiento] [int] NOT NULL,
 CONSTRAINT [PK_MOVIMIENTO] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAIS]    Script Date: 31/08/2021 20:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAIS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](30) NOT NULL,
 CONSTRAINT [PK_PAIS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 31/08/2021 20:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVINCIA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](30) NOT NULL,
	[id_pais] [int] NOT NULL,
 CONSTRAINT [PK_PROVINCIA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_CUENTA]    Script Date: 31/08/2021 20:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_CUENTA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [nchar](15) NOT NULL,
 CONSTRAINT [PK_TIPO_CUENTA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_MOVIMIENTO]    Script Date: 31/08/2021 20:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_MOVIMIENTO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [nchar](20) NOT NULL,
 CONSTRAINT [PK_TIPO_MOVIMIENTO] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CLIENTE] ON 

INSERT [dbo].[CLIENTE] ([id], [nombre], [apellido], [email], [contrasena], [domicilio], [idLocalidad], [dni], [fotoDniFrente], [fotoDniDorso], [id_cuenta]) VALUES (1, N'maria                         ', N'altamirano                    ', N'marian_1490_1@hotmail.com     ', N'123       ', N'24 de Septiembre              ', 1, 35260152, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CLIENTE] OFF
GO
SET IDENTITY_INSERT [dbo].[LOCALIDAD] ON 

INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (1, N'9 de Julio                    ', 5272, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (2, N'Alta Gracia                   ', 5186, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (3, N'Agua De Oro                   ', 5107, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (4, N'Bell Ville                    ', 2550, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (5, N'Bialet Masse                  ', 5158, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (6, N'Capilla Del Monte             ', 5184, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (7, N'Cerro Colorado                ', 5821, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (8, N'Córdoba                       ', 5000, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (9, N'Cosquin                       ', 5166, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (10, N'Cruz Del Eje                  ', 5280, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (11, N'Dean Funes                    ', 5200, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (12, N'Dique Los Molinos             ', 5192, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (13, N'Embalse                       ', 5856, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (14, N'General Deheza                ', 5923, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (15, N'Hernando                      ', 5929, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (16, N'Jesus Maria                   ', 5220, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (17, N'Juarez Celman                 ', 5145, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (18, N'Justiniano Posse              ', 2553, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (19, N'La Calera                     ', 5819, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (20, N'La Falda                      ', 5172, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (21, N'Marcos Juarez                 ', 2580, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (22, N'Mina Clavero                  ', 5889, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (23, N'Monte Cristo                  ', 5125, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (24, N'Nono                          ', 5887, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (25, N'Ojo De Agua                   ', 5220, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (26, N'Panaholma                     ', 5893, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (27, N'Pilar                         ', 5972, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (28, N'Potrero De Garay              ', 5189, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (29, N'Rio Ceballos                  ', 5111, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (30, N'Rio Cuarto                    ', 5800, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (31, N'Rio Primero                   ', 5127, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (32, N'Rio Seco                      ', 5284, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (33, N'Rio Segundo                   ', 5960, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (34, N'Rio Tercero                   ', 5850, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (35, N'Salsipuedes                   ', 5113, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (36, N'San Marcos Sierra             ', 5282, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (37, N'San Roque                     ', 5199, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (38, N'Santa Catalina                ', 5825, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (39, N'Santa Rosa De Calamuchita     ', 5196, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (40, N'Tanti                         ', 5155, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (41, N'Totoral                       ', 5229, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (42, N'Unquillo                      ', 5109, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (43, N'Valle Hermoso                 ', 5168, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (44, N'Villa Allende                 ', 5105, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (45, N'Villa Carlos Paz              ', 5152, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (46, N'Villa Cura Brochero           ', 5891, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (47, N'Villa Dolores                 ', 5870, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (48, N'Villa General Belgrano        ', 5194, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (49, N'Villa Maria                   ', 5220, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (50, N'Yacanto                       ', 5877, 1)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (51, N'Avellaneda                    ', 1870, 2)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (52, N'Bahia Blanca                  ', 8000, 2)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (53, N'Banfield                      ', 1828, 2)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (54, N'Bolivar                       ', 6550, 2)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (55, N'Chacabuco                     ', 6740, 2)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (56, N'Colon                         ', 2720, 2)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (57, N'Comodoro Py                   ', 6641, 2)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (58, N'Florencio Varela              ', 1888, 2)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (59, N'Ituzaingo                     ', 1714, 2)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (60, N'La Plata                      ', 1900, 2)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (61, N'Lomas De Zamora               ', 1832, 2)
SET IDENTITY_INSERT [dbo].[LOCALIDAD] OFF
GO
SET IDENTITY_INSERT [dbo].[PAIS] ON 

INSERT [dbo].[PAIS] ([id], [nombre]) VALUES (1, N'Argentina                     ')
SET IDENTITY_INSERT [dbo].[PAIS] OFF
GO
SET IDENTITY_INSERT [dbo].[PROVINCIA] ON 

INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (1, N'Córdoba                       ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (2, N'Buenos Aires                  ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (3, N'Capital Federal               ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (4, N'Catamarca                     ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (5, N'Chaco                         ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (6, N'Chubut                        ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (7, N'Corrientes                    ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (8, N'Entre Ríos                    ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (9, N'Formosa                       ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (10, N'Jujuy                         ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (11, N'La Pampa                      ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (12, N'La Rioja                      ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (13, N'Mendoza                       ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (14, N'Misiones                      ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (15, N'Neuquén                       ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (16, N'Río Negro                     ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (17, N'Salta                         ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (18, N'San Juan                      ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (19, N'San Luis                      ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (20, N'Santa Cruz                    ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (21, N'Santa Fe                      ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (22, N'Santiago del Estero           ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (23, N'Tierra del Fuego              ', 1)
INSERT [dbo].[PROVINCIA] ([id], [nombre], [id_pais]) VALUES (24, N'Tucumán                       ', 1)
SET IDENTITY_INSERT [dbo].[PROVINCIA] OFF
GO
SET IDENTITY_INSERT [dbo].[TIPO_CUENTA] ON 

INSERT [dbo].[TIPO_CUENTA] ([id], [tipo]) VALUES (1, N'pesos          ')
INSERT [dbo].[TIPO_CUENTA] ([id], [tipo]) VALUES (2, N'dólares        ')
SET IDENTITY_INSERT [dbo].[TIPO_CUENTA] OFF
GO
SET IDENTITY_INSERT [dbo].[TIPO_MOVIMIENTO] ON 

INSERT [dbo].[TIPO_MOVIMIENTO] ([id], [tipo]) VALUES (1, N'transferencia       ')
INSERT [dbo].[TIPO_MOVIMIENTO] ([id], [tipo]) VALUES (2, N'ingreso dinero      ')
INSERT [dbo].[TIPO_MOVIMIENTO] ([id], [tipo]) VALUES (3, N'retiro dinero       ')
INSERT [dbo].[TIPO_MOVIMIENTO] ([id], [tipo]) VALUES (4, N'giro al descubierto ')
SET IDENTITY_INSERT [dbo].[TIPO_MOVIMIENTO] OFF
GO
ALTER TABLE [dbo].[CLIENTE]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTE_CUENTA] FOREIGN KEY([id_cuenta])
REFERENCES [dbo].[CUENTA] ([id])
GO
ALTER TABLE [dbo].[CLIENTE] CHECK CONSTRAINT [FK_CLIENTE_CUENTA]
GO
ALTER TABLE [dbo].[CLIENTE]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTE_LOCALIDAD] FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[LOCALIDAD] ([id])
GO
ALTER TABLE [dbo].[CLIENTE] CHECK CONSTRAINT [FK_CLIENTE_LOCALIDAD]
GO
ALTER TABLE [dbo].[CUENTA]  WITH CHECK ADD  CONSTRAINT [FK_CUENTA_MOVIMIENTO] FOREIGN KEY([id_movimiento])
REFERENCES [dbo].[MOVIMIENTO] ([id])
GO
ALTER TABLE [dbo].[CUENTA] CHECK CONSTRAINT [FK_CUENTA_MOVIMIENTO]
GO
ALTER TABLE [dbo].[CUENTA]  WITH CHECK ADD  CONSTRAINT [FK_CUENTA_TIPO_CUENTA] FOREIGN KEY([id_tipoCuenta])
REFERENCES [dbo].[TIPO_CUENTA] ([id])
GO
ALTER TABLE [dbo].[CUENTA] CHECK CONSTRAINT [FK_CUENTA_TIPO_CUENTA]
GO
ALTER TABLE [dbo].[LOCALIDAD]  WITH CHECK ADD  CONSTRAINT [FK_LOCALIDAD_PROVINCIA] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[PROVINCIA] ([id])
GO
ALTER TABLE [dbo].[LOCALIDAD] CHECK CONSTRAINT [FK_LOCALIDAD_PROVINCIA]
GO
ALTER TABLE [dbo].[MOVIMIENTO]  WITH CHECK ADD  CONSTRAINT [FK_MOVIMIENTO_TIPO_MOVIMIENTO] FOREIGN KEY([id_tipoMovimiento])
REFERENCES [dbo].[TIPO_MOVIMIENTO] ([id])
GO
ALTER TABLE [dbo].[MOVIMIENTO] CHECK CONSTRAINT [FK_MOVIMIENTO_TIPO_MOVIMIENTO]
GO
ALTER TABLE [dbo].[PROVINCIA]  WITH CHECK ADD  CONSTRAINT [FK_PROVINCIA_PAIS] FOREIGN KEY([id_pais])
REFERENCES [dbo].[PAIS] ([id])
GO
ALTER TABLE [dbo].[PROVINCIA] CHECK CONSTRAINT [FK_PROVINCIA_PAIS]
GO
/****** Object:  StoredProcedure [dbo].[listar_cliente]    Script Date: 31/08/2021 20:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[listar_cliente] 
	-- Add the parameters for the stored procedure here
	@id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id], [nombre],[apellido],[email],[contrasena],[domicilio],[idLocalidad],[dni],[id_cuenta]
	from dbo.CLIENTE where id = @id;
END
GO
USE [master]
GO
ALTER DATABASE [PILMONEY_GC] SET  READ_WRITE 
GO
