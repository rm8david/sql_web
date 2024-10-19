 
 -- SENTENCIAS DDL

-- Con autocommit = 0 hacemos que no se hagan permanentes las transacciones 
-- hasta que ejecutamos  La línea que dice COMMIT;
SET autocommit = 0;
START TRANSACTION;
CREATE DATABASE if not exists web;
USE web;
CREATE TABLE if not exists empleados(
IDEMPLEADO int NOT NULL,
NOMBRE varchar(25),
APELLIDOS varchar(25),
Sexo char(1),
MUNICIPIO varchar(50),
FECHA_NAC date,
SUELDO int,
IDPTO int
);
-- bulk insert
INSERT INTO empleados(`IDEMPLEADO`,`NOMBRE`,`APELLIDOS`,`Sexo`,`FECHA_NAC`,`SUELDO`,`MUNICIPIO`,`IDPTO`)
VALUES
(10478, 'Alberto', 'Pérez López', 'M', '1965-09-12', 1500, 'Madrid', 1),
(10479, 'Gloria', 'Ruiz Ruiz', 'F', '1968-06-12', 1650, 'Sevilla', 2),
(10480, 'Antonio', 'García Montero', 'M', '1969-10-12', 1350, 'Madrid', 1),
(10481, 'Ana', 'López Ramírez', 'F', '1970-05-12', 1250, 'Sevilla', 3),
(10482, 'Eduardo', 'Chicón Terrales', 'M', '1920-05-12', 1470, 'Córdoba', 2);

CREATE TABLE if not exists proyectos(
IDPROYECTO int NOT NULL,
NOMBRE varchar(25),
FECHA_INI date,
FECHA_FIN date
);

-- bulk insert
INSERT INTO proyectos(`IDPROYECTO`,`NOMBRE`,`FECHA_INI`,`FECHA_FIN`)
VALUES
(1, 'SINUBE','2018-09-12', '2019-09-12'),
(2, 'TRASPI', '2017-09-12', '2019-09-12'),
(3, 'RUNTA','2016-09-12', '2019-09-12'),
(4, 'CARTAL','2019-05-12', '2019-09-12');

CREATE TABLE if not exists departamentos(
IDPTO int NOT NULL,
NOMBRE varchar(25),
PRESUPUESTOS int
);

-- bulk insert
INSERT INTO departamentos(`IDPTO`,`NOMBRE`,`PRESUPUESTOS`)
VALUES
(1, 'I+D', 50000),
(2, 'Diseño', 25000),
(3, 'Ventas', 15000),
(4, 'Marketing', 10000);

CREATE TABLE if not exists asignacion(
IDEMPLEADO int,
IDPROYECTO int
);

-- bulk insert
INSERT INTO asignacion(`IDEMPLEADO`,`IDPROYECTO`)
VALUES
(10478,1),
(10480,3),
(10481,1),
(10482,2);

SET FOREIGN_KEY_CHECKS=0;

