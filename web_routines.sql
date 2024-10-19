CREATE DATABASE  IF NOT EXISTS `web` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `web`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: web
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `nacimiento_1976`
--

DROP TABLE IF EXISTS `nacimiento_1976`;
/*!50001 DROP VIEW IF EXISTS `nacimiento_1976`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nacimiento_1976` AS SELECT 
 1 AS `IDEMPLEADO`,
 1 AS `NOMBRE`,
 1 AS `APELLIDOS`,
 1 AS `Sexo`,
 1 AS `MUNICIPIO`,
 1 AS `FECHA_NAC`,
 1 AS `SUELDO`,
 1 AS `IDPTO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!50001 DROP VIEW IF EXISTS `municipio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `municipio` AS SELECT 
 1 AS `IDEMPLEADO`,
 1 AS `NOMBRE`,
 1 AS `APELLIDOS`,
 1 AS `Sexo`,
 1 AS `MUNICIPIO`,
 1 AS `FECHA_NAC`,
 1 AS `SUELDO`,
 1 AS `IDPTO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sueldo_normal`
--

DROP TABLE IF EXISTS `sueldo_normal`;
/*!50001 DROP VIEW IF EXISTS `sueldo_normal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sueldo_normal` AS SELECT 
 1 AS `IDEMPLEADO`,
 1 AS `NOMBRE`,
 1 AS `APELLIDOS`,
 1 AS `Sexo`,
 1 AS `MUNICIPIO`,
 1 AS `FECHA_NAC`,
 1 AS `SUELDO`,
 1 AS `IDPTO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `empleado_10480`
--

DROP TABLE IF EXISTS `empleado_10480`;
/*!50001 DROP VIEW IF EXISTS `empleado_10480`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empleado_10480` AS SELECT 
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `nacimiento_1976`
--

/*!50001 DROP VIEW IF EXISTS `nacimiento_1976`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nacimiento_1976` AS select `empleados`.`IDEMPLEADO` AS `IDEMPLEADO`,`empleados`.`NOMBRE` AS `NOMBRE`,`empleados`.`APELLIDOS` AS `APELLIDOS`,`empleados`.`Sexo` AS `Sexo`,`empleados`.`MUNICIPIO` AS `MUNICIPIO`,`empleados`.`FECHA_NAC` AS `FECHA_NAC`,`empleados`.`SUELDO` AS `SUELDO`,`empleados`.`IDPTO` AS `IDPTO` from `empleados` where (year(`empleados`.`FECHA_NAC`) > '1976') order by `empleados`.`FECHA_NAC` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `municipio`
--

/*!50001 DROP VIEW IF EXISTS `municipio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `municipio` AS select `empleados`.`IDEMPLEADO` AS `IDEMPLEADO`,`empleados`.`NOMBRE` AS `NOMBRE`,`empleados`.`APELLIDOS` AS `APELLIDOS`,`empleados`.`Sexo` AS `Sexo`,`empleados`.`MUNICIPIO` AS `MUNICIPIO`,`empleados`.`FECHA_NAC` AS `FECHA_NAC`,`empleados`.`SUELDO` AS `SUELDO`,`empleados`.`IDPTO` AS `IDPTO` from `empleados` where (`empleados`.`MUNICIPIO` in ('Madrid','Córdoba')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sueldo_normal`
--

/*!50001 DROP VIEW IF EXISTS `sueldo_normal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sueldo_normal` AS select `empleados`.`IDEMPLEADO` AS `IDEMPLEADO`,`empleados`.`NOMBRE` AS `NOMBRE`,`empleados`.`APELLIDOS` AS `APELLIDOS`,`empleados`.`Sexo` AS `Sexo`,`empleados`.`MUNICIPIO` AS `MUNICIPIO`,`empleados`.`FECHA_NAC` AS `FECHA_NAC`,`empleados`.`SUELDO` AS `SUELDO`,`empleados`.`IDPTO` AS `IDPTO` from `empleados` where ((`empleados`.`SUELDO` > 1300) and (`empleados`.`SUELDO` < 1550)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `empleado_10480`
--

/*!50001 DROP VIEW IF EXISTS `empleado_10480`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empleado_10480` AS select `proyectos`.`NOMBRE` AS `nombre` from `proyectos` where (`proyectos`.`IDPROYECTO` = (select `asignacion`.`IDPROYECTO` from `asignacion` where (`asignacion`.`IDEMPLEADO` = '10480'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-19 17:24:29
