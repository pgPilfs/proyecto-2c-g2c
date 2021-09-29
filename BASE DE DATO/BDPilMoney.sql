USE [pilmoneygc]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 29/09/2021 12:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](30) NOT NULL,
	[apellido] [nchar](30) NOT NULL,
	[email] [nchar](50) NOT NULL,
	[contrasena] [nchar](10) NOT NULL,
	[domicilio] [nchar](30) NOT NULL,
	[idLocalidad] [int] NOT NULL,
	[dni] [int] NOT NULL,
	[fechaNacimiento] [datetime] NOT NULL,
	[id_cuenta] [int] NOT NULL,
	[cuil] [char](11) NOT NULL,
	[genero] [nchar](15) NOT NULL,
	[nacionalidad] [nchar](15) NOT NULL,
	[fotoDniFrente] [image] NULL,
	[fotoDniDorso] [image] NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUENTA]    Script Date: 29/09/2021 12:27:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUENTA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[saldo] [float] NOT NULL,
	[cvu] [char](22) NOT NULL,
	[comision] [float] NOT NULL,
	[cotizacion] [float] NOT NULL,
	[calificacion_cred] [char](1) NOT NULL,
	[giro_descubierto] [char](1) NOT NULL,
	[estado] [char](1) NOT NULL,
	[id_tipoCuenta] [int] NOT NULL,
	[id_movimiento] [int] NOT NULL,
 CONSTRAINT [PK_CUENTA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOCALIDAD]    Script Date: 29/09/2021 12:27:29 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOVIMIENTO]    Script Date: 29/09/2021 12:27:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOVIMIENTO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[monto] [float] NOT NULL,
	[fecha_hora] [datetime] NOT NULL,
	[id_destino] [int] NULL,
	[id_origen] [int] NULL,
	[motivo] [nchar](30) NOT NULL,
	[id_tipoMovimiento] [int] NOT NULL,
 CONSTRAINT [PK_MOVIMIENTO] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAIS]    Script Date: 29/09/2021 12:27:29 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 29/09/2021 12:27:29 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_CUENTA]    Script Date: 29/09/2021 12:27:29 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_MOVIMIENTO]    Script Date: 29/09/2021 12:27:29 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CLIENTE] ON 

