USE [master]
GO
/****** Object:  Database [FarmaciaSP]    Script Date: 4/1/2025 3:51:44 PM ******/
CREATE DATABASE [FarmaciaSP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FarmaciaSP_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\FarmaciaSP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FarmaciaSP_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\FarmaciaSP.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FarmaciaSP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FarmaciaSP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FarmaciaSP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FarmaciaSP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FarmaciaSP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FarmaciaSP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FarmaciaSP] SET ARITHABORT OFF 
GO
ALTER DATABASE [FarmaciaSP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FarmaciaSP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FarmaciaSP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FarmaciaSP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FarmaciaSP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FarmaciaSP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FarmaciaSP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FarmaciaSP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FarmaciaSP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FarmaciaSP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FarmaciaSP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FarmaciaSP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FarmaciaSP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FarmaciaSP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FarmaciaSP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FarmaciaSP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FarmaciaSP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FarmaciaSP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FarmaciaSP] SET  MULTI_USER 
GO
ALTER DATABASE [FarmaciaSP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FarmaciaSP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FarmaciaSP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FarmaciaSP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FarmaciaSP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FarmaciaSP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FarmaciaSP] SET QUERY_STORE = OFF
GO
USE [FarmaciaSP]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 4/1/2025 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estado] [char](1) NOT NULL,
 CONSTRAINT [PK_categoria] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_nombre_categoria] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 4/1/2025 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[apellido] [varchar](40) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[sexo] [char](1) NOT NULL,
	[cedula] [varchar](11) NULL,
	[telefono] [varchar](10) NULL,
	[email] [varchar](30) NULL,
	[estado] [char](1) NOT NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_nombre_apellido_cliente] UNIQUE NONCLUSTERED 
(
	[nombre] ASC,
	[apellido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departamentos]    Script Date: 4/1/2025 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departamentos](
	[id_departamento] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estado] [char](1) NOT NULL,
 CONSTRAINT [PK_departamentos] PRIMARY KEY CLUSTERED 
(
	[id_departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_nombre_departamentos] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle]    Script Date: 4/1/2025 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle](
	[id_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_factura] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[total] [decimal](10, 2) NOT NULL,
	[estado] [char](1) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [PK_detalle] PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 4/1/2025 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[id_departamento] [int] NOT NULL,
	[cargo] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[email] [varchar](50) NULL,
	[cedula] [varchar](13) NOT NULL,
	[genero] [char](1) NOT NULL,
	[estado] [char](1) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[fecha_actualizacion] [datetime] NULL,
 CONSTRAINT [PK_empleado] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_nombre_apellido_empleado] UNIQUE NONCLUSTERED 
