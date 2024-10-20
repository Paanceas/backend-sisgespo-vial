
DROP DATABASE IF EXISTS sisgespro;
CREATE DATABASE sisgespro;
USE sisgespro;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*v12.4 MODIFICACION DE ALGUNOS TRIGGERS Y ADD COLUMN fecha_expedicion, fecha_nacimiento, add CotHMat TOTALUnitario*/
/*================RELACIONADA CON EMPLEADO
TABLA CARGO
================*/
CREATE TABLE `cargo` (
`id_cargo` int NOT NULL AUTO_INCREMENT,
`nombre_cargo` varchar(25) NOT NULL,
PRIMARY KEY(`id_cargo`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO `sisgespro`.`cargo` (`nombre_cargo`)
VALUES ('Gerente General'), ('Gerente Administrativo'), ('Gerente Operativo'), ('Secretaria'), ('Auxiliar administrativo'), ('Auxiliar operativo');




/*================RELACIONADA CON MATERIAL
TABLA CATEGORIA
================*/
CREATE TABLE `categoria` (
`id_categoria` int NOT NULL  AUTO_INCREMENT,
`nombre_categoria` varchar(25) NOT NULL,
PRIMARY KEY(`id_categoria`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `sisgespro`.`categoria` (`nombre_categoria`)
VALUES ('Demarcación'), ('Señalización');


/*================
TABLA TIPO_IDENTIFICACION
================*/
CREATE TABLE `tipo_identificacion` (
`id_tipo_identificacion` int NOT NULL AUTO_INCREMENT,
`tipo_identificacion` varchar(25) NOT NULL,
PRIMARY KEY(`id_tipo_identificacion`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sisgespro`.`tipo_identificacion` (`tipo_identificacion`)
VALUES ('CC'), ('RC'), ('CE'), ('CI'), ('DNI'), ('PASS'), ('NIT');


/*================RELACIONADA CON EMPLEADO
TABLA SALUD
================*/
CREATE TABLE `salud` (
`id_salud` int NOT NULL AUTO_INCREMENT,
`tipo_salud` varchar(25) NOT NULL,
 PRIMARY KEY(`id_salud`))
 ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO `sisgespro`.`salud` (`tipo_salud`)
VALUES ('CAPITAL SALUD'), ('SALUDCOOP'), ('CAPRECOM'), ('NUEVA EPS S.A.'), ('SALUD TOTAL'), ('HUMANA VIVIR'), ('FAMISANAR'), ('SANITAS EPS'), ('SURA'), ('CAPRECOM'), ('CAFE SALUD'), ('COLMEDICA'), ('COOMEVA'), ('COMPENSAR');



/*================RELACIONADA CON EMPLEADO
TABLA PENSION
================*/
CREATE TABLE `pension` (
`id_pension` int NOT NULL AUTO_INCREMENT,
`nombre_pension` varchar(25) NOT NULL,
PRIMARY KEY(`id_pension`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sisgespro`.`pension` (`nombre_pension`)
VALUES ('COLPENSIONES'), ('PORVENIR');


/*================RELACIONADA CON EMPLEADO
TABLA CAJA_DE_COMPENSACION
================*/
CREATE TABLE `caja_de_compensacion` (
`id_caja_de_compensacion` int NOT NULL AUTO_INCREMENT,
`nombre_caja_de_compensacion` varchar(25) NOT NULL,
PRIMARY KEY(`id_caja_de_compensacion`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sisgespro`.`caja_de_compensacion` (`nombre_caja_de_compensacion`)
VALUES ('FNA'), ('COMFENALCO'), ('COMCAJA'), ('CAFAM'), ('ASOCAJAS'), ('COMFACAUCA'), ('COMPENSAR'), ('COMFANDI'), ('COLSUBSIDIO'), ('CAJACOPI'), ('COMFACA'), ('CAJASAI'), ('COMFAMILIAR'), ('COMFABOY'), ('COMFANORTE'),('CONFACOR'), ('COMBARRANQUILLA'), ('COMFATOLIMA');




/*================RELACIONADA CON COTIZACION HAS MATERIAL
TIPO_UNI_MEDIDA
================*/
CREATE TABLE `tipo_uni_medida` (
`id_tipo_uni_medida` int NOT NULL AUTO_INCREMENT,
`nombre_tipo_uni_medida` varchar(25) NOT NULL,
`abreviatura` varchar(15) NULL,
PRIMARY KEY(`id_tipo_uni_medida`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sisgespro`.`tipo_uni_medida` (`nombre_tipo_uni_medida`, `abreviatura`)
VALUES ('UNIDAD', 'u'), ('GALON', 'gl'), ('BARRIL', 'bls'), ('LITRO', 'l'),  ('METRO LINEAL', 'ml'), ('METRO CUADRADO', 'm²');


/*================RELACIONADA CON UBICACION
TABLA PAIS
================*/
CREATE TABLE `pais` (
`id_pais` int NOT NULL AUTO_INCREMENT,
`nombre_pais` varchar(25) NOT NULL,
`abreviatura` varchar(15) NULL,
PRIMARY KEY(`id_pais`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `sisgespro`.`pais` (`nombre_pais`, `abreviatura`)
VALUES ('Colombia', 'CO'), ('China', 'CN'), ('Estados Unidos', 'US'), ('Mexico', 'MX');



/*================RELACIONADA CON PROYECTO
TABLA ESTADO
================*/
CREATE TABLE `estado`
(`id_estado` int NOT NULL AUTO_INCREMENT,
`tipo_estado` varchar(25) NOT NULL,
PRIMARY KEY(`id_estado`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sisgespro`.`estado` (`tipo_estado`)
VALUES ('POR INICIAR'), ('EN EJECUCIÓN'), ('TERMINADO');



/*================RELACIONADA CON USUARIO
TABLA ROLL
================*/
CREATE TABLE `roll` (
`tipo_roll` varchar(25) NOT NULL,
PRIMARY KEY(`tipo_roll`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sisgespro`.`roll` (`tipo_roll`)
VALUES ('Administrador'), ('Secretaria'), ('Empleado');


/*================
TABLA USUARIO
================*/
CREATE TABLE `usuario` (
`id_usuario` int NOT NULL AUTO_INCREMENT,
`tipo_roll` varchar(25) NOT NULL,
`nombre_usuario` varchar(25) NOT NULL,
`clave` varchar(256) NOT NULL,
`eliminar` boolean NOT NULL DEFAULT 0,
PRIMARY KEY(`id_usuario`),
UNIQUE(`nombre_usuario`),
FOREIGN KEY (`tipo_roll`) REFERENCES `roll` (`tipo_roll`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sisgespro`.`usuario` (`tipo_roll`, `nombre_usuario`, `clave`, `eliminar`)
VALUES ('Empleado', 'Empleado', '2df589749f656253ff8c3309ca8bfab79fd9284b863038ecadbb2158061f577b',1),
('Administrador', 'paanceas', '2df589749f656253ff8c3309ca8bfab79fd9284b863038ecadbb2158061f577b',0),
('Secretaria', 'secretaria', '2df589749f656253ff8c3309ca8bfab79fd9284b863038ecadbb2158061f577b',0),
('Administrador', 'speralta', '2df589749f656253ff8c3309ca8bfab79fd9284b863038ecadbb2158061f577b',0);

/*================
TABLA UBICACION
================*/
CREATE TABLE `ubicacion`
(`id_ubicacion` int NOT NULL AUTO_INCREMENT,
`id_pais` int NOT NULL,
`nombre_ubicacion` varchar(25) NOT NULL,
PRIMARY KEY(`id_ubicacion`),
FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`))
ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO `sisgespro`.`ubicacion`(`id_ubicacion`, `id_pais`, `nombre_ubicacion`)
VALUES (1, 1, 'Amazonas'), (2, 1, 'Antioquia'), (3, 1, 'Arauca'), (4, 1, 'Atlántico'), (5, 1, 'Bolívar'),(6, 1, 'Boyacá'),(7, 1, 'Caldas'),(8, 1,'Caquetá'),(9, 1, 'Casanare'),(10, 1, 'Cauca'),(11, 1, 'Cesar'),(12, 1, 'Chocó'),(13, 1, 'Córdoba'),(14, 1, 'Cundinamarca'),(15, 1, 'Güainia'),(16, 1, 'Guaviare'),(17, 1, 'Huila'),(18, 1, 'La Guajira'),(19, 1, 'Magdalena'),(20, 1,'Meta'),(21, 1, 'Nariño'),(22, 1, 'Norte de Santander'),(23, 1, 'Putumayo'),(24, 1, 'Quindo'),(25, 1, 'Risaralda'),(26, 1, 'San Andrés y Providencia'),(27, 1, 'Santander'),(28, 1, 'Sucre'),(29, 1,'Tolima'),(30, 1, 'Valle del Cauca'),(31, 1, 'Vaupés'),(32, 1, 'Vichada'),
(33, 4, 'Aguascalientes'),(34, 4, 'Baja California'),(35, 4, 'Baja California Sur'),(36, 4, 'Campeche'),(37, 4, 'Coahuila'),(38, 4, 'Colima'),(39, 4, 'Chiapas'),(40, 4, 'Chihuahua'),(41, 4, 'Distrito Federal'),(42, 4, 'Durango'),(43, 4, 'Guerrero'),(44, 4, 'Hidalgo'),(45, 4, 'Jalisco'),(46, 4, 'Estado de México'),(47, 4, 'Michoacan'),(48, 4, 'Morelos'),(49, 4, 'Nayarit'),(50, 4, 'Nuevo León'),(51, 4, 'Oaxaca'),(52, 4, 'Puebla'),(53, 4, 'Querétaro'),(54, 4, 'Quintana Roo'),(55, 4, 'San Luis Potosí'),(56, 4, 'Sinaloa'),(57, 4, 'Sonora'),(58, 4, 'Tabasco'),(59, 4, 'Tamaulipas'),(60, 4, 'Tlaxcala'),(61, 4, 'Veracruz'),(62, 4, 'Yucatán'),(63, 4, 'Zacatecas'),(64, 4, 'Guanajuato');




/*================
TABLA CIUDAD
================*/
CREATE TABLE `ciudad`
(`id_ciudad` int NOT NULL AUTO_INCREMENT,
`id_ubicacion` int NOT NULL,
`nombre_ciudad` varchar(25) NOT NULL,
PRIMARY KEY(`id_ciudad`),
FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id_ubicacion`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `sisgespro`.`ciudad` (`id_ciudad`, `id_ubicacion`, `nombre_ciudad`)
VALUES (1, 1, 'Leticia'), (2, 2, 'Medellín'), (3, 3, 'Arauca'),(4, 4, 'Barranquilla'),(5, 5, 'Cartagena'),(6, 6, 'Tunja'), (7, 7, 'Manizales'), (8, 8, 'Florencia'), (9, 9, 'Yopal'), (10, 10, 'Popayán'),(11, 11, 'Valledupar'), (12, 12, 'Quibdó'), (13, 13, 'Montería'), (14, 14, 'Bogotá'), (15, 15, 'Puerto Inírida'), (16, 16, 'San José del Guaviare'), (17, 17, 'Neiva'), (18, 18, 'Riohacha'),(19, 19, 'Santa Marta'), (20, 20, 'Villavicencio'), (21, 21, 'Pasto'), (22, 22, 'Cúcuta'), (23, 23, 'Mocoa'), (24, 24, 'Armenia'),(25, 25, 'Pereira'), (26, 26, 'San Andres'), (27, 27, 'Bucaramanga'), (28, 28, 'Sincelejo'), (29, 29, 'Ibagué'), (30, 30, 'Cali'), (31, 31, 'Mitú'), (32, 32, 'Puerto Carreño'),(33, 48, 'Monterrey'),(34, 45, 'Guadalajara'),(35, 56, 'Culiacán'),(36, 57, 'Hermosillo'),(37, 62, 'Mérida'),(38, 54, 'Cancún'),(39, 54, 'Playa del Carmen'),(40, 36, 'Campeche'),(41, 58, 'Villahermosa'),(42, 61, 'Veracruz'),(43, 61, 'Coatzacoalcos'),(44, 61, 'Minatitlan'),(45, 48, 'Cuernavaca'),(46, 43, 'Acapulco'),
(47, 39, 'Tuxtla Gutiérrez'),(48, 39, 'Tapachula'),(49, 38, 'Manzanillo');





/*================
TABLA PROVEEDOR
================*/
CREATE TABLE `proveedor` (
`id_proveedor` int NOT NULL AUTO_INCREMENT,
`id_tipo_identificacion` int NOT NULL,
`id_ciudad` int NOT NULL,
`nombre` varchar(25) NOT NULL,
`identificacion` varchar(25) NOT NULL,
`direccion` varchar(30) NULL,
`telefono` varchar(25) NOT NULL,
`celular` varchar(25) NULL,
`correo` varchar(35) NULL,
`eliminar` boolean NOT NULL DEFAULT 0,
PRIMARY KEY(`id_proveedor`),
UNIQUE(`identificacion`),
CONSTRAINT fk_TipoIdentificacionProveedor FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `tipo_identificacion`(`id_tipo_identificacion`),
FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sisgespro`.`proveedor` (`id_tipo_identificacion`,  `id_ciudad`, `nombre`, `identificacion`, `direccion`, `telefono`, `celular`, `correo`)
VALUES (7, 2, 'PINTUBLER DE COLOMBIA S.A.', '582322112', 'Kilómetro 1.8 Autopista Medellín.', '57+1 6922626', null, 'servicioalcliente@pinturasbler.com'), (7, 2, 'PINTUCO S.A', '890900148', 'Calle 19A # 43B - 41', '01 8000 111 247', null, 'contacto@pintuco.com'), (7, 14, 'AB SEÑALIZACION SAS.', '7832201222', 'Av. 78 No. 122-32', '57(1) 6267445', null, 'ventas@absenalizacion.com');


/*================
TABLA EMPLEADO
================*/
CREATE TABLE `empleado` (
`id_empleado` int NOT NULL AUTO_INCREMENT,
`id_usuario` int NULL,
`id_cargo` int NOT NULL,
`id_tipo_identificacion` int NOT NULL,
`id_salud` int NOT NULL,
`id_pension` int NOT NULL,
`id_caja_de_compensacion` int NOT NULL,
`id_ciudad` int NOT NULL,
`nombre` varchar(35) NOT NULL,
`fecha_nacimiento` date NOT NULL,
`documento` varchar(25) NOT NULL,
`fecha_expedicion` date NOT NULL,
`telefono` varchar(25) NULL,
`celular` varchar(25) NOT NULL,
`direccion` varchar(35) NOT NULL,
`correo` varchar(35) DEFAULT NULL,
`arl` varchar(25) NOT NULL,
`fecha_ingreso` date DEFAULT NULL,
`fecha_retiro` date DEFAULT NULL,
`eliminar` boolean NOT NULL DEFAULT 0,
PRIMARY KEY(`id_empleado`),
UNIQUE(`documento`),
FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `tipo_identificacion` (`id_tipo_identificacion`),
FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`),
FOREIGN KEY (`id_salud`) REFERENCES `salud` (`id_salud`),
FOREIGN KEY (`id_pension`) REFERENCES `pension` (`id_pension`),
FOREIGN KEY (`id_caja_de_compensacion`) REFERENCES `caja_de_compensacion` (`id_caja_de_compensacion`),
CONSTRAINT fk_CiudadEmpleado FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad`(`id_ciudad`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sisgespro`.`empleado` (`id_usuario`, `id_cargo`, `id_tipo_identificacion`, `id_salud`, `id_pension`, `id_caja_de_compensacion`, `id_ciudad`, `nombre`, `fecha_nacimiento`, `documento`, `fecha_expedicion`, `telefono`, `celular`, `direccion`, `correo`, `arl`, `fecha_ingreso`, `fecha_retiro`)
VALUES (2, 1, 1, 1, 2, 1, 14, 'Fabiola Nasser Castillo', '1966-06-06', '1000100110', '2013-03-04', '555-5555', '(300)000-0000', 'Calle 50 No. 39a - 02', 'fabiolacatillo@yahoo.com', 'SEGURO YA', '2000-07-02', null),
(3, 4, 1, 11, 1, 12, 14, 'Laura Camila Guzmán', '1995-04-03', '1035135664', '2013-04-04', '604-5512', '(310)025-4544', 'Calle 142 No. 27 - 66', null, 'Seguro Ya', '2015-02-23', '2016-02-23'),
(1, 5, 1, 2, 2, 17, 29, 'Fredy Beltrán', '1988-11-02', '203373883', '2012-04-10', '345-4534', '(321)423-4325', 'Calle 43 No. 34-22', 'fredy@hotmail.com', 'Seguro Ya', '2016-04-01', NULL);

INSERT INTO `sisgespro`.`empleado` (`id_usuario`, `id_cargo`, `id_tipo_identificacion`, `id_salud`, `id_pension`, `id_caja_de_compensacion`, `id_ciudad`, `nombre`, `fecha_nacimiento`, `documento`, `fecha_expedicion`, `telefono`, `celular`, `direccion`, `correo`, `arl`, `fecha_ingreso`, `fecha_retiro`) VALUES
(1, 5, 1, 1, 1, 1, 2, 'Andrés Martín', '1984-03-12', '1000000001', '2004-05-10', '3110000', '(310)1000001', 'Calle 1 No. 1-01', 'andres.martin@correo.com', 'ARL Sura', '2015-01-10', NULL),
(1, 5, 1, 2, 1, 2, 3, 'Beatriz Luna', '1989-07-24', '1000000002', '2009-08-15', '3110001', '(310)1000002', 'Calle 2 No. 2-02', 'beatriz.luna@correo.com', 'ARL Sura', '2016-02-15', NULL),
(1, 5, 1, 3, 1, 3, 4, 'Carlos Pérez', '1978-11-03', '1000000003', '1998-12-20', '3110002', '(310)1000003', 'Calle 3 No. 3-03', 'carlos.perez@correo.com', 'ARL Sura', '2017-03-20', NULL),
(1, 5, 1, 4, 1, 4, 5, 'Diana Gómez', '1982-02-16', '1000000004', '2002-03-25', '3110003', '(310)1000004', 'Calle 4 No. 4-04', 'diana.gomez@correo.com', 'ARL Sura', '2018-04-25', NULL),
(1, 5, 1, 5, 1, 5, 6, 'Eduardo Vargas', '1992-05-08', '1000000005', '2012-06-18', '3110004', '(310)1000005', 'Calle 5 No. 5-05', 'eduardo.vargas@correo.com', 'ARL Sura', '2019-05-18', NULL),
(1, 6, 1, 6, 1, 6, 7, 'Fernanda Castillo', '1986-08-21', '1000000006', '2006-10-02', '3110005', '(310)1000006', 'Calle 6 No. 6-06', 'fernanda.castillo@correo.com', 'ARL Sura', '2020-06-02', NULL),
(1, 5, 1, 7, 1, 7, 8, 'Gabriel Ortega', '1994-10-12', '1000000007', '2014-12-01', '3110006', '(310)1000007', 'Calle 7 No. 7-07', 'gabriel.ortega@correo.com', 'ARL Sura', '2021-07-01', NULL),
(1, 5, 1, 8, 1, 8, 9, 'Helena Rodríguez', '1990-01-20', '1000000008', '2010-03-10', '3110007', '(310)1000008', 'Calle 8 No. 8-08', 'helena.rodriguez@correo.com', 'ARL Sura', '2022-08-10', NULL),
(1, 5, 1, 9, 1, 9, 10, 'Iván Jiménez', '1985-03-30', '1000000009', '2005-06-15', '3110008', '(310)1000009', 'Calle 9 No. 9-09', 'ivan.jimenez@correo.com', 'ARL Sura', '2023-09-15', NULL),
(1, 5, 1, 10, 1, 10, 11, 'Juana Méndez', '1993-06-25', '1000000010', '2013-09-05', '3110009', '(310)1000010', 'Calle 10 No. 10-10', 'juana.mendez@correo.com', 'ARL Sura', '2024-10-05', NULL),
(1, 5, 1, 11, 1, 11, 12, 'Kevin Ramírez', '1988-09-15', '1000000011', '2008-12-20', '3110010', '(310)1000011', 'Calle 11 No. 11-11', 'kevin.ramirez@correo.com', 'ARL Sura', '2025-11-20', NULL),
(1, 6, 1, 12, 1, 12, 13, 'Luisa Fernanda Moreno', '1997-12-10', '1000000012', '2018-02-28', '3110011', '(310)1000012', 'Calle 12 No. 12-12', 'luisa.moreno@correo.com', 'ARL Sura', '2026-12-28', NULL),
(1, 6, 1, 13, 1, 13, 14, 'Miguel Ángel Castro', '1996-03-05', '1000000013', '2016-05-15', '3110012', '(310)1000013', 'Calle 13 No. 13-13', 'miguel.castro@correo.com', 'ARL Sura', '2027-01-15', NULL),
(1, 6, 1, 14, 1, 14, 2, 'Natalia Gutiérrez', '1995-06-20', '1000000014', '2015-09-04', '3110013', '(310)1000014', 'Calle 14 No. 14-14', 'natalia.gutierrez@correo.com', 'ARL Sura', '2028-02-04', NULL),
(1, 6, 1, 1, 1, 1, 3, 'Óscar Hernández', '1983-09-30', '1000000015', '2003-01-20', '3110014', '(310)1000015', 'Calle 15 No. 15-15', 'oscar.hernandez@correo.com', 'ARL Sura', '2029-03-20', NULL),
(1, 6, 1, 2, 1, 2, 4, 'Patricia Díaz', '1992-01-10', '1000000016', '2012-04-01', '3110015', '(310)1000016', 'Calle 16 No. 16-16', 'patricia.diaz@correo.com', 'ARL Sura', '2030-04-01', NULL),
(1, 6, 1, 3, 1, 3, 5, 'Roberto Álvarez', '1991-04-15', '1000000017', '2011-07-10', '3110016', '(310)1000017', 'Calle 17 No. 17-17', 'roberto.alvarez@correo.com', 'ARL Sura', '2031-05-10', NULL),
(1, 5, 1, 4, 1, 4, 6, 'Sandra Milena González', '1990-07-25', '1000000018', '2010-10-15', '3110017', '(310)1000018', 'Calle 18 No. 18-18', 'sandra.gonzalez@correo.com', 'ARL Sura', '2032-06-15', NULL),
(1, 5, 1, 5, 1, 5, 7, 'Tomás Ramírez', '1993-11-02', '1000000019', '2013-02-15', '3110018', '(310)1000019', 'Calle 19 No. 19-19', 'tomas.ramirez@correo.com', 'ARL Sura', '2033-07-15', NULL),
(1, 5, 1, 6, 1, 6, 8, 'Úrsula Vélez', '1985-02-18', '1000000020', '2005-05-25', '3110019', '(310)1000020', 'Calle 20 No. 20-20', 'ursula.velez@correo.com', 'ARL Sura', '2034-08-25', NULL),
(1, 5, 1, 7, 1, 7, 9, 'Víctor Manuel Ríos', '1987-05-12', '1000000021', '2007-08-30', '3110020', '(310)1000021', 'Calle 21 No. 21-21', 'victor.rios@correo.com', 'ARL Sura', '2035-09-30', NULL),
(1, 5, 1, 8, 1, 8, 10, 'Wendy Paola Castro', '1999-08-03', '1000000022', '2019-11-18', '3110021', '(310)1000022', 'Calle 22 No. 22-22', 'wendy.castro@correo.com', 'ARL Sura', '2036-10-18', NULL),
(1, 5, 1, 9, 1, 9, 11, 'Ximena Carolina Duarte', '1998-11-15', '1000000023', '2018-03-05', '3110022', '(310)1000023', 'Calle 23 No. 23-23', 'ximena.duarte@correo.com', 'ARL Sura', '2037-11-05', NULL),
(1, 6, 1, 10, 1, 10, 12, 'Yolanda Fuentes', '1996-03-01', '1000000024', '2016-06-15', '3110023', '(310)1000024', 'Calle 24 No. 24-24', 'yolanda.fuentes@correo.com', 'ARL Sura', '2038-12-15', NULL);

/*================
TABLA CLIENTE
================*/
CREATE TABLE  `cliente` (
`id_cliente` int NOT NULL AUTO_INCREMENT,
`id_tipo_identificacion` int NOT NULL,
`id_ciudad` int NOT NULL,
`nombre` varchar(35) NOT NULL,
`identificacion` varchar(25) NOT NULL,
`telefono` varchar(25) NULL,
`celular` varchar(25) NULL,
`direccion` varchar(35) NULL,
`correo` varchar(30) null,
`eliminar` boolean NOT NULL DEFAULT 0,
PRIMARY KEY(`id_cliente`),
UNIQUE(`identificacion`),
CONSTRAINT fk_TipoIdentificacionCliente FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `tipo_identificacion`(`id_tipo_identificacion`),
CONSTRAINT fk_CiudadCliente FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad`(`id_ciudad`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sisgespro`.`cliente` (`id_cliente`, `id_tipo_identificacion`, `id_ciudad`, `nombre`, `identificacion`, `telefono`, `celular`, `direccion`, `correo`)
VALUES (1, 1, 14, 'Carlos González', '1001060294', '4001203', '3001234567', 'Calle 95 No.91A-16', 'carlosg@sisgespro.es'),
(2, 1, 14, 'Jeison Castro', '9723133123', '4010010', '3001231231', 'Cra. 100 No. 12-30', 'jeisonc@sisgespro.es'),
(3, 1, 14, 'Pablo Ceballos', '101609429', '4011020', '3001234567', 'Calle 95 No.91A-16', 'pabloc@sisgespro.es'),
(4, 1, 14, 'Emmanuel Manios', '9624892310', '4012030', '3001231231', 'Cra. 100 No. 12-30', 'emmanuelm@sisgespro.es');


/*================
TABLA COTIZACION
================*/
CREATE TABLE `cotizacion` (
`id_cotizacion` int NOT NULL AUTO_INCREMENT,
`id_cliente` int NOT NULL,
`fecha_cotizacion` date NOT NULL,
`nota_inicio` varchar(500) NULL,
`iva` float NOT NULL,
`nota_final` varchar(500) NOT NULL,
`eliminar` boolean NOT NULL DEFAULT 0,
PRIMARY KEY(`id_cotizacion`),
FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*================
TABLA PROYECTO
================*/
CREATE TABLE `proyecto`
(`id_proyecto` int NOT NULL AUTO_INCREMENT,
`id_cotizacion` int NOT NULL,
`id_estado` int NOT NULL,
`nombre_proyecto` varchar(50) NOT NULL,
`codigo_proyecto` varchar(30) NOT NULL,
`descripcion_proyecto` varchar(500) NULL,
`fecha_inicio_proyecto` date NULL,
`fecha_final_proyecto` date NULL,
`valor_anticipado` int NOT NULL,
`valor_total_proyecto` int NOT NULL,
`geoposicion` varchar(1000) NULL,
`eliminar` boolean NOT NULL DEFAULT 0,
PRIMARY KEY(`id_proyecto`),
UNIQUE(`codigo_proyecto`),
FOREIGN KEY (`id_cotizacion`) REFERENCES `cotizacion` (`id_cotizacion`),
FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*================
TABLA REFERENCIA DE EMPLEADO CON PROYECTO
================*/
CREATE TABLE `empleado_has_proyecto`
(`id_empleado_has_proyecto` int NOT NULL AUTO_INCREMENT,
`id_empleado` int NOT NULL,
`id_proyecto` int NOT NULL,
PRIMARY KEY(`id_empleado_has_proyecto`),
UNIQUE(`id_empleado`, `id_proyecto`),
FOREIGN KEY (`id_empleado`) REFERENCES `empleado`(`id_empleado`),
FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto`(`id_proyecto`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*================
TABLA MATERIAL
================*/
CREATE TABLE `material`
(`id_material` int NOT NULL AUTO_INCREMENT,
`id_categoria` int NOT NULL,
`id_tipo_uni_medida` int NOT NULL,
`codigo_material` VARCHAR(15) NOT NULL,
`nombre_material` varchar(25) NOT NULL,
`precio_unitario` int NOT NULL,
`cantidad_total` int NOT NULL,
`descripcion_material` varchar(500) NULL,
UNIQUE(`codigo_material`),
PRIMARY KEY(`id_material`),
CONSTRAINT fk_TipoUniMedidaMaterial FOREIGN KEY (`id_tipo_uni_medida`) REFERENCES `tipo_uni_medida`(`id_tipo_uni_medida`),
FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sisgespro`.`material`(`id_categoria`, `id_tipo_uni_medida`, `codigo_material`, `nombre_material`, `precio_unitario`, `cantidad_total`, `descripcion_material`)
VALUES (1, 2, 'PMICRO01', 'Pintura microesferada', 3200, 10, 'Pintura de alta calidad, especial para carreteras donde hay poca iluminación'),
(1, 2, 'TERMO001', 'Termplástico', 4300, 15, 'Demarcación vial de alto rendimiento, duradero para carreteras y de buena calidad'),
(2, 1, 'SVERT001', 'Señales verticales', 9700, 30, 'Señales verticales 54cm x 60 cm, 2 metros de alto');



/*================
TABLA REFERENCIA DE COTIZACION CON MATERIAL
================*/
CREATE TABLE `cotizacion_has_material`
(`id_cotizacion_has_material` int NOT NULL AUTO_INCREMENT,
`id_cotizacion` int NOT NULL,
`id_material` int NOT NULL,
`id_tipo_uni_medida` int NOT NULL,
`precio` int NOT NULL,
`cantidad` int NOT NULL,
`totalUnitario` double NOT NULL,
`descripcion` varchar(500) NULL,
PRIMARY KEY(`id_cotizacion_has_material`),
UNIQUE(`id_cotizacion`, `id_material`),
FOREIGN KEY (`id_cotizacion`) REFERENCES `cotizacion` (`id_cotizacion`),
FOREIGN KEY (`id_material`) REFERENCES `material` (`id_material`),
FOREIGN KEY (`id_tipo_uni_medida`) REFERENCES `tipo_uni_medida` (`id_tipo_uni_medida`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*================
TABLA REFERENCIA DE PROVEEDOR CON MATERIAL
================*/
CREATE TABLE `proveedor_has_material`
(`id_proveedor_has_material` int NOT NULL AUTO_INCREMENT,
`id_proveedor` int NOT NULL,
`id_material` int NOT NULL,
PRIMARY KEY(`id_proveedor_has_material`),
UNIQUE(`id_proveedor`, `id_material`),
FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
FOREIGN KEY (`id_material`) REFERENCES `material` (`id_material`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sisgespro`.`proveedor_has_material`(`id_proveedor`, `id_material`)
VALUES (1, 1), (2, 1), (3, 3), (2, 2);


/*================
TABLA ADQUISICION
================*/
CREATE TABLE `adquisicion`
(`id_adquisicion` int NOT NULL AUTO_INCREMENT,
`fecha_adquisicion`  date NOT NULL,
`valor_total_adquisicion` int NOT NULL,
PRIMARY KEY(`id_adquisicion`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*================
TABLA REFERENCIA DE MATERIAL CON ADQUISICION
================*/
CREATE TABLE `material_has_adquisicion`
(`id_material_has_adquisicion` int NOT NULL AUTO_INCREMENT,
`id_material` int NOT NULL,
`id_adquisicion` int NOT NULL,
`cantidad` int NOT NULL,
`precio_unitario` int NOT NULL,
PRIMARY KEY(`id_material_has_adquisicion`),
UNIQUE(`id_material`, `id_adquisicion`),
FOREIGN KEY (`id_material`) REFERENCES `material` (`id_material`),
FOREIGN KEY (`id_adquisicion`) REFERENCES `adquisicion` (`id_adquisicion`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*
CREATE TABLE Auditoria(
 id_auditoria INT NOT NULL auto_increment,
 fecha DATE NOT NULL,
 hora TIME NOT NULL,
 usuario VARCHAR(30) NOT NULL,
 tabla VARCHAR(30) NOT NULL,
 operacion VARCHAR(15) NOT NULL,
 resumen VARCHAR(255) NOT NULL,
PRIMARY KEY (id_auditoria));



-- /*TRIGGERS*/
-- /*TRIGGER CARGO*/
-- DROP TRIGGER IF EXISTS INSERTA_CARGO;
-- CREATE TRIGGER INSERTA_CARGO after insert on cargo
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(), 'cargo', 'INSERTAR', CONCAT(NEW.id_cargo, NEW.nombre_cargo));

-- DROP TRIGGER IF EXISTS MODIFICA_CARGO;
-- CREATE TRIGGER MODIFICA_CARGO after UPDATE on cargo
-- FOR EACH ROW
-- INSERT INTO AUDITORIA (fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(),'cargo','MODIFICAR',
-- CONCAT('Antiguo: ',OLD.id_cargo, OLD.nombre_cargo, ' -> Nuevo: ', NEW.id_cargo, NEW.nombre_cargo));

-- DROP TRIGGER IF EXISTS ELIMINA_CARGO;
-- CREATE TRIGGER ELIMINA_CARGO after DELETE on cargo
-- FOR EACH ROW
-- INSERT INTO AUDITORIA (fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(),'cargo','ELIMINAR',
-- CONCAT(OLD.id_cargo, OLD.nombre_cargo));


-- /*TRIGGER CLIENTE*/
-- DROP TRIGGER IF EXISTS INSERTA_CLIENTE;
-- CREATE TRIGGER INSERTA_CLIENTE after insert on cliente
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(), 'cliente', 'INSERTAR', CONCAT(NEW.id_cliente, NEW.id_tipo_identificacion, NEW.id_ciudad, NEW.nombre, NEW.identificacion, NEW.telefono, NEW.celular, NEW.direccion, NEW.correo));

-- DROP TRIGGER IF EXISTS MODIFICA_CLIENTE;
-- CREATE TRIGGER MODIFICA_CLIENTE after UPDATE on cliente
-- FOR EACH ROW
-- INSERT INTO AUDITORIA (fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(),'cliente','MODIFICAR',
-- CONCAT('Antiguo: ',OLD.id_cliente, OLD.id_tipo_identificacion, OLD.id_ciudad, OLD.nombre, OLD.identificacion, OLD.telefono, OLD.celular, OLD.direccion, OLD.correo, ' -> Nuevo: ', NEW.id_cliente, NEW.id_tipo_identificacion, NEW.id_ciudad, NEW.nombre, NEW.identificacion, NEW.telefono, NEW.celular, NEW.direccion, NEW.correo));

-- DROP TRIGGER IF EXISTS ELIMINA_CLIENTE;
-- CREATE TRIGGER ELIMINA_CLIENTE after DELETE on cliente
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(), 'cliente', 'ELIMINAR', CONCAT(OLD.id_cliente, OLD.id_tipo_identificacion, OLD.id_ciudad, OLD.nombre, OLD.identificacion, OLD.telefono, OLD.celular, OLD.direccion, OLD.correo));


-- /*TRIGGER EMPLEADO*/
-- DROP TRIGGER IF EXISTS INSERTA_EMPLEADO;
-- CREATE TRIGGER INSERTA_EMPLEADO after insert on empleado
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(), 'empleado', 'INSERTAR', CONCAT(NEW.id_empleado, NEW.id_usuario, NEW.id_cargo, NEW.id_tipo_identificacion, NEW.id_salud, NEW.id_pension, NEW.id_caja_de_compensacion, NEW.id_ciudad, NEW.nombre, NEW.documento, NEW.telefono, NEW.celular, NEW.direccion, NEW.correo, NEW.arl));

-- DROP TRIGGER IF EXISTS MODIFICA_EMPLEADO;
-- CREATE TRIGGER MODIFICA_EMPLEADO after UPDATE on empleado
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(), 'empleado', 'MODIFICAR', CONCAT('Antiguo: ', OLD.id_empleado, OLD.id_cargo, OLD.id_tipo_identificacion, OLD.id_salud, OLD.id_pension, OLD.id_caja_de_compensacion, OLD.id_ciudad, OLD.nombre, OLD.documento, OLD.celular, OLD.direccion, OLD.arl, 'Nuevo: ', NEW.id_empleado, NEW.id_cargo, NEW.id_tipo_identificacion, NEW.id_salud, NEW.id_pension, NEW.id_caja_de_compensacion, NEW.id_ciudad, NEW.nombre, NEW.documento, NEW.celular, NEW.direccion, NEW.arl));

-- DROP TRIGGER IF EXISTS ELIMINA_EMPLEADO;
-- CREATE TRIGGER ELIMINA_EMPLEADO after DELETE on empleado
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(), 'empleado', 'ELIMINAR', CONCAT(OLD.id_empleado, OLD.id_cargo, OLD.id_tipo_identificacion, OLD.id_salud, OLD.id_pension, OLD.id_caja_de_compensacion, OLD.id_ciudad, OLD.nombre, OLD.documento, OLD.celular, OLD.direccion, OLD.arl));


-- /*TRIGGER MATERIAL*/
-- DROP TRIGGER IF EXISTS INSERTA_MATERIAL;
-- CREATE TRIGGER INSERTA_MATERIAL after insert on material
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES(CURRENT_DATE, CURRENT_TIME, CURRENT_USER, 'material', 'INSERTAR', CONTAT(NEW.id_material, NEW.id_categoria, NEW.id_tipo_uni_medida, NEW.codigo_material, NEW.nombre_material, NEW.precio_unitario, NEW.cantidad_total));

-- DROP TRIGGER IF EXISTS MODIFICA_MATERIAL;
-- CREATE TRIGGER MODIFICA_MATERIAL after UPDATE on material
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(), 'material', 'MODIFICAR', CONCAT('ANTIGUO: ', OLD.id_material, OLD.id_categoria, OLD.id_tipo_uni_medida, OLD.codigo_material, OLD.nombre_material, OLD.precio_unitario, OLD.cantidad_total, ' NUEVO: ', NEW.id_material, NEW.id_categoria, NEW.id_tipo_uni_medida, NEW.codigo_material, NEW.nombre_material, NEW.precio_unitario, NEW.cantidad_total));

-- /*TRIGGER PENSION*/
-- DROP TRIGGER IF EXISTS INSERTA_PENSION;
-- CREATE TRIGGER INSERTA_PENSION after insert on pension
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(), 'pension', 'INSERTAR', CONCAT(NEW.id_pension, NEW.nombre_pension));

-- DROP TRIGGER IF EXISTS MODIFICA_PENSION;
-- CREATE TRIGGER MODIFICA_PENSION after UPDATE on pension
-- FOR EACH ROW
-- INSERT INTO AUDITORIA (fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(),'pension','MODIFICAR',
-- CONCAT('Antiguo: ',OLD.id_pension, OLD.nombre_pension, ' -> Nuevo: ', NEW.id_pension, NEW.nombre_pension));

-- DROP TRIGGER IF EXISTS ELIMINA_PENSION;
-- CREATE TRIGGER ELIMINA_PENSION after DELETE on pension
-- FOR EACH ROW
-- INSERT INTO AUDITORIA (fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(),'pension','ELIMINAR', CONCAT(OLD.id_pension, OLD.nombre_pension));


-- /*TRIGGER SALUD*/
-- DROP TRIGGER IF EXISTS INSERTA_SALUD;
-- CREATE TRIGGER INSERTA_SALUD after insert on salud
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(), 'salud', 'INSERTAR', CONCAT(NEW.id_salud, NEW.tipo_salud));

-- DROP TRIGGER IF EXISTS MODIFICA_SALUD;
-- CREATE TRIGGER MODIFICA_SALUD after UPDATE on salud
-- FOR EACH ROW
-- INSERT INTO AUDITORIA (fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(),'salud','MODIFICAR',
-- CONCAT('Antiguo: ',OLD.id_salud, OLD.tipo_salud, ' -> Nuevo: ', NEW.id_salud, NEW.tipo_salud));

-- DROP TRIGGER IF EXISTS ELIMINA_SALUD;
-- CREATE TRIGGER ELIMINA_SALUD after DELETE on salud
-- FOR EACH ROW
-- INSERT INTO AUDITORIA (fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(),'salud','ELIMINAR',
-- CONCAT(OLD.id_salud, OLD.tipo_salud));


-- /*TRIGGER CAJA COMPENSACION*/
-- DROP TRIGGER IF EXISTS INSERTA_CAJA_COM;
-- CREATE TRIGGER INSERTA_CAJA_COM after insert on caja_de_compensacion
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(), 'cajaCompen', 'INSERTAR', CONCAT(NEW.id_caja_de_compensacion, NEW.nombre_caja_de_compensacion));

-- DROP TRIGGER IF EXISTS MODIFICA_CAJA_COM;
-- CREATE TRIGGER MODIFICA_CAJA_COM after UPDATE on caja_de_compensacion
-- FOR EACH ROW
-- INSERT INTO AUDITORIA (fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(),'cajaCompen','MODIFICAR',
-- CONCAT('Antiguo: ',OLD.id_caja_de_compensacion, OLD.nombre_caja_de_compensacion, ' -> Nuevo: ', NEW.id_caja_de_compensacion, NEW.nombre_caja_de_compensacion));

-- DROP TRIGGER IF EXISTS ELIMINA_CAJA_COM;
-- CREATE TRIGGER ELIMINA_CAJA_COM after DELETE on caja_de_compensacion
-- FOR EACH ROW
-- INSERT INTO AUDITORIA (fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(),'cajaCompen','ELIMINAR',
-- CONCAT(OLD.id_caja_de_compensacion, OLD.nombre_caja_de_compensacion));


-- /*TRIGGER PROVEEDOR*/
-- DROP TRIGGER IF EXISTS INSERTA_PROVEEDOR;
-- CREATE TRIGGER INSERTA_PROVEEDOR after insert on proveedor
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(), 'proveedor', 'INSERTAR', CONCAT(NEW.id_proveedor, NEW.id_tipo_identificacion, NEW.id_ciudad, NEW.nombre, NEW.identificacion, NEW.telefono));

-- DROP TRIGGER IF EXISTS MODIFICA_PROVEEDOR;
-- CREATE TRIGGER MODIFICA_PROVEEDOR after UPDATE on proveedor
-- FOR EACH ROW
-- INSERT INTO AUDITORIA (fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(),'proveedor','MODIFICAR',
-- CONCAT('Antiguo: ',OLD.id_proveedor, OLD.id_tipo_identificacion, OLD.id_ciudad, OLD.nombre, OLD.identificacion, OLD.telefono, OLD.celular, OLD.direccion, OLD.correo, ' -> Nuevo: ', NEW.id_proveedor, NEW.telefono, NEW.celular, NEW.direccion, NEW.correo));

-- DROP TRIGGER IF EXISTS ELIMINA_PROVEEDOR;
-- CREATE TRIGGER ELIMINA_PROVEEDOR after DELETE on proveedor
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(), 'proveedor', 'ELIMINAR', CONCAT(OLD.id_proveedor, OLD.id_tipo_identificacion, OLD.id_ciudad, OLD.nombre, OLD.identificacion, OLD.direccion, OLD.telefono, OLD.celular, OLD.correo));


-- /*TRIGGER PROYECTO*/
-- DROP TRIGGER IF EXISTS INSERTA_PROYECTO;
-- CREATE TRIGGER INSERTA_PROYECTO after insert on proyecto
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(), 'proyecto', 'INSERTAR', CONCAT(NEW.id_proyecto, NEW.id_cotizacion, NEW.id_estado, NEW.nombre_proyecto, NEW.codigo_proyecto, NEW.descripcion_proyecto, NEW.valor_anticipado, NEW.valor_total_proyecto));

-- DROP TRIGGER IF EXISTS MODIFICA_PROYECTO;
-- CREATE TRIGGER MODIFICA_PROYECTO after UPDATE on proyecto
-- FOR EACH ROW
-- INSERT INTO AUDITORIA (fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(),'proyecto','MODIFICAR',
-- CONCAT('Antiguo: ',OLD.id_proyecto, OLD.id_cotizacion, OLD.id_estado, OLD.nombre_proyecto, OLD.codigo_proyecto, OLD.descripcion_proyecto, OLD.valor_anticipado, OLD.valor_total_proyecto, ' -> Nuevo: ', NEW.id_proyecto, NEW.id_cotizacion, NEW.id_estado, NEW.nombre_proyecto, NEW.codigo_proyecto, NEW.descripcion_proyecto, NEW.valor_anticipado, NEW.valor_total_proyecto));

-- DROP TRIGGER IF EXISTS ELIMINA_PROYECTO;
-- CREATE TRIGGER ELIMINA_PROYECTO after DELETE on proyecto
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(), 'proyecto', 'ELIMINAR', CONCAT(OLD.id_proyecto, OLD.id_cotizacion, OLD.id_estado, OLD.nombre_proyecto, OLD.codigo_proyecto, OLD.descripcion_proyecto, OLD.valor_anticipado, OLD.valor_total_proyecto));


-- /*TRIGGER USUARIO*/
-- DROP TRIGGER IF EXISTS INSERTA_USUARIO;
-- CREATE TRIGGER INSERTA_USUARIO after insert on usuario
-- FOR EACH ROW
-- INSERT INTO AUDITORIA (fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(),'usuario','INSERTAR',
-- CONCAT(NEW.id_usuario, NEW.tipo_roll, NEW.nombre_usuario));

-- DROP TRIGGER IF EXISTS MODIFICA_USUARIO;
-- CREATE TRIGGER MODIFICA_USUARIO after UPDATE on usuario
-- FOR EACH ROW
-- INSERT INTO AUDITORIA (fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(),'usuario','MODIFICAR',
-- CONCAT('Antiguo: ',OLD.id_usuario, OLD.tipo_roll, OLD.nombre_usuario, ' -> Nuevo: ', NEW.id_usuario, NEW.tipo_roll, NEW.nombre_usuario));

-- DROP TRIGGER IF EXISTS ELIMINA_USUARIO;
-- CREATE TRIGGER ELIMINA_USUARIO after DELETE on usuario
-- FOR EACH ROW
-- INSERT INTO AUDITORIA (fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(),'usuario','ELIMINAR',
-- CONCAT('Antiguo: ',OLD.id_usuario, OLD.tipo_roll, OLD.nombre_usuario));


-- /*TRIGGER ROLL*/
-- DROP TRIGGER IF EXISTS INSERTA_ROL;
-- CREATE TRIGGER INSERTA_ROL after insert on roll
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(), 'rol', 'INSERTAR', CONCAT(NEW.tipo_roll));

-- DROP TRIGGER IF EXISTS MODIFICA_ROL;
-- CREATE TRIGGER MODIFICA_ROL after UPDATE on roll
-- FOR EACH ROW
-- INSERT INTO AUDITORIA (fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(),'rol','MODIFICAR',
-- CONCAT('Antiguo: ', OLD.tipo_roll, 'Nuevo', NEW.tipo_roll));

-- DROP TRIGGER IF EXISTS ELIMINA_ROL;
-- CREATE TRIGGER ELIMINA_ROL after DELETE on roll
-- FOR EACH ROW
-- INSERT INTO AUDITORIA(fecha, hora, usuario, tabla, operacion, resumen)
-- VALUES (CURRENT_DATE(),CURRENT_TIME(),CURRENT_USER(), 'rol', 'ELIMINAR', CONCAT(OLD.tipo_roll));*

/*
DROP TABLE `adquisicion`,
`caja_de_compensacion`,
`cargo`, `categoria`,
`ciudad`, `cliente`,
`cotizacion`,
`cotizacion_has_material`,
`empleado`,
`empleado_has_proyecto`,
`estado`,
`material`,
`material_has_adquisicion`,
`pais`, `pension`, `proveedor`,
`proveedor_has_material`,
`proyecto`,
`roll`, `salud`,
`tipo_identificacion`,
`tipo_uni_medida`,
`ubicacion`, `usuario`;

*/
