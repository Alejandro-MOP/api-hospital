-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: gestion_citas
-- ------------------------------------------------------
-- Server version	5.7.33-log

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
-- Table structure for table `alergia`
--

DROP TABLE IF EXISTS `alergia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alergia` (
  `id_alergia` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_alergia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_alergia`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alergia`
--

LOCK TABLES `alergia` WRITE;
/*!40000 ALTER TABLE `alergia` DISABLE KEYS */;
INSERT INTO `alergia` VALUES (1,'anticonvulsivos'),(2,'insulina'),(3,'penicilina'),(4,'sulfamidas'),(5,'antibioticos'),(6,'ninguna');
/*!40000 ALTER TABLE `alergia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultorio`
--

DROP TABLE IF EXISTS `consultorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultorio` (
  `id_consultorio` bigint(20) NOT NULL AUTO_INCREMENT,
  `num_consultorio` varchar(255) DEFAULT NULL,
  `id_tipoconsultorio` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_consultorio`),
  KEY `FKpfnanqib90y0l6hedqasaqmep` (`id_tipoconsultorio`),
  CONSTRAINT `FKpfnanqib90y0l6hedqasaqmep` FOREIGN KEY (`id_tipoconsultorio`) REFERENCES `tipo_consultorio` (`id_tipoconsultorio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultorio`
--

LOCK TABLES `consultorio` WRITE;
/*!40000 ALTER TABLE `consultorio` DISABLE KEYS */;
INSERT INTO `consultorio` VALUES (1,'uno',1),(2,'dos',1),(3,'tres',1),(4,'cuatro',2),(5,'cinco',2);
/*!40000 ALTER TABLE `consultorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcita`
--

DROP TABLE IF EXISTS `dcita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcita` (
  `id_dcita` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cita` bigint(20) DEFAULT NULL,
  `id_consultorio` bigint(20) DEFAULT NULL,
  `id_medico` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_dcita`),
  KEY `FK25aj6s37kc4oef84vq45fideu` (`id_cita`),
  KEY `FKghv36rwi3072hmwfkje36ewpq` (`id_consultorio`),
  KEY `FK7lhc3t5uvih8w35rb321dcjrt` (`id_medico`),
  CONSTRAINT `FK25aj6s37kc4oef84vq45fideu` FOREIGN KEY (`id_cita`) REFERENCES `mcita` (`id_cita`),
  CONSTRAINT `FK7lhc3t5uvih8w35rb321dcjrt` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  CONSTRAINT `FKghv36rwi3072hmwfkje36ewpq` FOREIGN KEY (`id_consultorio`) REFERENCES `consultorio` (`id_consultorio`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcita`
--

LOCK TABLES `dcita` WRITE;
/*!40000 ALTER TABLE `dcita` DISABLE KEYS */;
INSERT INTO `dcita` VALUES (9,1,1,1),(10,4,1,1),(11,5,1,1),(12,6,1,1);
/*!40000 ALTER TABLE `dcita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` bigint(20) NOT NULL AUTO_INCREMENT,
  `alcaldia` varchar(255) DEFAULT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `colonia` varchar(255) DEFAULT NULL,
  `num_ext` varchar(255) DEFAULT NULL,
  `num_int` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'cuauhtemoc','calle','colonia','100','3'),(2,'Tecamayork','Navarra','Real del Cid','203','1'),(3,'Tecamayork','Navarra','Real del Cid','203','1'),(4,'Tecamayork','Navarra','Real del Cid','203','1'),(5,'Tecamayork','Navarra','Real del Cid','203','1'),(6,'Tecamayork','Navarra','Real del Cid','203','1'),(7,'Tecamayork','Navarra','Real del Cid','203','1'),(8,'Tecamayork','Navarra','Real del Cid','203','1'),(9,'Tecamayork','Navarra','Real del Cid','203','1');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eexpediente_clinico`
--

DROP TABLE IF EXISTS `eexpediente_clinico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eexpediente_clinico` (
  `mnss_paciente` bigint(20) DEFAULT NULL,
  `id_dcita` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FKitmwupcfqx78531o5c4s7wvm9` (`id_dcita`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eexpediente_clinico`
--

LOCK TABLES `eexpediente_clinico` WRITE;
/*!40000 ALTER TABLE `eexpediente_clinico` DISABLE KEYS */;
INSERT INTO `eexpediente_clinico` VALUES (1,8,1),(1,12,2);
/*!40000 ALTER TABLE `eexpediente_clinico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `id_especialidad` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_de_especialidad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,'cardiologia'),(2,'dermatologia'),(3,'ginecologia'),(4,'medicina general'),(5,'nefrologia'),(6,'neumologia'),(7,'oftafmologia'),(8,'ortopedia');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_civil`
--

DROP TABLE IF EXISTS `estado_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_civil` (
  `id_estado_civil` bigint(20) NOT NULL,
  `estado_civil` varchar(10) NOT NULL,
  PRIMARY KEY (`id_estado_civil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_civil`
--

LOCK TABLES `estado_civil` WRITE;
/*!40000 ALTER TABLE `estado_civil` DISABLE KEYS */;
INSERT INTO `estado_civil` VALUES (1,'soltero'),(2,'casado'),(3,'viudo'),(4,'divorciado');
/*!40000 ALTER TABLE `estado_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_clinico`
--

DROP TABLE IF EXISTS `expediente_clinico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expediente_clinico` (
  `id_expedienteclinico` bigint(20) NOT NULL AUTO_INCREMENT,
  `pregunta_1` varchar(255) DEFAULT NULL,
  `pregunta_2` varchar(255) DEFAULT NULL,
  `pregunta_3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_expedienteclinico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_clinico`
--

LOCK TABLES `expediente_clinico` WRITE;
/*!40000 ALTER TABLE `expediente_clinico` DISABLE KEYS */;
/*!40000 ALTER TABLE `expediente_clinico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fichadiagnostico`
--

DROP TABLE IF EXISTS `fichadiagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fichadiagnostico` (
  `id_fichadiagnostico` bigint(20) NOT NULL AUTO_INCREMENT,
  `nota` varchar(255) DEFAULT NULL,
  `id_tratamiento` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_fichadiagnostico`),
  KEY `FK1bral3li7d27drkeg5jhr1nmt` (`id_tratamiento`),
  CONSTRAINT `FK1bral3li7d27drkeg5jhr1nmt` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamiento` (`id_tratamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fichadiagnostico`
--

LOCK TABLES `fichadiagnostico` WRITE;
/*!40000 ALTER TABLE `fichadiagnostico` DISABLE KEYS */;
/*!40000 ALTER TABLE `fichadiagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_genero` bigint(20) NOT NULL AUTO_INCREMENT,
  `genero` varchar(1) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'f'),(2,'m');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario_dia`
--

DROP TABLE IF EXISTS `horario_dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario_dia` (
  `id_horariodia` bigint(20) NOT NULL AUTO_INCREMENT,
  `dia` date DEFAULT NULL,
  PRIMARY KEY (`id_horariodia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_dia`
--

LOCK TABLES `horario_dia` WRITE;
/*!40000 ALTER TABLE `horario_dia` DISABLE KEYS */;
INSERT INTO `horario_dia` VALUES (1,'0000-00-00');
/*!40000 ALTER TABLE `horario_dia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario_medico`
--

DROP TABLE IF EXISTS `horario_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario_medico` (
  `id_horariomedico` bigint(20) NOT NULL AUTO_INCREMENT,
  `hora_entrada` varchar(255) DEFAULT NULL,
  `hora_salida` varchar(255) DEFAULT NULL,
  `id_horariodia` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_horariomedico`),
  KEY `FK2bg92rg8ibdoc6ock585ilmh7` (`id_horariodia`),
  CONSTRAINT `FK2bg92rg8ibdoc6ock585ilmh7` FOREIGN KEY (`id_horariodia`) REFERENCES `horario_dia` (`id_horariodia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_medico`
--

LOCK TABLES `horario_medico` WRITE;
/*!40000 ALTER TABLE `horario_medico` DISABLE KEYS */;
INSERT INTO `horario_medico` VALUES (1,'09:00','19:00',1);
/*!40000 ALTER TABLE `horario_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcita`
--

DROP TABLE IF EXISTS `mcita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mcita` (
  `id_cita` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_cita` date DEFAULT NULL,
  `hora_cita` time DEFAULT NULL,
  PRIMARY KEY (`id_cita`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcita`
--

LOCK TABLES `mcita` WRITE;
/*!40000 ALTER TABLE `mcita` DISABLE KEYS */;
INSERT INTO `mcita` VALUES (1,'2021-08-26','09:00:00'),(2,'2021-08-26','09:10:00'),(3,'2021-08-26','09:10:00'),(4,'2021-08-26','09:10:00'),(5,'2021-08-26','09:10:00'),(6,'2021-08-26','09:10:00');
/*!40000 ALTER TABLE `mcita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `id_medico` bigint(20) NOT NULL AUTO_INCREMENT,
  `medico` varchar(255) DEFAULT NULL,
  `id_especialidad` bigint(20) DEFAULT NULL,
  `id_horariomedico` bigint(20) DEFAULT NULL,
  `id_personal` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_medico`),
  KEY `FKq27llf67jwglboxfkggn3wmhf` (`id_especialidad`),
  KEY `FK3ac1gl20w2yv2n36gsuoy83ut` (`id_horariomedico`),
  KEY `FK3mpnlhcftn6lhof6fbl8hjrk5` (`id_personal`),
  CONSTRAINT `FK3ac1gl20w2yv2n36gsuoy83ut` FOREIGN KEY (`id_horariomedico`) REFERENCES `horario_medico` (`id_horariomedico`),
  CONSTRAINT `FK3mpnlhcftn6lhof6fbl8hjrk5` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`),
  CONSTRAINT `FKq27llf67jwglboxfkggn3wmhf` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'Delio',1,1,1);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocupacion`
--

DROP TABLE IF EXISTS `ocupacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocupacion` (
  `id_ocupacion` bigint(20) NOT NULL AUTO_INCREMENT,
  `ocupacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_ocupacion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocupacion`
--

LOCK TABLES `ocupacion` WRITE;
/*!40000 ALTER TABLE `ocupacion` DISABLE KEYS */;
INSERT INTO `ocupacion` VALUES (1,'trabajador'),(2,'estudiante'),(3,'ama de casa'),(4,'nini');
/*!40000 ALTER TABLE `ocupacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `nss` bigint(20) NOT NULL,
  `curp` varchar(255) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `primer_apellido` varchar(255) DEFAULT NULL,
  `segundo_apellido` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `id_alergia` bigint(20) DEFAULT NULL,
  `id_direccion` bigint(20) DEFAULT NULL,
  `id_estado_civil` bigint(20) DEFAULT NULL,
  `id_genero` bigint(20) DEFAULT NULL,
  `id_ocupacion` bigint(20) DEFAULT NULL,
  `id_tipo_sangre` bigint(20) DEFAULT NULL,
  `mnss_paciente` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`nss`),
  KEY `FKc2v6w0amy2rjaj0xvucfra3v4` (`id_alergia`),
  KEY `FKjcxl8dimao5juma9a3wm1s7rh` (`id_direccion`),
  KEY `FKlvjl6brp07jfkj0leimvhal7j` (`id_estado_civil`),
  KEY `FK91kob0d6obrb5d01bujvu5ibt` (`id_genero`),
  KEY `FKr7fleulkgws67kq4sgc5f5q6u` (`id_ocupacion`),
  KEY `FKmjoykxhriig9ctk75se5oxmfk` (`id_tipo_sangre`),
  CONSTRAINT `FK91kob0d6obrb5d01bujvu5ibt` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`),
  CONSTRAINT `FKc2v6w0amy2rjaj0xvucfra3v4` FOREIGN KEY (`id_alergia`) REFERENCES `alergia` (`id_alergia`),
  CONSTRAINT `FKjcxl8dimao5juma9a3wm1s7rh` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`),
  CONSTRAINT `FKlvjl6brp07jfkj0leimvhal7j` FOREIGN KEY (`id_estado_civil`) REFERENCES `estado_civil` (`id_estado_civil`),
  CONSTRAINT `FKmjoykxhriig9ctk75se5oxmfk` FOREIGN KEY (`id_tipo_sangre`) REFERENCES `tipo_sangre` (`id_tiposangre`),
  CONSTRAINT `FKr7fleulkgws67kq4sgc5f5q6u` FOREIGN KEY (`id_ocupacion`) REFERENCES `ocupacion` (`id_ocupacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (123457890123,'MOPL3456789FGH','2021-08-23','1994-01-31','Alex','12345','Perez','Diaz','correo@correo.com',6,8,1,2,2,4,1);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `id_personal` bigint(20) NOT NULL,
  `nombre_personal` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `primer_apellido` varchar(255) DEFAULT NULL,
  `segundo_apellido` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `id_rol` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_personal`),
  KEY `FKqp5diw9rqqe82srffwawdfjim` (`id_rol`),
  CONSTRAINT `FKqp5diw9rqqe82srffwawdfjim` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Delio','12345','Gonzalez','Martinez','correo@correo.com',2);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` bigint(20) NOT NULL,
  `tipo_personal` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrativo'),(2,'Medico'),(3,'Intendencia');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_especialidad`
--

DROP TABLE IF EXISTS `solicitud_especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_especialidad` (
  `id_solicitudespecialidad` bigint(20) NOT NULL,
  `fecha_emision` varchar(255) DEFAULT NULL,
  `id_solicitud` int(11) DEFAULT NULL,
  `nota` varchar(255) DEFAULT NULL,
  `id_tratamiento` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_solicitudespecialidad`),
  KEY `FKrff3r7ceuh9q8ypdjtb67bhhk` (`id_tratamiento`),
  CONSTRAINT `FKrff3r7ceuh9q8ypdjtb67bhhk` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamiento` (`id_tratamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_especialidad`
--

LOCK TABLES `solicitud_especialidad` WRITE;
/*!40000 ALTER TABLE `solicitud_especialidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_consultorio`
--

DROP TABLE IF EXISTS `tipo_consultorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_consultorio` (
  `id_tipoconsultorio` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_consultorio` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipoconsultorio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_consultorio`
--

LOCK TABLES `tipo_consultorio` WRITE;
/*!40000 ALTER TABLE `tipo_consultorio` DISABLE KEYS */;
INSERT INTO `tipo_consultorio` VALUES (1,'general'),(2,'especialidad');
/*!40000 ALTER TABLE `tipo_consultorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_sangre`
--

DROP TABLE IF EXISTS `tipo_sangre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_sangre` (
  `id_tiposangre` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_sangre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tiposangre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_sangre`
--

LOCK TABLES `tipo_sangre` WRITE;
/*!40000 ALTER TABLE `tipo_sangre` DISABLE KEYS */;
INSERT INTO `tipo_sangre` VALUES (1,'O negativo'),(2,'O positivo'),(3,'A negativo'),(4,'A positivo'),(5,'B negativo'),(6,'B positivo'),(7,'AB positivo'),(8,'AB negativo');
/*!40000 ALTER TABLE `tipo_sangre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamiento`
--

DROP TABLE IF EXISTS `tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamiento` (
  `id_tratamiento` bigint(20) NOT NULL AUTO_INCREMENT,
  `tratamiento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tratamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento`
--

LOCK TABLES `tratamiento` WRITE;
/*!40000 ALTER TABLE `tratamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tratamiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-26 21:48:15
