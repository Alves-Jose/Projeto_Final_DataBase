CREATE DATABASE  IF NOT EXISTS `db_projeto_final` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_projeto_final`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: db_projeto_final
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `sobrenome` varchar(45) NOT NULL,
  `nacionalidade` varchar(25) NOT NULL,
  `qtd_livro_publicado` int NOT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'MARIA','FERREIRA','BRASILEIRA',2),(2,'JOSE','MARQUES','BRASILEIRO',6),(3,'JESUS','ALBERTO','JUDEU',32),(4,'THIAGO','MARQUES','AMERICANO',22),(5,'PEDRO','RODRIGUES','AFRICANO',5),(6,'MADALENA','GONZALES','MEXICANA',15),(7,'JOANA','TEOFILO','ARGENTINA',8),(8,'JOAQUIM','MENEZES','AUSTRALIANO',3),(9,'PAULO','ROBERTO','ITALIANO',4),(10,'FERNANDO','NORONHA','JAMAICANO',9);
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_atualiza_livros` AFTER INSERT ON `autor` FOR EACH ROW BEGIN
		DECLARE total_livro INT;
        SET total_livro = (SELECT COUNT(id_livro) FROM livro_autor WHERE id_autor =  NEW.id_autor);
        UPDATE autor SET total_livro = id_livro WHERE id_autor = NEW.id_autor;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'FANTASIA'),(2,'AUTOAJUDA'),(3,'ROMANCE'),(4,'COMéDIA'),(5,'DRAMA'),(6,'TERROR'),(7,'SUSPENSE'),(8,'AÇAO'),(9,'AVENTURA'),(10,'INFANTIL');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editora` (
  `id_editora` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_editora`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` VALUES (1,'SABADEIRA'),(2,'GLOBO'),(3,'RECORD'),(4,'BAND'),(5,'HBO'),(6,'FOX'),(7,'DC'),(8,'MARVEL'),(9,'UNIVERSAL'),(10,'REDE');
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `id_livro` int NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(30) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `ano_lancamento` year DEFAULT NULL,
  `id_categoria` int NOT NULL,
  `id_editora` int NOT NULL,
  PRIMARY KEY (`id_livro`),
  UNIQUE KEY `ISBN` (`ISBN`),
  KEY `fk_id_editora` (`id_editora`),
  KEY `fk_id_categoria` (`id_categoria`),
  CONSTRAINT `fk_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `fk_id_editora` FOREIGN KEY (`id_editora`) REFERENCES `editora` (`id_editora`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'123434','JOAOZINHO AMIGUINHO',1930,10,2),(2,'873653','A ARTE DE VIVER',2020,2,4),(3,'328283','SQL ASSUSTADOR',2022,8,6),(4,'373638','CAMINHOS DA INDIA',1999,3,1),(5,'327282','PEQUENO PRINCIPE',2008,1,3),(6,'276535','UM TIRA MUITO LOUCO',2016,5,5),(7,'112434','JORNADA NAS ESTRELA',1987,5,7),(8,'812213','MEU QUERIDO AMIGO JHON',1996,6,9),(9,'328228','VIVA A VIDA',2020,7,8),(10,'154434','O MUNDO DEPOIS DO CORONA',2022,9,10),(11,'383939','SQL DA MORTE',2022,10,2),(12,'834333','A ARTE DE SOFRER',2019,2,4),(13,'343483','SOFRER NO SQL',2021,8,6),(14,'398778','CARMA DO SQL',2008,3,1),(15,'332555','PEQUENO UNIVERSO',2008,1,3),(16,'298744','UM PEDACINHO DO CEU',2017,5,4),(17,'134334','JORNADA NAS GALAXIAS',1977,5,7),(18,'3426213','MEU QUERIDO AMIGO',1998,6,9),(19,'399228','VIVA A VIDA ADOIDADO',2005,7,8),(20,'166434','O MUNDO PAROU EM 2020',2022,9,10);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro_autor`
--

DROP TABLE IF EXISTS `livro_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro_autor` (
  `id_autor` int NOT NULL,
  `id_livro` int NOT NULL,
  PRIMARY KEY (`id_autor`,`id_livro`),
  KEY `fk_livro_id_livro` (`id_livro`),
  CONSTRAINT `fk_autor_id_autor` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`),
  CONSTRAINT `fk_livro_id_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro_autor`
--

