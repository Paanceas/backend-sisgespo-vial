-- VALIDAR ESTADO DE LA BD
DELIMITER $$
USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getBaseDatos`;
CREATE PROCEDURE `getBaseDatos` ()
BEGIN
	SELECT NOW() as fecha;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getCajaDeCompensacion`;
CREATE PROCEDURE `getCajaDeCompensacion` ()
BEGIN
	SELECT id_caja_de_compensacion, nombre_caja_de_compensacion 
  FROM sisgespro.caja_de_compensacion;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getCargos`;
CREATE PROCEDURE `getCargos` ()
BEGIN
	SELECT id_cargo,nombre_cargo
  FROM sisgespro.cargo;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getCategorias`;
CREATE PROCEDURE `getCategorias` ()
BEGIN
	SELECT id_categoria, nombre_categoria
  FROM sisgespro.categoria;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getCiudades`;
CREATE PROCEDURE `getCiudades` (in ubicacion int(11))
BEGIN
	SELECT id_ciudad, nombre_ciudad
  FROM sisgespro.ciudad
  WHERE id_ubicacion = ubicacion;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getEstados`;
CREATE PROCEDURE `getEstados` ()
BEGIN
	SELECT id_estado, tipo_estado
  FROM sisgespro.estado;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getPaises`;
CREATE PROCEDURE `getPaises` ()
BEGIN
	SELECT id_pais, nombre_pais, abreviatura 
  FROM sisgespro.pais;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getPensiones`;
CREATE PROCEDURE `getPensiones` ()
BEGIN
	SELECT id_pension, nombre_pension
  FROM sisgespro.pension;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getRolls`;
CREATE PROCEDURE `getRolls` ()
BEGIN
	SELECT tipo_roll
  FROM sisgespro.roll;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getSalud`;
CREATE PROCEDURE `getSalud` ()
BEGIN
	SELECT id_salud, tipo_salud
  FROM sisgespro.salud;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getIdentificacion`;
CREATE PROCEDURE `getIdentificacion` ()
BEGIN
	SELECT id_tipo_identificacion, tipo_identificacion
  FROM sisgespro.tipo_identificacion;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getUMedida`;
CREATE PROCEDURE `getUMedida` ()
BEGIN
	SELECT id_tipo_uni_medida, nombre_tipo_uni_medida, abreviatura
  FROM sisgespro.tipo_uni_medida;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getDepartamentos`;
CREATE PROCEDURE `getDepartamentos` (in pais int(11))
BEGIN
	SELECT id_ubicacion, nombre_ubicacion
  FROM sisgespro.ubicacion
  WHERE id_pais = pais;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getLogin`;
CREATE PROCEDURE `getLogin` (in usuario varchar(45), in con varchar(300))
BEGIN
	SELECT r.tipo_roll as roll, u.nombre_usuario as usuario, u.eliminar as estado
    FROM sisgespro.usuario u
    LEFT JOIN sisgespro.empleado e on e.id_usuario = u.id_usuario
    INNER JOIN sisgespro.roll r on r.tipo_roll = u.tipo_roll
	WHERE u.nombre_usuario = usuario and u.clave = con;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getProveedores`;
CREATE PROCEDURE `getProveedores` ()
BEGIN
  SELECT p.id_proveedor, p.id_tipo_identificacion, p.id_ciudad, u.id_ubicacion, pa.id_pais, p.nombre, t.tipo_identificacion, p.identificacion, p.direccion, p.telefono, p.celular, p.correo, c.nombre_ciudad, u.nombre_ubicacion, pa.nombre_pais, pa.abreviatura
  FROM sisgespro.proveedor p
  INNER JOIN sisgespro.tipo_identificacion t on t.id_tipo_identificacion = p.id_tipo_identificacion
  INNER JOIN sisgespro.ciudad c on c.id_ciudad = p.id_ciudad
  INNER JOIN sisgespro.ubicacion u on u.id_ubicacion = c.id_ubicacion
  INNER JOIN sisgespro.pais pa on pa.id_pais = u.id_pais
  WHERE p.eliminar = 0;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `setProveedor`;
CREATE PROCEDURE `setProveedor` (in id_tipo_identificacion int(11), in id_ciudad int(11), nombre varchar(25), identificacion varchar(25), direccion varchar(25), celular varchar(25), telefono varchar(25), correo varchar(25))
BEGIN
  INSERT INTO sisgespro.proveedor (`id_tipo_identificacion`, `id_ciudad`, `nombre`, `identificacion`, `direccion`, `celular`, `telefono`, `correo`) 
  VALUES (id_tipo_identificacion, id_ciudad, nombre, identificacion, direccion, celular, telefono, correo);
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `updProveedor`;
CREATE PROCEDURE `updProveedor` (in proveedor int(11), direccion varchar(25), celular varchar(25), telefono varchar(25), correo varchar(25))
BEGIN
  UPDATE sisgespro.proveedor 
  SET `direccion` = direccion, `telefono` = telefono, `celular` = celular, `correo` = correo
  WHERE `id_proveedor` = proveedor;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getProveedor`;
