-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Notas_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Notas_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Notas_db` DEFAULT CHARACTER SET utf8 ;
USE `Notas_db` ;

-- -----------------------------------------------------
-- Table `Notas_db`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Notas_db`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `mail` VARCHAR(32) NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Notas_db`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Notas_db`.`notas` (
  `id_nota` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `descripcion` NVARCHAR(250) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NULL,
  `deleted_at` DATETIME NULL,
  `delete` TINYINT NOT NULL,
  `usuarios_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_nota`),
  INDEX `fk_notas_usuarios1_idx` (`usuarios_id_usuario` ASC) ,
  CONSTRAINT `fk_notas_usuarios1`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `Notas_db`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Notas_db`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Notas_db`.`categorias` (
  `id_categoria` INT NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_categoria`));


-- -----------------------------------------------------
-- Table `Notas_db`.`categorias_notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Notas_db`.`categorias_notas` (
  `cat_nota_id` INT NOT NULL AUTO_INCREMENT,
  `notas_id_nota` INT NOT NULL,
  `categorias_id_categoria` INT NOT NULL,
  PRIMARY KEY (`cat_nota_id`, `notas_id_nota`, `categorias_id_categoria`),
  INDEX `fk_categorias_notas_notas1_idx` (`notas_id_nota` ASC) ,
  INDEX `fk_categorias_notas_categorias1_idx` (`categorias_id_categoria` ASC) ,
  CONSTRAINT `fk_categorias_notas_notas1`
    FOREIGN KEY (`notas_id_nota`)
    REFERENCES `Notas_db`.`notas` (`id_nota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categorias_notas_categorias1`
    FOREIGN KEY (`categorias_id_categoria`)
    REFERENCES `Notas_db`.`categorias` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: notas_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'deportes'),(2,'programacion'),(3,'literatura'),(4,'economia'),(5,'programacion'),(6,'literatura'),(7,'deportes'),(8,'literatura'),(9,'literatura'),(10,'musica');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categorias_notas`
--

LOCK TABLES `categorias_notas` WRITE;
/*!40000 ALTER TABLE `categorias_notas` DISABLE KEYS */;
INSERT INTO `categorias_notas` VALUES (1,5,2),(2,3,5),(3,3,5),(4,2,3),(5,3,7),(6,1,5),(7,3,6),(8,3,8),(9,3,1),(10,3,4);
/*!40000 ALTER TABLE `categorias_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,'Title 1','facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at','0000-00-00 00:00:00',NULL,NULL,0,2),(2,'Title 2','interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue','0000-00-00 00:00:00',NULL,NULL,0,3),(3,'Title 3','cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet','0000-00-00 00:00:00',NULL,NULL,0,4),(4,'Title 4','ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque','0000-00-00 00:00:00',NULL,NULL,0,2),(5,'Title 5','aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac','0000-00-00 00:00:00',NULL,NULL,0,1),(6,'Title 6','nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie','0000-00-00 00:00:00',NULL,NULL,0,3),(7,'Title 7','Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy','0000-00-00 00:00:00',NULL,NULL,0,1),(8,'Title 8','sagittis semper. Nam tempor diam dictum sapien. Aenean massa.','0000-00-00 00:00:00',NULL,NULL,0,10),(9,'Title 9','nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in','0000-00-00 00:00:00',NULL,NULL,0,8),(10,'Title 10','Duis sit amet diam eu','0000-00-00 00:00:00',NULL,NULL,0,8);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Rowan Finch','sit.amet@aliquamnisl.co.uk','2021-10-12 15:45:34'),(2,'Acton Parrish','parturient.montes@duinectempus.c','2021-10-12 15:45:34'),(3,'Melodie Sherman','malesuada.malesuada.integer@faci','2021-10-12 15:45:34'),(4,'August Vaughn','mi.ac@sedpede.net','2021-10-12 15:45:34'),(5,'Ciara Schneider','porta.elit@malesuadafringilla.ca','2021-10-12 15:45:34'),(6,'Nasim Bonner','ultricies.sem@maecenasmi.com','2021-10-12 15:45:34'),(7,'Amaya Manning','egestas@vitaealiquameros.org','2021-10-12 15:45:34'),(8,'Cheryl Sexton','at.fringilla@proinultricesduis.o','2021-10-12 15:45:34'),(9,'Gwendolyn Kerr','tincidunt.aliquam.arcu@risusa.ne','2021-10-12 15:45:34'),(10,'Yvette Shaffer','felis@convalliserateget.edu','2021-10-12 15:45:34');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-12 16:28:11
