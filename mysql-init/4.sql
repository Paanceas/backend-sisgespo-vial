DELIMITER $$
USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getInformacionDasboard`$$
CREATE PROCEDURE `getInformacionDasboard` ()
BEGIN
    DECLARE total_clientes_activos INT;
    DECLARE total_proveedores_activos INT;
    DECLARE total_empleados_activos INT;
    DECLARE total_cotizaciones_activas INT;
    DECLARE total_proyectos_activos INT;
    DECLARE suma_adquisiciones_ano_actual INT;

    -- Cantidad de clientes activos
    SELECT COUNT(*) INTO total_clientes_activos
    FROM sisgespro.cliente
    WHERE eliminar = 0;

    -- Cantidad de proveedores activos
    SELECT COUNT(*) INTO total_proveedores_activos
    FROM sisgespro.proveedor
    WHERE eliminar = 0;

    -- Cantidad de empleados activos
    SELECT COUNT(*) INTO total_empleados_activos
    FROM sisgespro.empleado
    WHERE eliminar = 0;

    -- Cantidad de cotizaciones activas
    SELECT COUNT(*) INTO total_cotizaciones_activas
    FROM sisgespro.cotizacion
    WHERE eliminar = 0;

    -- Cantidad de proyectos activos
    SELECT COUNT(*) INTO total_proyectos_activos
    FROM sisgespro.proyecto
    WHERE eliminar = 0;

    -- Suma de todas las adquisiciones del año actual
    SELECT SUM(valor_total_adquisicion) INTO suma_adquisiciones_ano_actual
    FROM sisgespro.adquisicion
    WHERE YEAR(fecha_adquisicion) = YEAR(CURRENT_DATE());

    -- Cantidad de proyectos activos
    SELECT COUNT(*) INTO total_clientes_activos
    FROM sisgespro.cliente
    WHERE eliminar = 0;

    -- Devuelve los resultados
    SELECT total_clientes_activos AS 'total_clientes_activos',
           total_proveedores_activos AS 'total_proveedores_activos',
           total_empleados_activos AS 'total_empleados_activos',
           total_cotizaciones_activas AS 'total_cotizaciones_activas',
           total_proyectos_activos AS 'total_proyectos_activos',
           suma_adquisiciones_ano_actual AS 'suma_adquisiciones_ano_actual';
END$$
DELIMITER ;
DELIMITER $$
USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getEstadoProyectos`$$
CREATE PROCEDURE `getEstadoProyectos`()
BEGIN
    SELECT 
    e.tipo_estado,
    COUNT(p.id_estado) AS cantidad_por_estado,
    ROUND((COUNT(p.id_estado) / (SELECT COUNT(*) FROM sisgespro.proyecto)) * 100, 2) AS porcentaje
    FROM 
        sisgespro.estado e
    JOIN 
        sisgespro.proyecto p ON e.id_estado = p.id_estado
    GROUP BY 
        e.tipo_estado;
END$$
DELIMITER ;
DELIMITER $$
USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getCotizacionPorAnio`$$
CREATE PROCEDURE `getCotizacionPorAnio`()
BEGIN
    SELECT 
        YEAR(fecha_cotizacion) AS anio,
        MONTH(fecha_cotizacion) AS mes,
        COUNT(*) AS cantidad_cotizaciones
    FROM 
        sisgespro.cotizacion
    GROUP BY 
        YEAR(fecha_cotizacion), 
        MONTH(fecha_cotizacion)
    ORDER BY 
        YEAR(fecha_cotizacion) DESC;
END$$
DELIMITER ;