CREATE PROCEDURE `getProveedor` (in proveedor int(11))
BEGIN
  SELECT m.id_material, m.id_categoria, c.nombre_categoria, m.id_tipo_uni_medida, t.nombre_tipo_uni_medida, t.abreviatura, m.codigo_material, m.nombre_material, m.precio_unitario, m.cantidad_total, m.descripcion_material
  FROM sisgespro.proveedor_has_material phm
  INNER JOIN sisgespro.proveedor p on p.id_proveedor = phm.id_proveedor
  INNER JOIN sisgespro.material m on m.id_material = phm.id_material
  INNER JOIN sisgespro.categoria c on c.id_categoria = m.id_categoria
  INNER JOIN sisgespro.tipo_uni_medida t on t.id_tipo_uni_medida = m.id_tipo_uni_medida
  WHERE phm.id_proveedor = proveedor;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getAdquisiciones`;
CREATE PROCEDURE `getAdquisiciones` ()
BEGIN
  SELECT id_adquisicion, fecha_adquisicion, valor_total_adquisicion
  FROM sisgespro.adquisicion;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getAdquisicion`;
CREATE PROCEDURE `getAdquisicion` (in iadquisicion int(11))
BEGIN

  SELECT m.id_material, m.id_categoria, c.nombre_categoria, m.id_tipo_uni_medida, t.nombre_tipo_uni_medida, t.abreviatura, m.codigo_material, m.nombre_material, mha.precio_unitario, mha.cantidad, m.descripcion_material
  FROM sisgespro.material_has_adquisicion mha
  INNER JOIN sisgespro.adquisicion q on q.id_adquisicion = mha.id_adquisicion
  INNER JOIN sisgespro.material m on m.id_material = mha.id_material
  INNER JOIN sisgespro.categoria c on c.id_categoria = m.id_categoria
  INNER JOIN sisgespro.tipo_uni_medida t on t.id_tipo_uni_medida = m.id_tipo_uni_medida
  WHERE mha.id_adquisicion = iadquisicion;

END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `setAdquisicion`;
CREATE PROCEDURE `setAdquisicion` (in fecha_adquisicion DATETIME, in valor_total_adquisicion int(11))
BEGIN
  INSERT INTO sisgespro.adquisicion (`fecha_adquisicion`, `valor_total_adquisicion`) 
  VALUES (fecha_adquisicion, valor_total_adquisicion);

  SELECT LAST_INSERT_ID() as id_adquisicion;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `setAdquisicionHasMaterial`;
CREATE PROCEDURE `setAdquisicionHasMaterial` (in id_material int(11), in id_adquisicion int(11), in cantidad int(11), in precio_unitario int(11))
BEGIN
  INSERT INTO sisgespro.material_has_adquisicion (`id_material`, `id_adquisicion`, `cantidad`, `precio_unitario`) 
  VALUES (id_material, id_adquisicion, cantidad, precio_unitario);
  SELECT LAST_INSERT_ID() as id_adquisicion;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `setMaterial`;