INSERT [dbo].[CLIENTE] ([id], [nombre], [apellido], [email], [contrasena], [domicilio], [idLocalidad], [dni], [fechaNacimiento], [id_cuenta], [cuil], [genero], [nacionalidad], [fotoDniFrente], [fotoDniDorso]) VALUES (1, N'javier                        ', N'altamirano                    ', N'javier@yahoo.com                                  ', N'123231541 ', N'24 de Septiembre              ', 30, 34601075, CAST(N'2019-01-01T00:00:00.000' AS DateTime), 1, N'20346010755', N'Masculino      ', N'Argentina      ', NULL, NULL)
INSERT [dbo].[CLIENTE] ([id], [nombre], [apellido], [email], [contrasena], [domicilio], [idLocalidad], [dni], [fechaNacimiento], [id_cuenta], [cuil], [genero], [nacionalidad], [fotoDniFrente], [fotoDniDorso]) VALUES (2, N'maria                         ', N'ledesma                       ', N'mari@yahoo.com                                    ', N'123231541 ', N'24 de Septiembre              ', 30, 35260152, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 2, N'20352601522', N'Femenino       ', N'Argentina      ', NULL, NULL)
INSERT [dbo].[CLIENTE] ([id], [nombre], [apellido], [email], [contrasena], [domicilio], [idLocalidad], [dni], [fechaNacimiento], [id_cuenta], [cuil], [genero], [nacionalidad], [fotoDniFrente], [fotoDniDorso]) VALUES (3, N'nico                          ', N'lopex                         ', N'lopex@yahoo.com                                   ', N'123231541 ', N'24 de Septiembre              ', 28, 33601852, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 3, N'20336018522', N'Masculino      ', N'Argentina      ', NULL, NULL)
INSERT [dbo].[CLIENTE] ([id], [nombre], [apellido], [email], [contrasena], [domicilio], [idLocalidad], [dni], [fechaNacimiento], [id_cuenta], [cuil], [genero], [nacionalidad], [fotoDniFrente], [fotoDniDorso]) VALUES (4, N'marianela                     ', N'britos                        ', N'mari_brito@gmail.com                              ', N'123231541 ', N'24 de Septiembre              ', 32, 33601852, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 7, N'27336018522', N'Femenino       ', N'Argentina      ', NULL, NULL)
INSERT [dbo].[CLIENTE] ([id], [nombre], [apellido], [email], [contrasena], [domicilio], [idLocalidad], [dni], [fechaNacimiento], [id_cuenta], [cuil], [genero], [nacionalidad], [fotoDniFrente], [fotoDniDorso]) VALUES (5, N'Daniel                        ', N'Diaz                          ', N'danielito@hotmail.com                             ', N'123581321 ', N'Av. Colon 457                 ', 53, 35260152, CAST(N'1989-07-14T00:00:00.000' AS DateTime), 9, N'23352601522', N'Masculino      ', N'Argentina      ', NULL, NULL)
INSERT [dbo].[CLIENTE] ([id], [nombre], [apellido], [email], [contrasena], [domicilio], [idLocalidad], [dni], [fechaNacimiento], [id_cuenta], [cuil], [genero], [nacionalidad], [fotoDniFrente], [fotoDniDorso]) VALUES (6, N'Federico                      ', N'Gomez                         ', N'fede_gomez@gmail.com                              ', N'125125125 ', N'Av. Colon 457                 ', 1, 24689572, CAST(N'1975-12-25T00:00:00.000' AS DateTime), 10, N'20246895728', N'Masculino      ', N'Argentina      ', NULL, NULL)
INSERT [dbo].[CLIENTE] ([id], [nombre], [apellido], [email], [contrasena], [domicilio], [idLocalidad], [dni], [fechaNacimiento], [id_cuenta], [cuil], [genero], [nacionalidad], [fotoDniFrente], [fotoDniDorso]) VALUES (7, N'Roberto                       ', N'Mansilla                      ', N'rober_man125@yahoo.com                            ', N'125125125 ', N'Bv. Illia 156                 ', 220, 14235689, CAST(N'1945-02-28T00:00:00.000' AS DateTime), 11, N'20142356899', N'Femenino       ', N'Argentina      ', NULL, NULL)
INSERT [dbo].[CLIENTE] ([id], [nombre], [apellido], [email], [contrasena], [domicilio], [idLocalidad], [dni], [fechaNacimiento], [id_cuenta], [cuil], [genero], [nacionalidad], [fotoDniFrente], [fotoDniDorso]) VALUES (8, N'Maria                         ', N'Altamirano                    ', N'marian_1490_1@hotmail.com                         ', N'35260152  ', N'Av. Colon                     ', 1, 35260152, CAST(N'1990-07-14T00:00:00.000' AS DateTime), 12, N'27352601522', N'Femenino       ', N'Paraguaya      ', NULL, NULL)
SET IDENTITY_INSERT [dbo].[CLIENTE] OFF
GO
SET IDENTITY_INSERT [dbo].[CUENTA] ON 