LOCK TABLES `livro_autor` WRITE;
/*!40000 ALTER TABLE `livro_autor` DISABLE KEYS */;
INSERT INTO `livro_autor` VALUES (1,11),(1,12),(1,13),(1,14),(2,15),(2,16),(2,17),(4,18),(4,19),(4,20);
/*!40000 ALTER TABLE `livro_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_dados_autor`
--

DROP TABLE IF EXISTS `vw_dados_autor`;
/*!50001 DROP VIEW IF EXISTS `vw_dados_autor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_dados_autor` AS SELECT 
 1 AS `id_autor`,
 1 AS `Autor`,
 1 AS `nacionalidade`,
 1 AS `qtd_livro_publicado`,
 1 AS `Quantidade_livro`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_dados_categoria`
--

DROP TABLE IF EXISTS `vw_dados_categoria`;
/*!50001 DROP VIEW IF EXISTS `vw_dados_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_dados_categoria` AS SELECT 
 1 AS `id_categoria`,
 1 AS `Categoria`,
 1 AS `Quantidade`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_dados_livro`
--

DROP TABLE IF EXISTS `vw_dados_livro`;
/*!50001 DROP VIEW IF EXISTS `vw_dados_livro`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_dados_livro` AS SELECT 
 1 AS `id_livro`,
 1 AS `isbn`,
 1 AS `titulo`,
 1 AS `ano_lancamento`,
 1 AS `EDITORA`,
 1 AS `AUTOR`,
 1 AS `Categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_livro_editora`
--

DROP TABLE IF EXISTS `vw_livro_editora`;
/*!50001 DROP VIEW IF EXISTS `vw_livro_editora`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_livro_editora` AS SELECT 
 1 AS `id_editora`,
 1 AS `editora`,
 1 AS `qtd_livro_publicado`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db_projeto_final'
--

--
-- Dumping routines for database 'db_projeto_final'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_maiuscula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_maiuscula`(texto VARCHAR(200)) RETURNS varchar(200) CHARSET utf8mb4
    READS SQL DATA
BEGIN 
        SET texto = REPLACE(texto, 'a', 'A'),
            texto = REPLACE(texto, 'b', 'B'),
		    texto = REPLACE(texto, 'c', 'C'),
            texto = REPLACE(texto, 'd', 'D'),
			texto = REPLACE(texto, 'e', 'E'),
			texto = REPLACE(texto, 'f', 'F'),
			texto = REPLACE(texto, 'g', 'G'),
			texto = REPLACE(texto, 'h', 'H'),
			texto = REPLACE(texto, 'i', 'I'),
			texto = REPLACE(texto, 'j', 'J'),
            texto = REPLACE(texto, 'k', 'K'),
			texto = REPLACE(texto, 'l', 'L'),
			texto = REPLACE(texto, 'm', 'M'),
			texto = REPLACE(texto, 'n', 'N'),
			texto = REPLACE(texto, 'o', 'O'),
			texto = REPLACE(texto, 'p', 'P'),
			texto = REPLACE(texto, 'q', 'Q'),
			texto = REPLACE(texto, 'r', 'R'),
			texto = REPLACE(texto, 's', 'S'),
			texto = REPLACE(texto, 't', 'T'),
			texto = REPLACE(texto, 'u', 'U'),
			texto = REPLACE(texto, 'v', 'V'),
			texto = REPLACE(texto, 'w', 'W'),
			texto = REPLACE(texto, 'x', 'X'),
			texto = REPLACE(texto, 'y', 'Y'),
			texto = REPLACE(texto, 'z', 'Z'),
            texto = REPLACE(texto, 'ç', 'Ç');
RETURN texto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_autor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_autor`(n_autor VARCHAR (50), s_autor VARCHAR (50), 
								  nac_autor VARCHAR (25), t_livro INT)
BEGIN 
		INSERT INTO autor (nome, sobrenome,nacionalidade, qtd_livro_publicado)
		VALUES (fn_maiuscula(n_autor),fn_maiuscula(s_autor),fn_maiuscula(nac_autor), t_livro);
        
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_categoria`(n_categoria VARCHAR(45))
BEGIN 

    INSERT INTO categoria (nome) VALUE (fn_maiuscula (n_categoria));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_editora` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_editora`(n_editora VARCHAR(45))
BEGIN 

    INSERT INTO editora (nome) VALUE (fn_maiuscula (n_editora));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_livro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_livro`(n_livro VARCHAR(45), isbn_livro VARCHAR (30), 
								a_livro YEAR , cod_editora INT, cod_categoria INT)
BEGIN 

    INSERT INTO livro (titulo,isbn, ano_lancamento, id_editora, id_categoria)
    VALUES (fn_maiuscula(n_livro), isbn_livro, a_livro, cod_editora, cod_categoria) ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_dados_autor`
--

/*!50001 DROP VIEW IF EXISTS `vw_dados_autor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dados_autor` AS select `a`.`id_autor` AS `id_autor`,concat(`a`.`nome`,' ',`a`.`sobrenome`) AS `Autor`,`a`.`nacionalidade` AS `nacionalidade`,`a`.`qtd_livro_publicado` AS `qtd_livro_publicado`,sum(`l`.`id_livro`) AS `Quantidade_livro` from (`autor` `a` join `livro` `l` on((`a`.`id_autor` = `l`.`id_livro`))) group by `l`.`id_livro` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_dados_categoria`
--

/*!50001 DROP VIEW IF EXISTS `vw_dados_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dados_categoria` AS select `c`.`id_categoria` AS `id_categoria`,`c`.`nome` AS `Categoria`,sum(`l`.`id_livro`) AS `Quantidade` from (`categoria` `c` join `livro` `l` on((`c`.`id_categoria` = `l`.`id_livro`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_dados_livro`
--

/*!50001 DROP VIEW IF EXISTS `vw_dados_livro`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dados_livro` AS select `l`.`id_livro` AS `id_livro`,`l`.`ISBN` AS `isbn`,`l`.`titulo` AS `titulo`,`l`.`ano_lancamento` AS `ano_lancamento`,`e`.`nome` AS `EDITORA`,concat(`a`.`nome`,' ',`a`.`sobrenome`) AS `AUTOR`,`c`.`id_categoria` AS `Categoria` from (((`livro` `l` join `editora` `e` on((`l`.`id_livro` = `e`.`id_editora`))) join `autor` `a` on((`l`.`id_livro` = `a`.`id_autor`))) join `categoria` `c` on((`l`.`id_livro` = `c`.`id_categoria`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_livro_editora`
--

/*!50001 DROP VIEW IF EXISTS `vw_livro_editora`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_livro_editora` AS select `e`.`id_editora` AS `id_editora`,`e`.`nome` AS `editora`,`a`.`qtd_livro_publicado` AS `qtd_livro_publicado` from (`editora` `e` join `autor` `a` on((`e`.`id_editora` = `a`.`id_autor`))) */;
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

-- Dump completed on 2022-08-29 11:07:42