CREATE PROCEDURE `setMaterial` (in id_categoria_r int(11), in id_tipo_uni_medida_r int(11), in id_codigo_material_r VARCHAR(15), in nombre_material_r VARCHAR(25), in precio_unitario_r int(11), in cantidad_total_r int(11),  in descripcion_material_r VARCHAR(500))
BEGIN

  DECLARE i_material INT;
  SELECT id_material into i_material
  FROM sisgespro.material 
  WHERE codigo_material = id_codigo_material_r;

  IF i_material IS NULL THEN
    INSERT INTO sisgespro.material (`id_categoria`, `id_tipo_uni_medida`, `codigo_material`, `nombre_material`, `precio_unitario`, `cantidad_total`, `descripcion_material`) 
    VALUES (id_categoria_r, id_tipo_uni_medida_r, id_codigo_material_r, nombre_material_r, precio_unitario_r, cantidad_total_r, descripcion_material_r);
    SELECT LAST_INSERT_ID() as id_material;
  ELSE
    UPDATE sisgespro.material 
    SET cantidad_total = cantidad_total+cantidad_total_r,
    precio_unitario =precio_unitario_r
    WHERE id_material = i_material;
    SELECT i_material as id_material;
  END IF;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `setProveedorHasMaterial`;
CREATE PROCEDURE `setProveedorHasMaterial` (in id_material_r int(11), in id_proveedor_r int(11))
BEGIN
  DECLARE i_proveedor INT;
  SELECT id_proveedor_has_material into i_proveedor
  FROM sisgespro.proveedor_has_material 
  WHERE id_proveedor = id_proveedor_r AND id_material = id_material_r;

  IF i_proveedor IS NULL THEN
    INSERT INTO sisgespro.proveedor_has_material (`id_proveedor`, `id_material`) 
    VALUES (id_proveedor_r, id_material_r);
    SELECT LAST_INSERT_ID() as id_proveedor_has_material;
  ELSE
    SELECT i_proveedor as id_proveedor_has_material;
  END IF;

END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getCotizaciones`;
CREATE PROCEDURE `getCotizaciones` ()
BEGIN
  SELECT ti.tipo_identificacion, cl.identificacion, cl.nombre, cl.telefono, c.id_cotizacion,  c.fecha_cotizacion, c.nota_inicio, c.iva, c.nota_final
  FROM sisgespro.cotizacion c
  INNER JOIN sisgespro.cliente cl on cl.id_cliente = c.id_cliente
  INNER JOIN sisgespro.tipo_identificacion ti on ti.id_tipo_identificacion = cl.id_tipo_identificacion;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getCotizacion`;
CREATE PROCEDURE `getCotizacion` (in cotizacion int(11))
BEGIN
  SELECT m.id_material, tum.id_tipo_uni_medida, tum.nombre_tipo_uni_medida, chm.precio, chm.cantidad, chm.descripcion, m.nombre_material, m.codigo_material
  FROM sisgespro.cotizacion c
  INNER JOIN sisgespro.cotizacion_has_material chm on chm.id_cotizacion = c.id_cotizacion
  INNER JOIN sisgespro.material m on m.id_material = chm.id_material
  INNER JOIN sisgespro.tipo_uni_medida  tum on tum.id_tipo_uni_medida = chm.id_tipo_uni_medida
  WHERE c.id_cotizacion = cotizacion;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `setCotizacion`;
CREATE PROCEDURE `setCotizacion` (in id_cliente int(11),in fecha_cotizacion date, in nota_inicio varchar(500), in iva float, in nota_final varchar(500))
BEGIN
  INSERT INTO sisgespro.cotizacion (`id_cliente`, `fecha_cotizacion`, `nota_inicio`, `iva`, `nota_final`) 
  VALUES (id_cliente, fecha_cotizacion, nota_inicio, iva, nota_final);
  SELECT LAST_INSERT_ID() as id_cotizacion;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `setCotizacionHasMaterial`;
CREATE PROCEDURE `setCotizacionHasMaterial` (in id_cotizacion int(11), in id_tipo_uni_medida int(11), in id_material int(11), in precio int(11), in cantidad int(11),  in descripcion VARCHAR(500))
BEGIN
  INSERT INTO sisgespro.cotizacion_has_material (`id_cotizacion`, `id_tipo_uni_medida`, `id_material`, `precio`, `cantidad`, `totalUnitario`, `descripcion`) 
  VALUES (id_cotizacion, id_tipo_uni_medida, id_material, precio, cantidad, precio*cantidad, descripcion);
  SELECT LAST_INSERT_ID() as id_cotizacion;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getProyectos`;
CREATE PROCEDURE `getProyectos` ()
BEGIN
  SELECT p.id_proyecto ,p.codigo_proyecto, p.id_cotizacion, p.nombre_proyecto, p.descripcion_proyecto, p.fecha_inicio_proyecto, p.fecha_final_proyecto, p.valor_anticipado, p.valor_total_proyecto, p.geoposicion, e.id_estado, e.tipo_estado
  FROM sisgespro.proyecto p
  INNER JOIN sisgespro.estado e on e.id_estado = p.id_estado
  ORDER by p.id_proyecto DESC;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getProyectosHasEmpleados`;