INSERT [dbo].[CUENTA] ([id], [saldo], [cvu], [comision], [cotizacion], [calificacion_cred], [giro_descubierto], [estado], [id_tipoCuenta], [id_movimiento]) VALUES (1, 7400, N'1000787742105963815778', 0.5, 183, N'1', N'0', N'1', 1, 1)
INSERT [dbo].[CUENTA] ([id], [saldo], [cvu], [comision], [cotizacion], [calificacion_cred], [giro_descubierto], [estado], [id_tipoCuenta], [id_movimiento]) VALUES (2, 6300, N'1000286126885739722209', 0.5, 183, N'1', N'0', N'1', 1, 2)
INSERT [dbo].[CUENTA] ([id], [saldo], [cvu], [comision], [cotizacion], [calificacion_cred], [giro_descubierto], [estado], [id_tipoCuenta], [id_movimiento]) VALUES (3, 6000, N'1000126969265659072829', 0.5, 183, N'1', N'0', N'1', 1, 25)
INSERT [dbo].[CUENTA] ([id], [saldo], [cvu], [comision], [cotizacion], [calificacion_cred], [giro_descubierto], [estado], [id_tipoCuenta], [id_movimiento]) VALUES (7, 0, N'1000819973851872925376', 0.5, 183, N'1', N'0', N'1', 1, 34)
INSERT [dbo].[CUENTA] ([id], [saldo], [cvu], [comision], [cotizacion], [calificacion_cred], [giro_descubierto], [estado], [id_tipoCuenta], [id_movimiento]) VALUES (9, 0, N'1000670805003624779590', 0.5, 183, N'1', N'0', N'1', 1, 36)
INSERT [dbo].[CUENTA] ([id], [saldo], [cvu], [comision], [cotizacion], [calificacion_cred], [giro_descubierto], [estado], [id_tipoCuenta], [id_movimiento]) VALUES (10, 0, N'1000650842337917511274', 0.5, 183, N'1', N'0', N'1', 1, 37)
INSERT [dbo].[CUENTA] ([id], [saldo], [cvu], [comision], [cotizacion], [calificacion_cred], [giro_descubierto], [estado], [id_tipoCuenta], [id_movimiento]) VALUES (11, 0, N'1000772302068513888287', 0.5, 183, N'1', N'0', N'1', 1, 38)
INSERT [dbo].[CUENTA] ([id], [saldo], [cvu], [comision], [cotizacion], [calificacion_cred], [giro_descubierto], [estado], [id_tipoCuenta], [id_movimiento]) VALUES (12, 0, N'1000689193935772198354', 0.5, 183, N'1', N'0', N'1', 1, 39)
SET IDENTITY_INSERT [dbo].[CUENTA] OFF
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
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (62, N'C.A.B.A.                      ', 0, 3)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (63, N'Andalgalá                     ', 4740, 4)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (64, N'Belén                         ', 4750, 4)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (65, N'Chumbicha                     ', 4728, 4)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (66, N'Fiambalá                      ', 5345, 4)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (67, N'Icaño                         ', 5265, 4)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (68, N'La Puntilla                   ', 4139, 4)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (69, N'Pampa Blanca                  ', 5341, 4)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (70, N'San José Norte                ', 4139, 4)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (71, N'Tinogasta                     ', 5340, 4)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (72, N'Villa de Pomán                ', 5315, 4)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (73, N'EL TRAGADERO                  ', 3505, 5)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (74, N'GENERAL CAPDEVILA             ', 3732, 5)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (75, N'EL ESTERO                     ', 3734, 5)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (76, N'HERMOSO CAMPO                 ', 3733, 5)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (77, N'PAMPA LANDRIEL                ', 3731, 5)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (78, N'MARGARITA BELEN               ', 3505, 5)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (79, N'CAMPO ZAPA                    ', 3722, 5)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (80, N'LORENA                        ', 3714, 5)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (81, N'PAMPA BORRACHO                ', 3708, 5)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (82, N'GENERAL VEDIA                 ', 3522, 5)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (83, N'BAJO LAS DAMAJUANAS           ', 9121, 6)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (84, N'COLONIA CUSHAMEN              ', 9213, 6)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (85, N'COSTA CHUBUT                  ', 9210, 6)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (86, N'PUERTO LOBOS                  ', 8532, 6)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (87, N'PUERTO MADRYN                 ', 9120, 6)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (88, N'VALLE LOS MARTIRES            ', 9105, 6)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (89, N'LOS CIPRESES                  ', 9203, 6)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (90, N'BETESTA                       ', 9105, 6)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (91, N'BUENOS AIRES CHICO            ', 9210, 6)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (92, N'CERRO RADAL                   ', 8430, 6)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (93, N'VILLA ROLLET                  ', 3432, 7)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (94, N'YAGUA RINCON                  ', 3432, 7)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (95, N'ARERUNGUA                     ', 3481, 7)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (96, N'BERON DE ASTRADA              ', 3481, 7)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (97, N'COLONIA BERON DE ASTRADA      ', 3197, 7)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (98, N'MARTINEZ CUE                  ', 3481, 7)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (99, N'LAGUNA BRAVA                  ', 3401, 7)
GO
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (100, N'PARAJE EL CARMEN              ', 3199, 7)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (101, N'RIACHUELO                     ', 3416, 7)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (102, N'COLONIA SANTA ROSA            ', 3421, 7)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (103, N'COLONIA HOCKER                ', 3265, 8)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (104, N'EL BRILLANTE                  ', 3283, 8)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (105, N'ENRIQUE BERDUC                ', 3118, 8)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (106, N'FABRICA COLON                 ', 3281, 8)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (107, N'HAMBIS                        ', 3269, 8)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (108, N'ISLA SAN JOSE                 ', 3287, 8)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (109, N'JUAN JORGE                    ', 3285, 8)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (110, N'LA CARLOTA                    ', 3218, 8)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (111, N'PUEBLO LIEBIG                 ', 3281, 8)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (112, N'PUNTAS DEL GUALEGUAYCHU       ', 3269, 8)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (113, N'Comandante Fontana            ', 3620, 9)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (114, N'El Colorado                   ', 3603, 9)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (115, N'El Espinillo                  ', 3615, 9)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (116, N'Ibarreta                      ', 3624, 4)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (117, N'Laguna Blanca                 ', 3613, 9)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (118, N'Laguna Yema                   ', 3634, 9)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (119, N'Mayor Vicente Villafañe       ', 3601, 9)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (120, N'Palo Santo                    ', 3608, 9)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (121, N'Pozo del Tigre                ', 3628, 9)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (122, N'Riacho He-Hé                  ', 3611, 9)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (123, N'CATARI                        ', 4640, 10)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (124, N'CHAUPI RODERO                 ', 4640, 10)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (125, N'CHOROJRA                      ', 4640, 10)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (126, N'COCHINOCA                     ', 4641, 10)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (127, N'COLORADOS                     ', 4618, 10)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (128, N'DONCELLAS                     ', 4641, 10)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (129, N'ESTACION ZOOTECNICA           ', 4640, 10)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (130, N'LLULLUCHAYOC                  ', 4644, 10)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (131, N'RINCONADILLAS                 ', 4641, 10)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (132, N'RONTUYOC                      ', 4640, 10)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (133, N'EL PALOMAR                    ', 6305, 11)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (134, N'HIDALGO                       ', 6307, 11)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (135, N'HIPOLITO YRIGOYEN             ', 6305, 11)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (136, N'LA ANTONIA                    ', 6307, 11)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (137, N'LA ARA                        ', 6301, 11)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (138, N'LA BILBAINA                   ', 6345, 11)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (139, N'LA CATALINITA                 ', 6305, 11)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (140, N'LA DOLORES                    ', 6301, 11)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (141, N'MACACHIN                      ', 6307, 11)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (142, N'MIGUEL RIGLOS                 ', 6301, 11)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (143, N'TINOCAN                       ', 5313, 12)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (144, N'UDPINANGO                     ', 5311, 12)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (145, N'VILLA MAZAN                   ', 5313, 12)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (146, N'CAMPANAS                      ', 5361, 12)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (147, N'AMILGANCHO                    ', 5300, 12)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (148, N'ANCHICO                       ', 5301, 12)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (149, N'BAJO HONDO                    ', 5300, 12)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (150, N'BAZAN                         ', 5300, 12)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (151, N'CAMPO TRES POZOS              ', 5301, 12)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (152, N'CEBOLLAR                      ', 5300, 12)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (153, N'Alto Verde                    ', 5582, 13)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (154, N'Barrancas                     ', 5517, 13)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (155, N'Campo de los Andes            ', 5565, 13)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (156, N'Costa de Araujo               ', 5535, 13)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (157, N'Cuadro Benegas                ', 5603, 13)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (158, N'El Mirador                    ', 5579, 13)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (159, N'El Plumerillo                 ', 5539, 13)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (160, N'La Paz                        ', 5590, 13)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (161, N'Medrano                       ', 5585, 13)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (162, N'Villa Atuel                   ', 5622, 13)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (163, N'CHEROGUITA                    ', 3358, 14)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (164, N'DESPLAYADA                    ', 3363, 14)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (165, N'EL MACACO                     ', 3363, 14)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (166, N'EL SALTI                      ', 3363, 14)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (167, N'EL SALTITO                    ', 3363, 14)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (168, N'MAI BAO                       ', 3363, 14)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (169, N'PUERTO ALICIA                 ', 3363, 14)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (170, N'PUERTO AURORA                 ', 3363, 14)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (171, N'TRES BOCAS                    ', 3363, 14)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (172, N'VILLA VILMA                   ', 3363, 14)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (173, N'CHACAY CO                     ', 8353, 15)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (174, N'CURU  LEUVU                   ', 8353, 15)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (175, N'EL ALAMITO                    ', 8353, 15)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (176, N'EL CURILEO                    ', 8353, 15)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (177, N'ALIANZA                       ', 8373, 15)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (178, N'PLOTTIER                      ', 8316, 15)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (179, N'PORTEZUELO GRANDE             ', 8300, 15)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (180, N'PUEBLO NUEVO                  ', 8322, 15)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (181, N'RINCON DE EMILIO              ', 8300, 15)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (182, N'SAUZAL BONITO                 ', 8319, 15)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (183, N'CHAIFUL                       ', 8418, 16)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (184, N'CHICHIHUAO                    ', 8422, 16)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (185, N'CLEMENTE ONELLI               ', 8416, 16)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (186, N'ISLA CHICA                    ', 8363, 16)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (187, N'ISLA GRANDE                   ', 8361, 16)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (188, N'EL FOYEL                      ', 8401, 16)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (189, N'EL MANSO                      ', 8430, 16)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (190, N'LOS REPOLLOS                  ', 8430, 16)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (191, N'MALLIN AHOGADO                ', 8430, 16)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (192, N'PUERTO BLEST                  ', 8411, 16)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (193, N'CABEZA DE ANTA                ', 4434, 17)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (194, N'EL ARENAL                     ', 4446, 17)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (195, N'CHORROARIN                    ', 4446, 17)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (196, N'COLONIA HURLINGHAM            ', 4449, 17)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (197, N'EL PERICOTE                   ', 4449, 17)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (198, N'EL VENCIDO                    ', 4452, 17)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (199, N'EL PORVENIR                   ', 4452, 17)
GO
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (200, N'POTRERILLO                    ', 4446, 17)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (201, N'SAN GABRIEL                   ', 4452, 17)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (202, N'SAN JUAN                      ', 4446, 17)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (203, N'KILOMETRO 910                 ', 5443, 18)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (204, N'COLONIA GUTIERREZ             ', 5438, 18)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (205, N'FINCA ZAPATA                  ', 5417, 18)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (206, N'VILLA GENERAL SAN MARTIN      ', 5419, 18)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (207, N'VILLA DEL SALVADOR            ', 5415, 18)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (208, N'BELLA VISTA                   ', 5403, 18)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (209, N'TAMBERIAS                     ', 5401, 18)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (210, N'SAN JUAN                      ', 5400, 18)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (211, N'FINCA DE IZASA                ', 5442, 18)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (212, N'NUEVA CASTILLA                ', 5444, 18)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (213, N'Candelaria                    ', 5713, 19)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (214, N'Estancia Grande               ', 5701, 19)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (215, N'Justo Daract                  ', 5738, 19)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (216, N'La Punta                      ', 5710, 19)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (217, N'Naschel                       ', 5759, 19)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (218, N'Quines                        ', 5711, 19)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (219, N'Tilisarao                     ', 5773, 19)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (220, N'Unión                         ', 6216, 19)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (221, N'Villa de Merlo                ', 5881, 19)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (222, N'Villa Mercedes                ', 5730, 19)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (223, N'CARA MALA                     ', 9313, 20)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (224, N'CERRO ALTO                    ', 9053, 20)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (225, N'MATA MAGALLANES               ', 9017, 20)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (226, N'MAZAREDO                      ', 9051, 20)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (227, N'MINERALES                     ', 9015, 20)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (228, N'YEGUA MUERTA                  ', 9017, 20)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (229, N'28 DE NOVIEMBRE               ', 9407, 20)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (230, N'COLONIA LEANDRO N ALEM        ', 9040, 20)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (231, N'EL PLUMA                      ', 9017, 20)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (232, N'NACIMIENTOS DEL PLUMA         ', 9040, 20)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (233, N'Alcorta                       ', 2117, 21)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (234, N'Arequito                      ', 2183, 21)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (235, N'Arteaga                       ', 2187, 21)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (236, N'Casilda                       ', 2170, 21)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (237, N'Elortondo                     ', 2732, 21)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (238, N'Firmat                        ', 2630, 21)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (239, N'Tacuarendí                    ', 3587, 21)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (240, N'Totoras                       ', 2144, 21)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (241, N'Vicente Echeverría            ', 2142, 21)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (242, N'Villa Ocampo                  ', 3580, 21)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (243, N'BURRA HUA                     ', 4208, 22)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (244, N'CA                            ', 4201, 22)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (245, N'ARDILES                       ', 4302, 22)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (246, N'BARRIO ESTE                   ', 4300, 22)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (247, N'BEJAN                         ', 4225, 22)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (248, N'CA                            ', 4301, 22)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (249, N'EL BOSQUE                     ', 4300, 22)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (250, N'EL CHURQUI                    ', 4225, 22)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (251, N'LAS CEJAS                     ', 4221, 22)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (252, N'SAN PEDRO                     ', 4233, 22)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (253, N'Río Grande                    ', 9420, 23)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (254, N'Ushuaia                       ', 9410, 23)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (255, N'Tolhuin                       ', 9412, 23)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (256, N'Alto Verde                    ', 4242, 24)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (257, N'Cevil Redondo                 ', 4105, 24)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (258, N'Delfín Gallo                  ', 4117, 24)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (259, N'El Potrerillo                 ', 4137, 24)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (260, N'Ingenio San Pablo             ', 4129, 24)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (261, N'La Florida                    ', 4117, 24)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (262, N'Quilmes y Los Sueldos         ', 4111, 24)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (263, N'Río Seco                      ', 4145, 24)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (264, N'San Andrés                    ', 4111, 24)
INSERT [dbo].[LOCALIDAD] ([id], [nombre], [cp], [id_provincia]) VALUES (265, N'Villa de Medinas              ', 4151, 24)
SET IDENTITY_INSERT [dbo].[LOCALIDAD] OFF
GO
SET IDENTITY_INSERT [dbo].[MOVIMIENTO] ON 

INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (1, 0, CAST(N'2021-09-24T21:39:01.117' AS DateTime), NULL, 1, N'apertura de cuenta            ', 5)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (2, 0, CAST(N'2021-09-24T21:39:55.883' AS DateTime), NULL, 2, N'apertura de cuenta            ', 5)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (3, 5500, CAST(N'2016-01-01T12:13:58.000' AS DateTime), NULL, 1, N'ingreso $                     ', 2)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (4, 550, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 2, 1, N'transferencia $               ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (5, 550, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 1, 2, N'transferencia $               ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (6, 100, CAST(N'2016-01-01T12:13:58.000' AS DateTime), NULL, 2, N'transferencia $               ', 3)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (7, 1000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 0, 2, N'ingreso $                     ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (8, 1000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 2, 0, N'ingreso $                     ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (9, 10000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), NULL, 2, N'ingreso $                     ', 2)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (10, 1000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 1, 2, N'transferencia $               ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (11, 1000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 2, 1, N'transferencia $               ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (12, 1000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), NULL, 1, N'egreso $                      ', 3)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (13, 500, CAST(N'2016-01-01T12:13:58.000' AS DateTime), NULL, 1, N'egreso $                      ', 3)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (14, 1500, CAST(N'2016-01-01T12:13:58.000' AS DateTime), NULL, 2, N'egreso $                      ', 3)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (15, 2500, CAST(N'2016-01-01T12:13:58.000' AS DateTime), NULL, 1, N'ingreso $                     ', 2)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (16, 2500, CAST(N'2016-01-01T12:13:58.000' AS DateTime), NULL, 0, N'ingreso $                     ', 2)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (17, 2500, CAST(N'2016-01-01T12:13:58.000' AS DateTime), NULL, 1, N'ingreso $                     ', 2)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (18, 250, CAST(N'2016-01-01T12:13:58.000' AS DateTime), NULL, 1, N'ingreso $                     ', 3)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (19, 250, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 0, 2, N'ingreso $                     ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (20, 250, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 2, 0, N'ingreso $                     ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (21, 200, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 0, 2, N'ingreso $                     ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (22, 200, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 2, 0, N'ingreso $                     ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (23, 200, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 1, 2, N'transferencia $               ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (24, 200, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 2, 1, N'transferencia $               ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (25, 0, CAST(N'2021-09-24T21:12:02.777' AS DateTime), NULL, 3, N'apertura de cuenta            ', 5)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (26, 2000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), NULL, 3, N'ingreso $                     ', 2)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (27, 2000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 3, 2, N'transferencia $               ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (28, 2000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 2, 3, N'transferencia $               ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (29, 3000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), NULL, 3, N'ingreso $                     ', 2)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (30, 1000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), NULL, 3, N'egreso $                      ', 3)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (34, 0, CAST(N'2021-09-26T21:34:19.260' AS DateTime), NULL, 7, N'apertura de cuenta            ', 5)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (36, 0, CAST(N'2021-09-26T22:04:32.717' AS DateTime), NULL, 9, N'apertura de cuenta            ', 5)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (37, 0, CAST(N'2021-09-26T22:10:35.380' AS DateTime), NULL, 10, N'apertura de cuenta            ', 5)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (38, 0, CAST(N'2021-09-27T05:42:08.877' AS DateTime), NULL, 11, N'apertura de cuenta            ', 5)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (39, 0, CAST(N'2021-09-27T16:21:22.583' AS DateTime), NULL, 12, N'apertura de cuenta            ', 5)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (40, 1000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), NULL, 1, N'ingreso $                     ', 2)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (41, 1000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), NULL, 1, N'transferencia $               ', 3)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (42, 1000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 2, 1, N'transferencia $               ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (43, 1000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 1, 2, N'transferencia $               ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (44, 1000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 2, 1, N'transferencia $               ', 1)
INSERT [dbo].[MOVIMIENTO] ([id], [monto], [fecha_hora], [id_destino], [id_origen], [motivo], [id_tipoMovimiento]) VALUES (45, 1000, CAST(N'2016-01-01T12:13:58.000' AS DateTime), 1, 2, N'transferencia $               ', 1)
SET IDENTITY_INSERT [dbo].[MOVIMIENTO] OFF
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
INSERT [dbo].[TIPO_MOVIMIENTO] ([id], [tipo]) VALUES (5, N'saldo inicial       ')
SET IDENTITY_INSERT [dbo].[TIPO_MOVIMIENTO] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CLIENTE__AB6E61644BE1C5BA]    Script Date: 29/09/2021 12:27:37 ******/
ALTER TABLE [dbo].[CLIENTE] ADD  CONSTRAINT [UQ__CLIENTE__AB6E61644BE1C5BA] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CUENTA__D83656402634BD84]    Script Date: 29/09/2021 12:27:37 ******/
ALTER TABLE [dbo].[CUENTA] ADD  CONSTRAINT [UQ__CUENTA__D83656402634BD84] UNIQUE NONCLUSTERED 
(
	[cvu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[actualizar_movimiento]    Script Date: 29/09/2021 12:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizar_movimiento]
	-- Add the parameters for the stored procedure here

	@id int,
	@id_origen int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE MOVIMIENTO
	SET id_origen = @id_origen
	WHERE id = @id

END
GO
/****** Object:  StoredProcedure [dbo].[actualizar_saldo_cuenta]    Script Date: 29/09/2021 12:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizar_saldo_cuenta]
	-- Add the parameters for the stored procedure here
	@id int,
	@saldo float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE CUENTA SET saldo = @saldo
	WHERE id = @id	
END
GO
/****** Object:  StoredProcedure [dbo].[consultar_saldo]    Script Date: 29/09/2021 12:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[consultar_saldo]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [saldo] FROM CUENTA
	WHERE id = @id	
END
GO
/****** Object:  StoredProcedure [dbo].[insertar_cliente]    Script Date: 29/09/2021 12:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_cliente]  
	-- Add the parameters for the stored procedure here
	@nombre nchar(45),
	@apellido nchar(45),
	@email nchar(45),
	@contrasena nchar(45),
	@domicilio nchar(45),
	@idLocalidad int,
	@dni int,
	@fechaNacimiento date,
	@id_cuenta int,
	@cuil char(11),
	@genero nchar(15),
	@nacionalidad nchar(15)

AS
--declare @Error int
--declare @ int

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO CLIENTE (nombre, apellido, email, contrasena, domicilio, idLocalidad, dni, fechaNacimiento, id_cuenta, cuil, genero, nacionalidad) 
	VALUES (@nombre, @apellido, @email, @contrasena, @domicilio, @idLocalidad, @dni, @fechaNacimiento, @id_cuenta, @cuil, @genero, @nacionalidad)
	SELECT CAST(scope_identity() AS int)

END
GO
/****** Object:  StoredProcedure [dbo].[insertar_cuenta]    Script Date: 29/09/2021 12:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_cuenta]
	-- Add the parameters for the stored procedure here
	@id_tipoCuenta int,
	@id_movimiento int,
	@cvu char(22),
	@saldo float,
	@estado char(1),
	@giro_descubierto char(1),
	@calificacion_cred char(1),
	@comision float,
	@cotizacion float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		INSERT INTO CUENTA (saldo, cvu, comision, cotizacion, calificacion_cred, giro_descubierto, estado, id_tipoCuenta, id_movimiento)
		VALUES (@saldo, @cvu, @comision, @cotizacion,@calificacion_cred, @giro_descubierto, @estado, @id_tipoCuenta, @id_movimiento)
		SELECT CAST(scope_identity() AS int)

END
GO
/****** Object:  StoredProcedure [dbo].[insertar_movimiento]    Script Date: 29/09/2021 12:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertar_movimiento]
	-- Add the parameters for the stored procedure here

	@monto float,
	@fecha_hora datetime,
	@id_origen int,
	@id_destino int,
	@motivo varchar(30),
	@id_tipoMovimiento int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO MOVIMIENTO(monto, fecha_hora, id_destino, id_origen, motivo, id_tipoMovimiento)
	VALUES ( @monto, @fecha_hora, @id_destino, @id_origen, @motivo, @id_tipoMovimiento)
	SELECT CAST(scope_identity() AS int)
END
GO
/****** Object:  StoredProcedure [dbo].[listar_cliente]    Script Date: 29/09/2021 12:27:37 ******/
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
	SELECT [id],[nombre],[apellido],[email],[contrasena],[domicilio],[idLocalidad],[dni],[fechaNacimiento],[id_cuenta],[cuil],[genero],[nacionalidad]
	from dbo.CLIENTE where id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[listar_clientes]    Script Date: 29/09/2021 12:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[listar_clientes] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id], [nombre],[apellido],[email],[contrasena],[domicilio],[idLocalidad],[dni],[fechaNacimiento],[id_cuenta],[cuil],[genero],[nacionalidad]
	from dbo.CLIENTE;