-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`IDEMPLEADO`),
  ADD KEY `NOMBRE` (`NOMBRE`),
  ADD KEY `APELLIDOS` (`APELLIDOS`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`IDPTO`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`IDPROYECTO`),
  ADD KEY `NOMBRE` (`NOMBRE`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`IDPTO`) REFERENCES `departamentos` (`IDPTO`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION;
  
  -- 
  -- Filtros para la tabla asignación
  -- 
  ALTER TABLE `asignacion`
  ADD CONSTRAINT `asignacion_ibfk_1` FOREIGN KEY (`IDEMPLEADO`) REFERENCES `empleados` (`IDEMPLEADO`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION;
   ALTER TABLE `asignacion`
  ADD CONSTRAINT `asignacion_ibfk_2` FOREIGN KEY (`IDPROYECTO`) REFERENCES `proyectos` (`IDPROYECTO`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION;
 
 SET FOREIGN_KEY_CHECKS=1;
-- Hasta aquí podemos escoger si COMMIT para confirmar todas las transacciones o ROLLBACK
-- ROLLBACK;
COMMIT;

START TRANSACTION;


-- consultas o sentencias DML


-- 1. Se pide que muestres todos los datos introducidos en las tablas
-- 

-- Vista tabla empleados:
CREATE VIEW  vista_empleados AS SELECT * FROM empleados;
-- Ya hemos creado la vista, para visualizar hacemos:
SELECT * FROM web.vista_empleados;

-- Vista tabla proyectos:
CREATE VIEW  vista_proyectos AS SELECT * FROM proyectos;
-- Ya hemos creado la vista, para visualizar hacemos:
SELECT * FROM web.vista_proyectos;

-- Vista tabla asignacion:
CREATE VIEW  vista_asignacion AS SELECT * FROM asignacion;
-- Ya hemos creado la vista, para visualizar hacemos:
SELECT * FROM web.vista_asignacion;

-- Vista tabla departamentos:
CREATE VIEW  vista_departamentos AS SELECT * FROM departamentos;
-- Ya hemos creado la vista, para visualizar hacemos:
SELECT * FROM web.vista_departamentos;

-- 2.Lista de proyectos que empiezan a partir de Marzo
-- 
CREATE VIEW proyectos_desde_marzo AS
SELECT proyectos.nombre, proyectos.fecha_ini 
AS 'Fecha de inicio del proyecto' FROM proyectos
WHERE MONTH(proyectos.fecha_ini) >=3; 

-- Comprobamos la vista "proyectos_desde_marzo"
SELECT * FROM web.proyectos_desde_marzo;

-- 3.Listado de los empleados que tengan el apellido López
CREATE VIEW apellido_lopez AS
SELECT * FROM empleados WHERE 
(empleados.apellidos LIKE'López%' OR empleados.apellidos LIKE '%López');

-- Comprobamos la vista "apellido_lopez"
SELECT * FROM web.apellido_lopez;

-- 4. Mostrar el nombre del proyecto que tiene asignado el empleado 10480
-- primero se ejecuta el select donde nos da el nombre del empleado
-- y de esa subselect seleccionamos el IDPROYECTO
CREATE VIEW empleado_10480 AS 
SELECT proyectos.nombre FROM proyectos WHERE
proyectos.IDPROYECTO=(SELECT asignacion.IDPROYECTO FROM asignacion WHERE
asignacion.IDEMPLEADO ='10480');

-- 6. Sacar un listado de los empleados que sean de Madrid o Córdoba
-- primera forma
SELECT * FROM empleados
 WHERE empleados.municipio like 'Madrid' OR empleados.municipio like 'Córdoba';
-- segunda forma y creamos vista
CREATE VIEW municipio AS SELECT * FROM empleados
 WHERE empleados.municipio IN ('Madrid', 'Córdoba');
SELECT * FROM web.municipio;

-- 7. Empleados con un sueldo entre 1300 y 1550 euros
CREATE VIEW sueldo_normal AS SELECT * FROM empleados WHERE 
empleados.sueldo >1300 AND empleados.sueldo <1550;
SELECT * FROM web.sueldo_normal;

-- 8. Empleados por fecha de nacimiento descendiente que hayan nacido desde 1976
-- No hay ninguno con ese año, pero hemos probado modificando la fecha y si que funciona
CREATE VIEW nacimiento_1976 AS SELECT * FROM empleados
 WHERE YEAR(FECHA_NAC) > '1976' ORDER BY FECHA_NAC DESC;
 SELECT * FROM web.nacimiento_1976;
 
 -- 9.Hay que sumar 5000 euros al presupuesto del dep. Marketing
 UPDATE departamentos SET PRESUPUESTOS = PRESUPUESTOS + 5000 
 WHERE departamentos.NOMBRE = 'MARKETING';
 
 
 -- 10. Cambiar de proyecto a: "Alberto Pérez López", se cambia a "RUNTA"
 -- En esta consulta hemos complicado un poco porque hemos cogido con un select
 -- el id empleado donde esta alberto perez lopez, despues hemos hecho otro select
 -- donde está el proyecto que tiene el nombre RUNTA
 -- para cambiar de proyecto al empleado.
 UPDATE asignacion SET IDPROYECTO = 
 (SELECT IDPROYECTO FROM proyectos WHERE proyectos.NOMBRE='RUNTA')
 WHERE IDEMPLEADO = (SELECT IDEMPLEADO FROM empleados
 WHERE NOMBRE = 'Alberto' AND APELLIDOS = 'Pérez López');
 
 -- 11.Quitar a "Antonio García Montero" de su proyecto asignado
 DELETE FROM asignacion WHERE IDEMPLEADO = 
 (SELECT IDEMPLEADO FROM empleados WHERE nombre = 'Antonio' AND apellidos = 'García Montero');
 
 -- 12. Empleados del departamento de diseño que ganen más de 1500 euros
 -- hemos utilizado un subselect para obtener el ID departamento de diseño
 CREATE VIEW dep_diseño_sueldo1500 AS 
 SELECT * FROM empleados WHERE
 IDPTO = (SELECT IDPTO FROM departamentos WHERE NOMBRE = 'Diseño')
 AND  SUELDO > 1500;
-- Seleccionamos la vista creada donde los de diseño ganan mas de 1500
SELECT * FROM web.dep_diseño_sueldo1500;

-- 13. Incrementar un 5% el sueldo de los de I+D que ganen menos de 1400
UPDATE empleados SET SUELDO = SUELDO * 1.05 
WHERE IDPTO =
(SELECT IDPTO FROM departamentos WHERE NOMBRE = 'I+D')
AND SUELDO < 1400;
-- Si queremos confirmar todas las consultas ejecutamos la linea COMMIT,
--  o ROLLBACK para restaurar las operaciones
-- ROLLBACK;
COMMIT;