CREATE PROCEDURE `getProyectosHasEmpleados` (in id_proyecto int(11))
BEGIN
  SELECT e.id_empleado, ti.tipo_identificacion, e.nombre, c.nombre_cargo FROM sisgespro.empleado_has_proyecto ehp
  INNER JOIN sisgespro.proyecto p on p.id_proyecto = ehp.id_proyecto
  INNER JOIN sisgespro.empleado e on e.id_empleado = ehp.id_empleado
  INNER JOIN sisgespro.tipo_identificacion ti on ti.id_tipo_identificacion = e.id_tipo_identificacion
  INNER JOIN sisgespro.cargo c on c.id_cargo = e.id_cargo
  WHERE p.id_proyecto = id_proyecto;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `setProyecto`;
CREATE PROCEDURE `setProyecto` (in id_cotizacion int(11),in id_estado int(11), in nombre_proyecto varchar(50), in codigo_proyecto varchar(30), in descripcion_proyecto varchar(500), in fecha_inicio_proyecto date, in valor_anticipado int(11), in valor_total_proyecto int(11),  in geoposicion varchar(1000))
BEGIN
  INSERT INTO sisgespro.proyecto (`id_cotizacion`, `id_estado`, `nombre_proyecto`, `codigo_proyecto`, `descripcion_proyecto`, `fecha_inicio_proyecto`, `valor_anticipado`, `valor_total_proyecto`, `geoposicion`) 
  VALUES (id_cotizacion, id_estado, nombre_proyecto, codigo_proyecto, descripcion_proyecto, fecha_inicio_proyecto, valor_anticipado, valor_total_proyecto, geoposicion);
  SELECT LAST_INSERT_ID() as id_proyecto;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `setProyectosHasEmpleados`;
CREATE PROCEDURE `setProyectosHasEmpleados` (in id_empleado int(11),in id_proyecto int(11))
BEGIN
  INSERT INTO sisgespro.empleado_has_proyecto (`id_empleado`, `id_proyecto`) 
  VALUES (id_empleado, id_proyecto);
  SELECT LAST_INSERT_ID() as id_proyecto;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getEmpleados`;
CREATE PROCEDURE `getEmpleados` ()
BEGIN
  SELECT e.id_empleado,
  u.nombre_usuario,
  c.nombre_cargo,
  ti.tipo_identificacion,
  e.documento,
  s.tipo_salud,
  p.nombre_pension,
  cj.nombre_caja_de_compensacion,
  e.nombre,
  e.celular
  FROM sisgespro.empleado e
  INNER JOIN sisgespro.usuario u on u.id_usuario = e.id_usuario
  INNER JOIN sisgespro.cargo c on c.id_cargo = e.id_cargo
  INNER JOIN sisgespro.tipo_identificacion ti on ti.id_tipo_identificacion = e.id_tipo_identificacion
  INNER JOIN sisgespro.salud s on s.id_salud = e.id_salud
  INNER JOIN sisgespro.pension p on p.id_pension = e.id_pension
  INNER JOIN sisgespro.caja_de_compensacion cj on cj.id_caja_de_compensacion = e.id_caja_de_compensacion;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getUsuarios`;
CREATE PROCEDURE `getUsuarios` ()
BEGIN
	SELECT id_usuario, tipo_roll, nombre_usuario, eliminar as estado
  FROM sisgespro.usuario
  WHERE id_usuario <> 1;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getClientes`;
CREATE PROCEDURE `getClientes` ()
BEGIN
	SELECT c.id_cliente, ti.tipo_identificacion ,c.id_tipo_identificacion,  c.identificacion, c.nombre, c.telefono, c.celular, c.direccion, c.correo
  FROM sisgespro.cliente c
  INNER JOIN sisgespro.tipo_identificacion ti on ti.id_tipo_identificacion = c.id_tipo_identificacion
  WHERE c.eliminar = 0;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getMateriales`;
