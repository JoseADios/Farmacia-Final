
-- CANTIDAD DE DINERO DE VENTAS DE LOS 3 PRODUCTOS MAS VENDIDOS EN LOS ULTIMOS 12 MESES

WITH VxMes AS 
	(

	SELECT	
		CONCAT_WS(' ',DATENAME(mm, DATEADD(mm, MONTH(d.fecha_registro) - 1, '1900-01-01')), YEAR(d.fecha_registro)) AS Mes,
		p.nombre AS Producto,
		SUM(d.precio) as Ingresos,
		ROW_NUMBER() OVER(PARTITION BY DATENAME(mm, DATEADD(mm, MONTH(d.fecha_registro) - 1, '1900-01-01')) ORDER BY SUM(d.precio) DESC) AS Row_ID
	FROM
		producto AS p
			inner join
		detalle AS d ON p.id_produto = d.id_producto
	WHERE 
		d.fecha_registro >= DATEADD(month, -12, GETDATE())
		AND d.fecha_registro < CONVERT(VARCHAR,DATEADD(d,-(DAY(GETDATE()-1)),GETDATE()),106)
		AND d.estado = 'A'
	GROUP BY
		p.nombre,
		MONTH(d.fecha_registro),
		YEAR(d.fecha_registro)
)
SELECT 
	Mes,
	Producto,
	Ingresos
FROM 
	VxMes 
WHERE
	Row_ID < 4
ORDER BY
	Mes DESC
;



-- CANTIDAD DE DINERO DE VENTAS DE LOS 3 PRODUCTOS MAS VENDIDOS EN EL A�O PASADO

with VxMes as 
	(
	SELECT																			
		CONCAT_WS(' ' ,DATENAME(mm, DATEADD(mm, MONTH(d.fecha_registro) - 1, '1900-01-01')), YEAR(GETDATE())-1) as Mes,
		p.nombre as Producto,
		SUM(d.precio) as Ingresos,
		ROW_NUMBER() OVER(PARTITION BY DATENAME(mm, DATEADD(mm, MONTH(d.fecha_registro) - 1, '1900-01-01')) ORDER BY SUM(d.precio) Desc) as Row_ID
	FROM
		producto as p
			inner join
		detalle as d on p.id_produto = d.id_producto
	WHERE
		Year(d.fecha_registro) = YEAR(GETDATE())-1
		AND d.fecha_registro < CONVERT(varchar,dateadd(d,-(day(getdate()-1)),getdate()),106)
		AND d.estado = 'A'
	group by
		p.nombre,
		MONTH(d.fecha_registro)
)
Select 
	Mes,
	Producto,
	Ingresos
from 
	VxMes
where
	Row_ID < 4
order by
	Mes desc
;


-- INGRESOS EN PORCENTAJE DE LA CATEGORIA DE MAS VENTAS DEL A�O PASADO

declare @res as varchar(MAX) = 'Durante todo el a�o ' + CAST(YEAR(GETDATE())-1 AS varchar) + ' al menos';
--select @res

with IngxCat as
(
	select
		c.id_categoria,
		c.nombre as Categor�a,
		CONCAT(
			CAST(
				ROUND(SUM(d.precio), 2, 2) * 100.0 / 

				(select 
					SUM(d2.precio)
				from 
					detalle AS d2
						inner join
					producto as p2 on d2.id_producto = p2.id_produto
				where
					Year(d2.fecha_registro) = YEAR(GETDATE())-1
						AND d2.estado = 'A'

				) AS DECIMAL(20,2)

		), '%' )AS Porcentaje,
			ROW_NUMBER() over( order by SUM(d.precio) desc) as ROW_ID
	from
		categoria as c
			inner join
		producto as p on c.id_categoria = p.id_categoria
			inner join
		detalle as d on p.id_produto = d.id_producto
	WHERE
		Year(d.fecha_registro) = YEAR(GETDATE())-1
		AND d.estado = 'A'
	group by
		c.id_categoria,
		c.nombre
),

Ing_Prods as 
(
	select
		c.id_categoria,
		p.nombre as Producto,
		CONCAT(
			CAST(
				ROUND(SUM(d.precio), 2, 2) * 100.0 / 
				(select 
					SUM(d2.precio)
				from 
					detalle AS d2
						inner join
					producto as p2 on d2.id_producto = p2.id_produto
				where
					Year(d2.fecha_registro) = YEAR(GETDATE())-1
						AND d2.estado = 'A'

				) AS DECIMAL(20,2)
		), '%' )AS Porciento
	from
		categoria as c
			inner join
		producto as p on c.id_categoria = p.id_categoria
			inner join
		detalle as d on p.id_produto = d.id_producto
	WHERE
		Year(d.fecha_registro) = YEAR(GETDATE())-1
		AND d.estado = 'A'
	group by
		c.id_categoria,
		p.nombre
),