(
	[nombre] ASC,
	[apellido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facturas]    Script Date: 4/1/2025 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturas](
	[id_factura] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_empleado] [int] NOT NULL,
	[fecha] [date] NOT NULL,
 CONSTRAINT [PK_facturas] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[laboratorios]    Script Date: 4/1/2025 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[laboratorios](
	[id_laboratorio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estado] [char](1) NOT NULL,
 CONSTRAINT [PK_laboratorios] PRIMARY KEY CLUSTERED 
(
	[id_laboratorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_constraint_nombre_laboratorio] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 4/1/2025 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id_produto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
	[fecha_venc] [date] NOT NULL,
	[stock] [int] NOT NULL,
	[id_tipo] [int] NOT NULL,
	[id_categoria] [int] NOT NULL,
	[id_laboratorio] [int] NOT NULL,
	[estado] [char](1) NOT NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[id_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo]    Script Date: 4/1/2025 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo](
	[nombre] [varchar](50) NOT NULL,
	[estado] [char](1) NOT NULL,
	[id_tipo] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tipo] PRIMARY KEY CLUSTERED 
(
	[id_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[categoria] ADD  CONSTRAINT [DF_categoria_estado]  DEFAULT ('A') FOR [estado]
GO
ALTER TABLE [dbo].[clientes] ADD  CONSTRAINT [DF_clientes_estado]  DEFAULT ('A') FOR [estado]
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD  CONSTRAINT [FK_detalle_facturas] FOREIGN KEY([id_factura])
REFERENCES [dbo].[facturas] ([id_factura])
GO
ALTER TABLE [dbo].[detalle] CHECK CONSTRAINT [FK_detalle_facturas]
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD  CONSTRAINT [FK_detalle_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[producto] ([id_produto])
GO
ALTER TABLE [dbo].[detalle] CHECK CONSTRAINT [FK_detalle_producto]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [FK_empleado_departamentos] FOREIGN KEY([id_departamento])
REFERENCES [dbo].[departamentos] ([id_departamento])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [FK_empleado_departamentos]
GO
ALTER TABLE [dbo].[facturas]  WITH CHECK ADD  CONSTRAINT [FK_facturas_clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[facturas] CHECK CONSTRAINT [FK_facturas_clientes]
GO
ALTER TABLE [dbo].[facturas]  WITH CHECK ADD  CONSTRAINT [FK_facturas_empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[facturas] CHECK CONSTRAINT [FK_facturas_empleado]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_Producto_categoria]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_laboratorios] FOREIGN KEY([id_laboratorio])
REFERENCES [dbo].[laboratorios] ([id_laboratorio])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_producto_laboratorios]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_tipo] FOREIGN KEY([id_tipo])
REFERENCES [dbo].[tipo] ([id_tipo])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_producto_tipo]
GO
/****** Object:  StoredProcedure [dbo].[usp_actualizarCategoria]    Script Date: 4/1/2025 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_actualizarCategoria]
	@id AS INT,
	@nombre AS VARCHAR(40),
	@estado AS CHAR(1) = NULL
AS
BEGIN
	UPDATE
		categoria
	SET
		nombre = @nombre,
		estado = COALESCE(@estado, estado)
	WHERE
		id_categoria = @id
	;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_cliente]    Script Date: 4/1/2025 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_cliente]
	@nombre AS VARCHAR(40),
	@apellido AS VARCHAR(40),
	@direccion AS VARCHAR(100),
	@sexo AS CHAR(1),
	@cedula AS VARCHAR(11),
	@telefono AS VARCHAR(10) = NULL,
	@email AS VARCHAR(30) = NULL,
	@estado AS CHAR(1) = NULL
AS
BEGIN
	INSERT INTO
		clientes(nombre, apellido, direccion, sexo, cedula, telefono, email, estado)
	VALUES
		(@nombre, @apellido, @direccion, @sexo, @cedula, @telefono, @email, COALESCE(@estado, 'A'))
	;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_desactivarCategoria]    Script Date: 4/1/2025 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_desactivarCategoria]
	@id AS INT,
	@estado AS CHAR(1)
AS
BEGIN
	UPDATE
		categoria
	SET
		estado = @estado
	WHERE
		id_categoria = @id
	;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_guardarCategoria]    Script Date: 4/1/2025 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_guardarCategoria]
	@nombre AS VARCHAR(40)
AS
BEGIN
	INSERT INTO
		categoria(nombre)
	VALUES
		(@nombre)
	;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ingresos_porCategoriaYp]    Script Date: 4/1/2025 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ====================================================================
-- Author:		José Ant. de Dios 
-- Create date: 9/7/2022
-- Description:	Ingresos totales por categorias de productos, 
-- y por cada categoria: los dos productos que mayor ingreso ha tenido
-- ====================================================================

CREATE PROCEDURE [dbo].[usp_ingresos_porCategoriaYp]

AS
BEGIN
	
	SET NOCOUNT ON;

	
	with ingresos_categoria as
	(
		select

			c.id_categoria,
			c.nombre as Categoria,
			concat('$ ',SUM(d.total)) as Total
		from
			categoria as c
				inner join
			producto as p on c.id_categoria = p.id_categoria
				inner join
			detalle as d on p.id_produto = d.id_producto
		group by
			c.id_categoria,
			c.nombre
	),

	producto_mas_gen as 
		(
		select
			c.id_categoria,
			p.nombre as Producto,
			concat( '$ ', sum(d.total)) as Total,
			ROW_NUMBER() over(partition by c.id_categoria order by sum(d.total) desc) as Row_id
		from
			categoria as c
				inner join
			producto as p on c.id_categoria = p.id_categoria
				inner join
			detalle as d on p.id_produto = d.id_producto
		group by
			c.id_categoria,
			p.nombre
	)

	select
		inc.Categoria,
		inc.Total,
		pg.Producto
	from
		ingresos_categoria as inc
			inner join
		producto_mas_gen as pg on inc.id_categoria = pg.id_categoria
			and pg.Row_id <= 2
	;
    
END
GO
/****** Object:  StoredProcedure [dbo].[usp_porcentajeVentasProd]    Script Date: 4/1/2025 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==============================================================================
-- Author:		Jose Antonio
-- Create date: 8/7/2022
-- Description:	obtiene  el porcentaje de ventas por producto
--		el empleado que ha traido mas ingresos con respecto al producto anterior
-- ==============================================================================
CREATE PROCEDURE [dbo].[usp_porcentajeVentasProd] 
	
AS
BEGIN
	
	SET NOCOUNT ON;

    
	
	with porcentaje_Productos as
	(

	select 
		p.id_produto,
		p.nombre as Producto,
		CONCAT(
			CAST(
				ROUND(COUNT(*), 2, 2) * 100.0 / (select count(*) from detalle) AS DECIMAL(20,2)
			), '%'
		) as Porcentaje
	
	from
		producto as p
			INNER JOIN
		detalle as d on p.id_produto = d.id_producto
	group by
		p.id_produto,
		p.nombre
	
	),
	empleado_masgen as
	(
	select
		p.id_produto,
		CONCAT_WS(' ',e.nombre, e.apellido) as Empleado,
		sum(d.total) Total,
		ROW_NUMBER() OVER(PARTITION BY p.id_produto ORDER BY sum(d.total) DESC) as Row_Num
	from
		empleado as e
			inner join
		facturas as f on f.id_empleado = e.id_empleado
			INNER JOIN
		detalle as d on f.id_factura = d.id_factura
			inner join
		producto as p on d.id_producto = p.id_produto
	group by
		p.id_produto,
		e.nombre,
		e.apellido
	)

	SELECT
		ppr.Producto,
		ppr.Porcentaje,
		emgn.Empleado
	FROM
		porcentaje_Productos as ppr
			inner join
		empleado_masgen as emgn on ppr.id_produto = emgn.id_produto
			AND emgn.Row_Num = 1
	;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_verCategoria]    Script Date: 4/1/2025 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_verCategoria]
	@nombre AS VARCHAR(40) =   NULL
AS
BEGIN
	SELECT
		*
	FROM
		categoria
	WHERE
		nombre = COALESCE(@nombre, nombre)
	;
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''A'' => activo  |  ''I'' => inactivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'clientes', @level2type=N'COLUMN',@level2name=N'estado'
GO
USE [master]
GO
ALTER DATABASE [FarmaciaSP] SET  READ_WRITE 
GO