CREATE PROCEDURE `getMateriales` ()
BEGIN
	SELECT m.id_material, m.codigo_material, tum.nombre_tipo_uni_medida, tum.id_tipo_uni_medida
  FROM sisgespro.material m
  INNER JOIN sisgespro.tipo_uni_medida tum on tum.id_tipo_uni_medida = m.id_tipo_uni_medida
  WHERE m.cantidad_total > 0;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `getClientesYCotizaciones`;
CREATE PROCEDURE `getClientesYCotizaciones` ()
BEGIN
  SELECT
        c.id_cliente,
        c.id_tipo_identificacion,
        c.nombre,
        c.identificacion,
        c.telefono,
        c.celular,
        c.direccion,
        c.correo,
        ci.nombre_ciudad AS ciudad,
        (SELECT COUNT(*) FROM cotizacion WHERE id_cliente = c.id_cliente) AS cantidad_cotizaciones
    FROM
        cliente c
    JOIN ciudad ci ON c.id_ciudad = ci.id_ciudad
    WHERE
        c.eliminar = 0;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `setCliente`$$
CREATE PROCEDURE `setCliente`(
    IN p_id_tipo_identificacion INT,
    IN p_id_ciudad INT,
    IN p_nombre VARCHAR(35),
    IN p_identificacion VARCHAR(25),
    IN p_telefono VARCHAR(25),
    IN p_celular VARCHAR(25),
    IN p_direccion VARCHAR(35),
    IN p_correo VARCHAR(30)
)
BEGIN
    DECLARE existente INT;
    SELECT COUNT(*)
    INTO existente
    FROM cliente
    WHERE identificacion = p_identificacion;
    IF existente = 0 THEN
        INSERT INTO cliente (id_tipo_identificacion, id_ciudad, nombre, identificacion, telefono, celular, direccion, correo, eliminar)
        VALUES (p_id_tipo_identificacion, p_id_ciudad, p_nombre, p_identificacion, p_telefono, p_celular, p_direccion, p_correo, 0);
    END IF;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `setUsuario`$$
CREATE PROCEDURE `setUsuario` (
    IN p_tipo_roll VARCHAR(25), 
    IN p_nombre_usuario VARCHAR(25), 
    IN p_clave VARCHAR(256)
)
BEGIN
    INSERT INTO usuario (`tipo_roll`, `nombre_usuario`, `clave`, `eliminar`) 
    VALUES (p_tipo_roll, p_nombre_usuario, p_clave, 0);
    SELECT LAST_INSERT_ID() as id_usuario;
END$$

USE `sisgespro`$$
DROP PROCEDURE IF EXISTS `setCliente`$$
CREATE PROCEDURE `setCliente` (
    IN p_id_cliente INT,
    IN p_id_tipo_identificacion INT,
    IN p_identificacion VARCHAR(25),
    IN p_nombre VARCHAR(35),
    IN p_telefono VARCHAR(25),
    IN p_celular VARCHAR(25),
    IN p_direccion VARCHAR(35),
    IN p_correo VARCHAR(30)
)
BEGIN
    DECLARE existente INT;
    SELECT COUNT(*) INTO existente 
    FROM cliente 
    WHERE id_tipo_identificacion = p_id_tipo_identificacion AND identificacion = p_identificacion;

    IF p_id_cliente = 0 AND existente = 0 THEN
        INSERT INTO cliente (id_tipo_identificacion, identificacion, nombre, telefono, celular, direccion, correo, id_ciudad) 
        VALUES (p_id_tipo_identificacion, p_identificacion, p_nombre, p_telefono, p_celular, p_direccion, p_correo, 14);
    ELSEIF p_id_cliente != 0 THEN
        UPDATE cliente 
        SET nombre = p_nombre,
            telefono = p_telefono,
            celular = p_celular,
            direccion = p_direccion,
            correo = p_correo
        WHERE id_cliente = p_id_cliente;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe un cliente con este tipo y número de identificación.';
    END IF;
END$$
DELIMITER ;