END
GO
/****** Object:  StoredProcedure [dbo].[mostrar_cuenta]    Script Date: 29/09/2021 12:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mostrar_cuenta]
	-- Add the parameters for the stored procedure here
	@id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id],[saldo],[cvu],[comision],[cotizacion],[calificacion_cred],[giro_descubierto],[estado],[id_tipoCuenta],[id_movimiento]
    FROM CUENTA
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[mostrar_localidad]    Script Date: 29/09/2021 12:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mostrar_localidad] 
	-- Add the parameters for the stored procedure here
	@id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id],[nombre],[cp],[id_provincia]
	from dbo.LOCALIDAD where id = @id;

END
GO
/****** Object:  StoredProcedure [dbo].[mostrar_localidades]    Script Date: 29/09/2021 12:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mostrar_localidades] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id],[nombre],[cp],[id_provincia]
	from dbo.LOCALIDAD

END
GO
/****** Object:  StoredProcedure [dbo].[mostrar_pais]    Script Date: 29/09/2021 12:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mostrar_pais] 
	-- Add the parameters for the stored procedure here
	@id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id], [nombre]
	from dbo.PAIS where id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[mostrar_paises]    Script Date: 29/09/2021 12:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mostrar_paises] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id], [nombre]
	from dbo.PAIS;
END
GO
/****** Object:  StoredProcedure [dbo].[mostrar_provincia]    Script Date: 29/09/2021 12:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mostrar_provincia] 
	-- Add the parameters for the stored procedure here
	@id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id],[nombre],[id_pais]
	from dbo.PROVINCIA where id = @id;

END
GO
/****** Object:  StoredProcedure [dbo].[mostrar_provincias]    Script Date: 29/09/2021 12:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mostrar_provincias] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id],[nombre],[id_pais]
	from dbo.PROVINCIA

END
GO
/****** Object:  StoredProcedure [dbo].[mostrar_ultimos_movimientos]    Script Date: 29/09/2021 12:27:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mostrar_ultimos_movimientos]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP (10) [id],[monto],[fecha_hora],[id_destino],[id_origen],[motivo],[id_tipoMovimiento]
	FROM dbo.MOVIMIENTO
	WHERE [id_origen] = @id
	ORDER BY [id] DESC
END
GO
