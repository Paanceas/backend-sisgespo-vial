DELIMITER $$
USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `updStateUser`$$
CREATE PROCEDURE `updStateUser`(in id_usuario_r int(11), in state_r boolean) 
BEGIN
    UPDATE sisgespro.usuario SET eliminar = state_r WHERE id_usuario = id_usuario_r;
END$$
DELIMITER ;
DELIMITER $$
USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getInventory`$$
CREATE PROCEDURE `getInventory`() 
BEGIN
    SELECT 
    m.nombre_material,
    m.codigo_material,
    p.nombre as nombre_proveedor,
    tum.nombre_tipo_uni_medida,
    m.cantidad_total
    FROM 
        sisgespro.material m
    JOIN 
        sisgespro.proveedor_has_material phm ON m.id_material = phm.id_material
    JOIN 
        sisgespro.proveedor p ON phm.id_proveedor = p.id_proveedor
    JOIN 
        sisgespro.tipo_uni_medida tum ON m.id_tipo_uni_medida = tum.id_tipo_uni_medida;
    END$$
DELIMITER ;
DELIMITER $$
USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getInventoryProject`$$
CREATE PROCEDURE `getInventoryProject`(in id_proyecto_r int(11)) 
BEGIN
    SELECT 
    chm.id_material,
    m.nombre_material,
    m.codigo_material,
    chm.cantidad AS cantidad_necesaria,
    m.cantidad_total AS cantidad_disponible
    FROM sisgespro.proyecto p
    JOIN sisgespro.estado e ON p.id_estado = e.id_estado
    JOIN sisgespro.cotizacion c ON p.id_cotizacion = c.id_cotizacion
    JOIN sisgespro.cotizacion_has_material chm ON c.id_cotizacion = chm.id_cotizacion
    JOIN sisgespro.material m ON chm.id_material = m.id_material
    where p.id_proyecto = id_proyecto_r;
END$$
DELIMITER ;
DELIMITER $$
USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `updStateProject`$$
CREATE PROCEDURE `updStateProject`(in id_project_r int(11), in state_r int(11)) 
BEGIN
    UPDATE sisgespro.proyecto SET id_estado = state_r WHERE id_proyecto = id_project_r;
    
    UPDATE material m
    JOIN cotizacion_has_material chm ON m.id_material = chm.id_material
    JOIN cotizacion c ON chm.id_cotizacion = c.id_cotizacion
    JOIN proyecto p ON c.id_cotizacion = p.id_cotizacion
    SET m.cantidad_total = m.cantidad_total - chm.cantidad
    WHERE p.id_proyecto = id_project_r AND p.id_estado = 2;

END$$
DELIMITER ;