ResProds_Cat as 
(
	SELECT 
		ic.Categor�a,
		ic.Porcentaje,
		inp.Producto,
		inp.Porciento,
		ROW_NUMBER() OVER(PARTITION BY ic.Categor�a ORDER BY inp.Porciento DESC) as Row_Num
	from
		IngxCat as ic
			inner join
		Ing_Prods as inp on ic.id_categoria = inp.id_categoria
		AND ic.ROW_ID = 1
	
)
SELECT
	@res = 
	case rc.Row_Num 
		WHEN 1 THEN  @res + ' el ' + rc.Porcentaje + ' de los ingresos obtenidos fueron de la categor�a ' + rc.Categor�a + ':'
				+ ' ' + rc.Porciento + ' ' + rc.Producto
		ELSE @res + ', ' + rc.Porciento + ' ' + rc.Producto
	END
FROM
	ResProds_Cat AS rc


SELECT @res AS [Porcentaje de ingresos Categ. mas ventas]
;


-- PRODUCTO MAS VENDIDO DEL A�O ANTERIOR

SELECT TOP 1
	CONCAT_WS(' ', 'El producto mas vendido en todo el a�o', CAST(YEAR(GETDATE())-1 AS VARCHAR), 
		'fue', p.nombre, 'con un ingreso total del ', 
		CONCAT( CAST(ROUND(SUM(d.precio), 2, 2) * 100.0 / 
		(SELECT 
			SUM(d2.precio)
		FROM 
			detalle as d2
				inner join
			producto as p2 on d2.id_producto = P2.id_produto
		WHERE
			Year(d2.fecha_registro) = YEAR(GETDATE())-1

		) AS DECIMAL(20,2)), 
		'% de todas las ventas de ese a�o' ) ) AS [Producto m�s Vendido]
FROM
	producto as p
		inner join
	detalle as d on p.id_produto = d.id_producto
WHERE
	Year(d.fecha_registro) = YEAR(GETDATE())-1
group by
	p.nombre
ORDER by
	SUM(d.precio) desc
;


-- DIFERENCIA DE INGRESOS ENTRE EL A�O ACTUAL Y EL PASADO

with IngresosXyear AS
(
	select
		CAST(SUM(CASE WHEN YEAR(d.fecha_registro) = YEAR(GETDATE())-1 THEN d.precio ELSE NULL END) AS DECIMAL(9,2)) AS Anterior,
		CAST(SUM(CASE WHEN YEAR(d.fecha_registro) = YEAR(GETDATE()) THEN d.precio ELSE NULL END) AS DECIMAL(9,2)) AS Actual
	from
		detalle as d
	WHERE
		d.estado = 'A'
)
select
	case when iy.Actual > iy.Anterior
		then 'En lo que va de a�o se han generado un '+ CAST(CAST(((iy.Actual - iy.Anterior)/iy.Anterior)*100.0 as decimal(9,2)) as varchar) +'% m�s de todos los ingresos generados en el a�o ' + CAST(YEAR(GETDATE())-1 as varchar)
		else 'En lo que va de a�o se ha generado un '+ CAST(CAST(((iy.Actual / iy.Anterior)*100.0) as decimal(9,2)) as varchar) + '% de todos los ingresos generados en el a�o ' + CAST(YEAR(GETDATE())-1 as varchar)
	end as [Diferencia de ingresos en ultimo a�o]
from
	IngresosXyear as iy

;



-- LOS 3 PRODUCTOS CON MENOS STOCK

DECLARE @respm AS VARCHAR(MAX) = 'Los 3 productos con menos stock actualmente son: ';

WITH Prods_menosStock AS
(
	SELECT TOP 3
		p.nombre,
		p.stock,
		ROW_NUMBER() OVER( ORDER BY p.stock ASC) AS ROW_ID
	FROM
		producto as p
	WHERE
		P.estado = 'A'
)

SELECT
	@respm = 
		CASE WHEN pm.ROW_ID = 3 
			THEN @respm + ' y ' + pm.nombre + ' con ' + CAST(pm.stock AS varchar) + '.'
		ELSE
			@respm + pm.nombre + ' con ' + CAST(pm.stock AS varchar) + ', '
	END
FROM
	Prods_menosStock AS pm

;

SELECT @respm AS [Productos con menos stock];



-- PRODUCTO CON MENOS VENTAS EN EL ULTIMO A�O

with prods as (
	SELECT 
		p.id_produto,
		p.nombre
	FROM
		producto AS p
),

cantidadV as
(
	SELECT 
		p.id_produto,
		SUM(d.cantidad) AS cant
	FROM
		producto AS p
			LEFT JOIN
		detalle AS d on p.id_produto = d.id_producto
	WHERE
		YEAR(d.fecha_registro) = YEAR(GETDATE())-1
		AND d.estado = 'A'
	GROUP BY
		p.id_produto

)

SELECT top 1
	CONCAT_WS(' ', 'El producto con menor cantidad de ventas del a�o',  YEAR(GETDATE())-1, 'fue:',
	p.nombre ,'con', CASE WHEN v.cant >= 0 THEN v.cant ELSE 0 END, 'ventas') as [Producto con menos ventas]
FROM
	prods AS p
		LEFT JOIN
	cantidadV AS v ON p.id_produto = v.id_produto
ORDER BY
	v.cant
;
