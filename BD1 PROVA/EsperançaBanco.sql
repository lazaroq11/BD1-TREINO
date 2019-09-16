-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: teste
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `afastamento`
--

DROP TABLE IF EXISTS `afastamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `afastamento` (
  `id_afastamento` int(11) NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_termino` date DEFAULT NULL,
  `motivo` int(11) DEFAULT NULL,
  `empregado_afastamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_afastamento`),
  KEY `idmotivo_afastamento_idx` (`motivo`),
  KEY `empregado_afastamenti_idx` (`empregado_afastamento`),
  CONSTRAINT `empregado_afastamenti` FOREIGN KEY (`empregado_afastamento`) REFERENCES `empregado` (`cpf`),
  CONSTRAINT `idmotivo_afastamento` FOREIGN KEY (`motivo`) REFERENCES `motivo_afastamento` (`idmotivo_afastamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afastamento`
--

LOCK TABLES `afastamento` WRITE;
/*!40000 ALTER TABLE `afastamento` DISABLE KEYS */;
INSERT INTO `afastamento` VALUES (1,'2019-02-03','2022-02-03',1,12345),(2,'2019-02-03','2022-02-03',2,234234),(3,'2019-02-03','2022-02-03',1,243267),(4,'2019-02-03','2022-02-03',2,652412);
/*!40000 ALTER TABLE `afastamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bairro`
--

DROP TABLE IF EXISTS `bairro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bairro` (
  `cod_bairro` int(11) NOT NULL,
  `cod_cidade` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_bairro`),
  KEY `cod_cidade_idx` (`cod_cidade`),
  CONSTRAINT `cod_cidade` FOREIGN KEY (`cod_cidade`) REFERENCES `cidade` (`cod_cidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairro`
--

LOCK TABLES `bairro` WRITE;
/*!40000 ALTER TABLE `bairro` DISABLE KEYS */;
INSERT INTO `bairro` VALUES (1,1,'Cosme de Farias');
/*!40000 ALTER TABLE `bairro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `cod_cidade` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_cidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'Salvador');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cor`
--

DROP TABLE IF EXISTS `cor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cor` (
  `cod_cor` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_cor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cor`
--

LOCK TABLES `cor` WRITE;
/*!40000 ALTER TABLE `cor` DISABLE KEYS */;
INSERT INTO `cor` VALUES (1,'cod 1'),(2,'cod 2'),(3,'cor 3'),(4,'cor 4');
/*!40000 ALTER TABLE `cor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empregado`
--

DROP TABLE IF EXISTS `empregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empregado` (
  `cpf` int(11) NOT NULL,
  `data_nascimento` date NOT NULL,
  `nis` varchar(45) NOT NULL,
  `cor` int(11) NOT NULL,
  `escolaridade` int(11) NOT NULL,
  `carteira_trabalho` varchar(45) NOT NULL,
  `data_admissao` date NOT NULL,
  `salario` float NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `empregador_empregado` int(11) NOT NULL,
  `data_demissao` date NOT NULL,
  PRIMARY KEY (`cpf`),
  KEY `empregador_idx` (`empregador_empregado`,`cpf`),
  KEY `cod_cor_idx` (`cor`),
  KEY `cod_escolaridade_idx` (`escolaridade`),
  CONSTRAINT `cod_cor` FOREIGN KEY (`cor`) REFERENCES `cor` (`cod_cor`),
  CONSTRAINT `cod_escolaridade` FOREIGN KEY (`escolaridade`) REFERENCES `escolaridade` (`cod_escolaridade`),
  CONSTRAINT `cpf_empregador` FOREIGN KEY (`empregador_empregado`) REFERENCES `empregador` (`cpf_empregador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empregado`
--

LOCK TABLES `empregado` WRITE;
/*!40000 ALTER TABLE `empregado` DISABLE KEYS */;
INSERT INTO `empregado` VALUES (12345,'2010-02-03','nis1',1,1,'Desenpregado','2017-02-02',200.12,'2333333','asdgahdg@gmail.com',2333333,'2018-03-04'),(234234,'2063-02-03','ni2',2,5,'qualque coisa','2015-02-02',403.28,'4444444','nova_era@gmail.com',234123543,'2016-01-01'),(243267,'2014-07-09','ni4',4,2,'blablabla','2014-07-10',1863.2,'5555555','lb@hotmail.com',476836214,'2017-03-09'),(652412,'2012-02-03','nis1',1,4,'empregado','2017-02-02',200.12,'3335433','asdgahdg@gmail.com',234123543,'2015-03-04');
/*!40000 ALTER TABLE `empregado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empregador`
--

DROP TABLE IF EXISTS `empregador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empregador` (
  `cpf_empregador` int(15) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `cod_bairro` int(11) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`cpf_empregador`),
  KEY `cod_bairro_idx` (`cod_bairro`),
  CONSTRAINT `cod_bairro` FOREIGN KEY (`cod_bairro`) REFERENCES `bairro` (`cod_bairro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empregador`
--

LOCK TABLES `empregador` WRITE;
/*!40000 ALTER TABLE `empregador` DISABLE KEYS */;
INSERT INTO `empregador` VALUES (2333333,'Jose','1234567','Rua do Arenos',1,'dois','ccccc@gmail.com'),(20145632,'Lazarento','5342718','Rua da Mansão',1,'quatro','fgr@gmail.com'),(234123543,'joao','1234567','Rua de Cosme de Farias',1,'tres','fgr@gmail.com'),(476836214,'Aurelio','6543789','Aeronoso City',1,'cinco','ccccc@gmail.com');
/*!40000 ALTER TABLE `empregador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escolaridade`
--

DROP TABLE IF EXISTS `escolaridade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escolaridade` (
  `cod_escolaridade` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_escolaridade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escolaridade`
--

LOCK TABLES `escolaridade` WRITE;
/*!40000 ALTER TABLE `escolaridade` DISABLE KEYS */;
INSERT INTO `escolaridade` VALUES (1,'Fundamental'),(2,'Medio'),(3,'Superio Incompleto'),(4,'Superio Completo'),(5,'Mestre'),(6,'Doutor'),(7,'Pós-Doutor');
/*!40000 ALTER TABLE `escolaridade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guia`
--

DROP TABLE IF EXISTS `guia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guia` (
  `mes` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `valor` float NOT NULL,
  `empregado_guia` int(11) NOT NULL,
  PRIMARY KEY (`mes`,`ano`),
  KEY `cpf_idx` (`empregado_guia`),
  CONSTRAINT `cpf` FOREIGN KEY (`empregado_guia`) REFERENCES `empregado` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guia`
--

LOCK TABLES `guia` WRITE;
/*!40000 ALTER TABLE `guia` DISABLE KEYS */;
INSERT INTO `guia` VALUES (1,2010,200,652412),(2,2010,300,243267),(3,2011,400,234234);
/*!40000 ALTER TABLE `guia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imposto`
--

DROP TABLE IF EXISTS `imposto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imposto` (
  `cod_imposto` int(11) NOT NULL,
  `nome_imposto` varchar(45) DEFAULT NULL,
  `percentual` float DEFAULT NULL,
  PRIMARY KEY (`cod_imposto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imposto`
--

LOCK TABLES `imposto` WRITE;
/*!40000 ALTER TABLE `imposto` DISABLE KEYS */;
INSERT INTO `imposto` VALUES (1,'IPVA',10),(2,'IPTU',15),(3,'Imposto',7.8),(4,'Imposto2',2.4);
/*!40000 ALTER TABLE `imposto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imposto_empregado`
--

DROP TABLE IF EXISTS `imposto_empregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imposto_empregado` (
  `id_imposto_emp` int(11) NOT NULL,
  `data` date NOT NULL,
  `cod_imposto` int(11) NOT NULL,
  `empregado_imposto` int(11) NOT NULL,
  PRIMARY KEY (`id_imposto_emp`),
  KEY `cod_imposto_idx` (`cod_imposto`),
  KEY `cpf_idx` (`empregado_imposto`),
  CONSTRAINT `cod_imposto` FOREIGN KEY (`cod_imposto`) REFERENCES `imposto` (`cod_imposto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imposto_empregado`
--

LOCK TABLES `imposto_empregado` WRITE;
/*!40000 ALTER TABLE `imposto_empregado` DISABLE KEYS */;
INSERT INTO `imposto_empregado` VALUES (1,'2000-02-02',1,234234),(2,'2000-02-02',2,234234),(3,'2000-02-02',3,12345);
/*!40000 ALTER TABLE `imposto_empregado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivo_afastamento`
--

DROP TABLE IF EXISTS `motivo_afastamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motivo_afastamento` (
  `idmotivo_afastamento` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmotivo_afastamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivo_afastamento`
--

LOCK TABLES `motivo_afastamento` WRITE;
/*!40000 ALTER TABLE `motivo_afastamento` DISABLE KEYS */;
INSERT INTO `motivo_afastamento` VALUES (1,'Doença'),(2,'Suspensão');
/*!40000 ALTER TABLE `motivo_afastamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'teste'
--

--
-- Dumping routines for database 'teste'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-15 16:38:50
