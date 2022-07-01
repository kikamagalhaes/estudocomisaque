-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: db_atividade
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cnpj_cpf` varchar(16) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `tipo_cliente` varchar(2) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Larissa','1111111','Rua Primavera','PF'),(2,'Oziel','2222222','Rua Três','PJ'),(3,'Fernanda','333333','Rua B','PF'),(4,'Larissa','1111111','Rua Primavera','PF'),(5,'Oziel','2222222','Rua Três','PJ'),(6,'Fernanda','333333','Rua B','PF');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribuidor`
--

DROP TABLE IF EXISTS `distribuidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distribuidor` (
  `id_distribuidor` int NOT NULL AUTO_INCREMENT,
  `telefone` varchar(11) NOT NULL,
  `razao_social` varchar(100) NOT NULL,
  PRIMARY KEY (`id_distribuidor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribuidor`
--

LOCK TABLES `distribuidor` WRITE;
/*!40000 ALTER TABLE `distribuidor` DISABLE KEYS */;
INSERT INTO `distribuidor` VALUES (1,'777777','Distribuidora A'),(2,'777777','Distribuidora A'),(3,'88888','Distribuidora B'),(4,'999999','Distribuidora C'),(5,'999999','Distribuidora C');
/*!40000 ALTER TABLE `distribuidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento`
--

DROP TABLE IF EXISTS `forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pagamento` (
  `id_forma_pagamento` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id_forma_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,'PIX'),(2,'BOLETO'),(3,'DEBITO');
/*!40000 ALTER TABLE `forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_venda`
--

DROP TABLE IF EXISTS `item_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_venda` (
  `quantidade` int NOT NULL,
  `numero_nf` int NOT NULL,
  `venda_id` int NOT NULL,
  `produto_id` int NOT NULL,
  KEY `venda_id` (`venda_id`),
  KEY `produto_id` (`produto_id`),
  CONSTRAINT `item_venda_ibfk_1` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`id_venda`),
  CONSTRAINT `item_venda_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda`
--

LOCK TABLES `item_venda` WRITE;
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
INSERT INTO `item_venda` VALUES (896,111111,1,1),(1526,22222,2,2),(89689,333333,3,3);
/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `preco_venda` double NOT NULL,
  `data_validade` date NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `distribuidor_id` int NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `distribuidor_id` (`distribuidor_id`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`distribuidor_id`) REFERENCES `distribuidor` (`id_distribuidor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,25.96,'2022-02-02','Produto A',1),(2,8963.63,'2023-05-05','Produto C',3),(3,896.63,'2021-02-05','Produto B',2);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  `hora` timestamp NOT NULL,
  `total` int NOT NULL,
  `cliente_id` int NOT NULL,
  `forma_pagamento_id` int NOT NULL,
  PRIMARY KEY (`id_venda`),
  KEY `cliente_id` (`cliente_id`),
  KEY `forma_pagamento_id` (`forma_pagamento_id`),
  CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`forma_pagamento_id`) REFERENCES `forma_pagamento` (`id_forma_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,'Venda 1','2022-06-09 00:50:12',90,1,1),(2,'Venda 2','2022-06-09 00:50:29',70,2,2),(3,'Venda 3','2022-01-01 03:00:01',891,3,3);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-08 21:57:11
