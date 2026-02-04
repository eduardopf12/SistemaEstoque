-- MySqlBackup.NET 2.6.5.0
-- Dump Time: 2026-02-02 12:59:54
-- --------------------------------------
-- Server version 10.11.14-MariaDB-0+deb12u2 Debian 12


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 
-- Definition of AtualizacoesSistema
-- 

DROP TABLE IF EXISTS `AtualizacoesSistema`;
CREATE TABLE IF NOT EXISTS `AtualizacoesSistema` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` longtext NOT NULL,
  `Descricao` longtext NOT NULL,
  `Data` datetime(6) NOT NULL,
  `Tipo` longtext NOT NULL,
  `Patrimonio` longtext DEFAULT NULL,
  `ProdutoNome` longtext DEFAULT NULL,
  `NotificacoesAtivas` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 
-- Dumping data for table AtualizacoesSistema
-- 

/*!40000 ALTER TABLE `AtualizacoesSistema` DISABLE KEYS */;
INSERT INTO `AtualizacoesSistema`(`Id`,`Titulo`,`Descricao`,`Data`,`Tipo`,`Patrimonio`,`ProdutoNome`,`NotificacoesAtivas`) VALUES(1,'Produto cadastrado','Produto \'Computador Lenovo ThinkCentre\' foi criado no sistema.','2026-01-29 19:15:39.271015','Produto',NULL,'Computador Lenovo ThinkCentre',0),(2,'Produto cadastrado','Produto \'Monitor Lenovo da GTIC Compra 2026\' foi criado no sistema.','2026-01-29 19:17:59.011896','Produto',NULL,'Monitor Lenovo da GTIC Compra 2026',0),(3,'Produto cadastrado','Produto \'Monitor ThinkVision T24i-30 Lenovo RADIO\' foi criado no sistema.','2026-01-29 19:21:26.185010','Produto',NULL,'Monitor ThinkVision T24i-30 Lenovo RADIO',0),(4,'Produto cadastrado','Produto \'Microcomputador ThinkCentre Lenovo da GTIC Compra 2026\' foi criado no sistema.','2026-01-29 19:26:53.948827','Produto',NULL,'Microcomputador ThinkCentre Lenovo da GTIC Compra 2026',0),(5,'Produto cadastrado','Produto \'Microcomputador ThinkCentre  Lenovo RADIO\' foi criado no sistema.','2026-01-29 19:31:02.726289','Produto',NULL,'Microcomputador ThinkCentre  Lenovo RADIO',0),(6,'Produto cadastrado','Produto \'Monitor ThinkVision T24i-30 Lenovo RADIO\' foi criado no sistema.','2026-01-29 19:34:34.951217','Produto',NULL,'Monitor ThinkVision T24i-30 Lenovo RADIO',0),(7,'Produto cadastrado','Produto \'Microcomputador ThinkCentre Lenovo TeleAudiencia\' foi criado no sistema.','2026-01-29 19:42:36.151044','Produto',NULL,'Microcomputador ThinkCentre Lenovo TeleAudiencia',0),(8,'Produto cadastrado','Produto \'Microcomputador Lenovo TinkVision TeleAudiencia\' foi criado no sistema.','2026-01-29 19:45:16.613290','Produto',NULL,'Microcomputador Lenovo TinkVision TeleAudiencia',0),(9,'Produto cadastrado','Produto \'Microcomputador Dell OptiPlex7060\' foi criado no sistema.','2026-01-29 19:49:17.052945','Produto',NULL,'Microcomputador Dell OptiPlex7060',0),(10,'Produto cadastrado','Produto \'Microcomputador Dell OptiPlex 3000\' foi criado no sistema.','2026-01-29 19:51:24.525822','Produto',NULL,'Microcomputador Dell OptiPlex 3000',0),(11,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Computador Lenovo ThinkCentre \nPatrimônio: 61-65653\nQuantidade: 1','2026-01-30 11:29:18.388308','movimentacao','61-65653',NULL,0),(12,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo da GTIC Compra 2026\nPatrimônio: 1123123213\nQuantidade: 1','2026-01-30 13:42:37.215182','movimentacao','1123123213',NULL,0),(13,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo da GTIC Compra 2026\nPatrimônio: 61-65653\nQuantidade: 1','2026-01-30 16:51:35.172974','movimentacao','61-65653',NULL,0),(14,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Computador Lenovo ThinkCentre \nPatrimônio: 61-65653\nQuantidade: 1','2026-01-30 16:52:47.230214','movimentacao','61-65653',NULL,0),(15,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65643\nQuantidade: 1','2026-01-30 17:15:32.362972','movimentacao','61-65643',NULL,0),(16,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65656\nQuantidade: 1','2026-01-30 17:15:51.466371','movimentacao','61-65656',NULL,0),(17,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65659\nQuantidade: 1','2026-01-30 17:16:07.397334','movimentacao','61-65659',NULL,0),(18,'Movimentação Registrada','🔄 Movimentação de Entrada\nProduto: Computador Lenovo ThinkCentre \nPatrimônio: CDPV2\nQuantidade: 1','2026-02-02 11:00:46.571192','movimentacao','CDPV2',NULL,0),(19,'Movimentação Registrada','🔄 Movimentação de Entrada\nProduto: Computador Lenovo ThinkCentre \nPatrimônio: 61-56512\nQuantidade: 1','2026-02-02 11:05:24.700098','movimentacao','61-56512',NULL,0),(20,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65624\nQuantidade: 1','2026-02-02 11:42:33.427300','movimentacao','61-65624',NULL,0),(21,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65616\nQuantidade: 1','2026-02-02 11:42:47.991372','movimentacao','61-65616',NULL,0),(22,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65632\nQuantidade: 1','2026-02-02 11:43:05.797339','movimentacao','61-65632',NULL,0),(23,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65653\nQuantidade: 1','2026-02-02 11:43:49.306090','movimentacao','61-65653',NULL,0),(24,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65654\nQuantidade: 1','2026-02-02 11:44:02.468224','movimentacao','61-65654',NULL,0),(25,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65644\nQuantidade: 1','2026-02-02 11:44:16.266163','movimentacao','61-65644',NULL,0),(26,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65658\nQuantidade: 1','2026-02-02 11:44:27.764154','movimentacao','61-65658',NULL,0),(27,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65619\nQuantidade: 1','2026-02-02 11:45:18.664416','movimentacao','61-65619',NULL,0),(28,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65623\nQuantidade: 1','2026-02-02 11:45:31.261611','movimentacao','61-65623',NULL,0),(29,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65625\nQuantidade: 1','2026-02-02 11:45:41.417823','movimentacao','61-65625',NULL,0),(30,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65627\nQuantidade: 1','2026-02-02 11:45:53.400363','movimentacao','61-65627',NULL,0),(31,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65827\nQuantidade: 1','2026-02-02 11:46:13.667241','movimentacao','61-65827',NULL,0),(32,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65864\nQuantidade: 1','2026-02-02 11:46:29.839589','movimentacao','61-65864',NULL,0),(33,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65826\nQuantidade: 1','2026-02-02 11:46:45.202265','movimentacao','61-65826',NULL,0),(34,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65755\nQuantidade: 1','2026-02-02 11:46:59.099263','movimentacao','61-65755',NULL,0),(35,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65699\nQuantidade: 1','2026-02-02 11:47:13.028352','movimentacao','61-65699',NULL,0),(36,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65722\nQuantidade: 1','2026-02-02 11:47:26.508900','movimentacao','61-65722',NULL,0),(37,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65881\nQuantidade: 1','2026-02-02 11:47:56.093474','movimentacao','61-65881',NULL,0),(38,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65731\nQuantidade: 1','2026-02-02 11:48:07.870012','movimentacao','61-65731',NULL,0),(39,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65724\nQuantidade: 1','2026-02-02 11:48:24.591206','movimentacao','61-65724',NULL,0),(40,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65882\nQuantidade: 1','2026-02-02 11:48:47.226735','movimentacao','61-65882',NULL,0),(41,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65853\nQuantidade: 1','2026-02-02 11:49:00.823158','movimentacao','61-65853',NULL,0),(42,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65723\nQuantidade: 1','2026-02-02 11:49:20.276650','movimentacao','61-65723',NULL,0),(43,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65846\nQuantidade: 1','2026-02-02 11:49:45.153163','movimentacao','61-65846',NULL,0),(44,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65707\nQuantidade: 1','2026-02-02 11:50:24.060831','movimentacao','61-65707',NULL,0),(45,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65858\nQuantidade: 1','2026-02-02 11:51:22.117656','movimentacao','61-65858',NULL,0),(46,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65705\nQuantidade: 1','2026-02-02 11:51:35.984296','movimentacao','61-65705',NULL,0),(47,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65684\nQuantidade: 1','2026-02-02 12:53:14.942718','movimentacao','61-65684',NULL,0),(48,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65688\nQuantidade: 1','2026-02-02 12:53:37.582571','movimentacao','61-65688',NULL,0),(49,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65677\nQuantidade: 1','2026-02-02 12:53:52.096902','movimentacao','61-65677',NULL,0),(50,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65689\nQuantidade: 1','2026-02-02 12:54:07.881101','movimentacao','61-65689',NULL,0),(51,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65680\nQuantidade: 1','2026-02-02 12:54:21.979084','movimentacao','61-65680',NULL,0),(52,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65685\nQuantidade: 1','2026-02-02 12:54:35.162040','movimentacao','61-65685',NULL,0),(53,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65682\nQuantidade: 1','2026-02-02 12:54:45.435781','movimentacao','61-65682',NULL,0),(54,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65802\nQuantidade: 1','2026-02-02 12:55:00.635104','movimentacao','61-65802',NULL,0),(55,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65813\nQuantidade: 1','2026-02-02 12:55:14.833857','movimentacao','61-65813',NULL,0),(56,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65809\nQuantidade: 1','2026-02-02 12:55:26.265772','movimentacao','61-65809',NULL,0),(57,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65821\nQuantidade: 1','2026-02-02 12:55:39.474235','movimentacao','61-65821',NULL,0),(58,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65807\nQuantidade: 1','2026-02-02 12:55:52.691370','movimentacao','61-65807',NULL,0),(59,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65814\nQuantidade: 1','2026-02-02 12:56:06.101462','movimentacao','61-65814',NULL,0),(60,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65817\nQuantidade: 1','2026-02-02 12:56:18.451450','movimentacao','61-65817',NULL,0),(61,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65806\nQuantidade: 1','2026-02-02 12:56:29.028918','movimentacao','61-65806',NULL,0),(62,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65683\nQuantidade: 1','2026-02-02 12:57:55.446643','movimentacao','61-65683',NULL,0),(63,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65681\nQuantidade: 1','2026-02-02 12:58:10.198532','movimentacao','61-65681',NULL,0),(64,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Monitor ThinkVision Lenovo TeleAudiencia\nPatrimônio: 61-65690\nQuantidade: 1','2026-02-02 12:58:23.327756','movimentacao','61-65690',NULL,0),(65,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65803\nQuantidade: 1','2026-02-02 12:58:42.096170','movimentacao','61-65803',NULL,0),(66,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65818\nQuantidade: 1','2026-02-02 12:58:53.089791','movimentacao','61-65818',NULL,0),(67,'Movimentação Registrada','🔄 Movimentação de Saida\nProduto: Microcomputador Lenovo TinkVision TeleAudiencia\nPatrimônio: 61-65805\nQuantidade: 1','2026-02-02 12:59:04.686529','movimentacao','61-65805',NULL,0);
/*!40000 ALTER TABLE `AtualizacoesSistema` ENABLE KEYS */;

-- 
-- Definition of Auditorias
-- 

DROP TABLE IF EXISTS `Auditorias`;
CREATE TABLE IF NOT EXISTS `Auditorias` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` longtext NOT NULL,
  `Acao` longtext NOT NULL,
  `Produto` longtext NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Tipo` longtext NOT NULL,
  `Patrimonio` longtext NOT NULL,
  `Data` datetime(6) NOT NULL,
  `Ip` longtext NOT NULL,
  `Motivo` longtext DEFAULT NULL,
  `Entidade` longtext NOT NULL,
  `Foto` longtext DEFAULT NULL,
  `FotoAuditoria` longtext DEFAULT NULL,
  `FotoAntes` longtext DEFAULT NULL,
  `FotoDepois` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 
-- Dumping data for table Auditorias
-- 

/*!40000 ALTER TABLE `Auditorias` DISABLE KEYS */;
INSERT INTO `Auditorias`(`Id`,`Usuario`,`Acao`,`Produto`,`Quantidade`,`Tipo`,`Patrimonio`,`Data`,`Ip`,`Motivo`,`Entidade`,`Foto`,`FotoAuditoria`,`FotoAntes`,`FotoDepois`) VALUES(1,'Administrador','CREATE','Computador Lenovo ThinkCentre',1,'Produto','-','2026-01-29 19:15:39.320140','10.168.11.176',NULL,'Produto',NULL,'60f7762b-96a0-4ede-b11c-be49e038b99f_695e4a3c-9c27-4db0-bfcf-fdc998791765.jpg',NULL,NULL),(2,'Administrador','CREATE','Monitor Lenovo da GTIC Compra 2026',138,'Produto','-','2026-01-29 19:17:59.028119','10.168.11.176',NULL,'Produto',NULL,'040cd154-6dfe-48fa-b68e-329295b1175c_3d056178-70eb-43ed-839a-fff8df99dc86.png',NULL,NULL),(3,'Administrador','EDIT','Computador Lenovo ThinkCentre RADIO',1,'Produto','-','2026-01-29 19:19:10.180738','10.168.11.176',NULL,'Produto',NULL,'51b1e0b9-3e3c-4829-bb3b-2bbd4b58d617_695e4a3c-9c27-4db0-bfcf-fdc998791765.jpg',NULL,NULL),(4,'Administrador','EDIT','Computador Lenovo ThinkCentre RADIO',1,'Produto','-','2026-01-29 19:19:55.146566','10.168.11.176',NULL,'Produto',NULL,'5edd20d2-0b5c-4d25-bfb4-6cb6b9186761_695e4a3c-9c27-4db0-bfcf-fdc998791765.jpg',NULL,NULL),(5,'Administrador','CREATE','Monitor ThinkVision T24i-30 Lenovo RADIO',0,'Produto','-','2026-01-29 19:21:26.223797','10.168.11.176',NULL,'Produto',NULL,NULL,NULL,NULL),(6,'Administrador','EDIT','Computador Lenovo ThinkCentre ',1,'Produto','-','2026-01-29 19:22:43.946105','10.168.11.176',NULL,'Produto',NULL,'9d33ad4a-37d3-47d8-910c-8e99422e24e7_695e4a3c-9c27-4db0-bfcf-fdc998791765.jpg',NULL,NULL),(7,'Administrador','DELETE','Monitor ThinkVision T24i-30 Lenovo RADIO',0,'Produto','-','2026-01-29 19:25:06.912891','10.168.11.176',NULL,'Produto',NULL,NULL,NULL,NULL),(8,'Administrador','EDIT','Computador Lenovo ThinkCentre ',1,'Produto','-','2026-01-29 19:25:22.973960','10.168.11.176',NULL,'Produto',NULL,'7b64ed3d-c1d9-47e6-b53b-90f03d7d8d23_695e4a3c-9c27-4db0-bfcf-fdc998791765.jpg',NULL,NULL),(9,'Administrador','CREATE','Microcomputador ThinkCentre Lenovo da GTIC Compra 2026',138,'Produto','-','2026-01-29 19:26:53.974780','10.168.11.176',NULL,'Produto',NULL,'01eb86a9-965d-4ea6-962d-10306c8415ad_506b1c35-96c4-46f6-a14b-a0209785c6d6.png',NULL,NULL),(10,'Administrador','EDIT','Monitor ThinkVision Lenovo da GTIC Compra 2026',138,'Produto','-','2026-01-29 19:27:18.075274','10.168.11.176',NULL,'Produto',NULL,'292f5f0f-48c7-4823-8d95-8ea8d421018c_3d056178-70eb-43ed-839a-fff8df99dc86.png',NULL,NULL),(11,'Administrador','CREATE','Microcomputador ThinkCentre  Lenovo RADIO',1,'Produto','-','2026-01-29 19:31:02.777884','10.168.11.176',NULL,'Produto',NULL,'cf2617a2-b2d0-45d3-b85d-927fba389475_1bd9972a-4e8a-496a-9afc-0ac72fc2a328.png',NULL,NULL),(12,'Administrador','CREATE','Monitor ThinkVision T24i-30 Lenovo RADIO',1,'Produto','-','2026-01-29 19:34:34.964349','10.168.11.176',NULL,'Produto',NULL,'8911f4db-14cb-48a7-9d8f-06b391279e6a_866c6ab5-8ee2-4109-8ddd-66c105a413ee.png',NULL,NULL),(13,'Administrador','CREATE','Microcomputador ThinkCentre Lenovo TeleAudiencia',150,'Produto','-','2026-01-29 19:42:36.183553','10.168.11.176',NULL,'Produto',NULL,'32d94ea8-f444-49fb-b8f0-caa9b35a2f7a_d7a09d60-01ea-47ad-9a9d-98a16ccb5912.png',NULL,NULL),(14,'Administrador','EDIT','Monitor ThinkVision Lenovo TeleAudiencia',150,'Produto','-','2026-01-29 19:43:42.542009','10.168.11.176',NULL,'Produto',NULL,'fafe4316-0ca4-46d4-8f00-bd615b3b9e04_d7a09d60-01ea-47ad-9a9d-98a16ccb5912.png',NULL,NULL),(15,'Administrador','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',150,'Produto','-','2026-01-29 19:45:16.687478','10.168.11.176',NULL,'Produto',NULL,'58ca75bd-00b0-4547-81d9-21a189f56a6f_ce66d5f8-8e2a-4561-92a6-eb8fcddd7035.png',NULL,NULL),(16,'Administrador','CREATE','Microcomputador Dell OptiPlex7060',1,'Produto','-','2026-01-29 19:49:17.117306','10.168.11.176',NULL,'Produto',NULL,'a1c80382-32af-4530-b653-54bbd8a6a609_d93e8698-d935-4575-af2d-8c7001faf543.png',NULL,NULL),(17,'Administrador','CREATE','Microcomputador Dell OptiPlex 3000',1,'Produto','-','2026-01-29 19:51:24.564360','10.168.11.176',NULL,'Produto',NULL,'b9f4f080-d7e9-4329-8747-97c8c751cb6d_3c516ae6-b6d9-45a0-be9b-bb9f5599a5b7.png',NULL,NULL),(18,'Administrador','CREATE','Monitor ThinkVision Lenovo da GTIC Compra 2026',1,'Saida','1123123213','2026-01-30 13:42:37.210890','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(19,'Administrador','EDIT','Monitor ThinkVision Lenovo da GTIC Compra 2026',138,'Produto','-','2026-01-30 13:47:01.531474','10.168.11.176',NULL,'Produto',NULL,'b6ff0290-0ed8-4d26-86cb-5353be90f37a_8322f6a9-7ee1-4867-b614-61dd9d9a82b9.png',NULL,NULL),(20,'Administrador','EDIT','Microcomputador ThinkCentre Lenovo da GTIC Compra 2026',138,'Produto','-','2026-01-30 13:51:31.445500','10.168.11.176',NULL,'Produto',NULL,'2d006397-981c-400b-9534-5405a58bc8ed_6447f6ab-44fc-4b87-9ae2-8ffbd10e61b5.png',NULL,NULL),(21,'Administrador','EDIT','Computador Lenovo ThinkCentre ',1,'Produto','-','2026-01-30 13:52:27.797670','10.168.11.176',NULL,'Produto',NULL,'afbc6481-b7bb-490c-a483-9d2dee51833b_124fcb4f-0313-4dec-9e9e-157783c7c581.png',NULL,NULL),(22,'Administrador','EDIT','Microcomputador ThinkCentre  Lenovo RADIO',1,'Produto','-','2026-01-30 13:53:14.205739','10.168.11.176',NULL,'Produto',NULL,'16cb1541-6399-44a7-9a01-60e395615b8e_726c7821-102c-4e5b-a0b3-05de2efd1697.png',NULL,NULL),(23,'Administrador','EDIT','Monitor ThinkVision T24i-30 Lenovo RADIO',1,'Produto','-','2026-01-30 13:54:43.631251','10.168.11.176',NULL,'Produto',NULL,'38525141-16a9-4931-a3df-670bf40d5792_a6e109ab-f2db-404c-b2fe-0d7beb78511a.png',NULL,NULL),(24,'Administrador','EDIT','Monitor ThinkVision Lenovo TeleAudiencia',150,'Produto','-','2026-01-30 13:58:53.002424','10.168.11.176',NULL,'Produto',NULL,'714583cd-0501-471a-a0e4-41668e8dbda8_4efd1f4f-afb9-4b2e-85a8-77607ca2de14.png',NULL,NULL),(25,'Administrador','EDIT','Microcomputador Dell OptiPlex7060',1,'Produto','-','2026-01-30 13:59:30.490632','10.168.11.176',NULL,'Produto',NULL,'62f80af8-2a0c-411f-98a2-0a3a2d8ba08b_3d33bdc2-d858-4168-9c85-145dedd178f6.png',NULL,NULL),(26,'Administrador','EDIT','Microcomputador Dell OptiPlex 3000',1,'Produto','-','2026-01-30 14:29:18.769276','10.168.11.176',NULL,'Produto',NULL,'8346f7a8-b80f-4afc-aebf-6988b67d0459_ede2f89c-db48-40ce-98ed-293dc3426926.png',NULL,NULL),(27,'Administrador','DELETE','Monitor ThinkVision Lenovo da GTIC Compra 2026',1,'Saida','1123123213','2026-01-30 15:01:27.346061','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(28,'Administrador','DELETE','Computador Lenovo ThinkCentre ',1,'Saida','61-65653','2026-01-30 15:01:29.066271','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(29,'Administrador','CREATE','Monitor ThinkVision Lenovo da GTIC Compra 2026',1,'Saida','61-65653','2026-01-30 16:51:35.172914','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(30,'Administrador','DELETE','Monitor ThinkVision Lenovo da GTIC Compra 2026',1,'Saida','61-65653','2026-01-30 16:52:20.547818','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(31,'Administrador','CREATE','Computador Lenovo ThinkCentre ',1,'Saida','61-65653','2026-01-30 16:52:47.230158','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(32,'Administrador','DELETE','Computador Lenovo ThinkCentre ',1,'Saida','61-65653','2026-01-30 16:52:53.417424','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(33,'Eduardo Pacheco Ferreira','EDIT','Microcomputador Lenovo TinkVision TeleAudiencia',150,'Produto','-','2026-01-30 17:14:41.804619','10.168.11.176',NULL,'Produto',NULL,'15a6cd1d-e2e8-4ec1-844d-44ddd27124aa_e88f466e-63e2-4b66-9df0-a20fdb39180a.png',NULL,NULL),(34,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65643','2026-01-30 17:15:32.362915','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(35,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65656','2026-01-30 17:15:51.466302','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(36,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65659','2026-01-30 17:16:07.397274','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(37,'Eduardo Pacheco Ferreira','CREATE','Computador Lenovo ThinkCentre ',1,'Entrada','CDPV2','2026-02-02 11:00:46.571127','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(38,'Eduardo Pacheco Ferreira','EDIT','Computador Lenovo ThinkCentre ',1,'Entrada','61-56522','2026-02-02 11:01:25.173450','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(39,'Eduardo Pacheco Ferreira','CREATE','Computador Lenovo ThinkCentre ',1,'Entrada','61-56512','2026-02-02 11:05:24.700042','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(40,'Eduardo Pacheco Ferreira','EDIT','Monitor ThinkVision Lenovo TeleAudiencia',150,'Produto','-','2026-02-02 11:42:05.364209','10.168.11.176',NULL,'Produto',NULL,'ded26a72-32a7-41f5-87c7-c358a2443a91_20987015-bb2c-46d8-af0f-478a037469de.png',NULL,NULL),(41,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65624','2026-02-02 11:42:33.427255','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(42,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65616','2026-02-02 11:42:47.991315','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(43,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65632','2026-02-02 11:43:05.797282','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(44,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65653','2026-02-02 11:43:49.306043','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(45,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65654','2026-02-02 11:44:02.468173','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(46,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65644','2026-02-02 11:44:16.266100','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(47,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65658','2026-02-02 11:44:27.764110','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(48,'Eduardo Pacheco Ferreira','EDIT','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65654','2026-02-02 11:44:46.228410','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(49,'Eduardo Pacheco Ferreira','EDIT','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65658','2026-02-02 11:44:56.288633','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(50,'Eduardo Pacheco Ferreira','EDIT','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65644','2026-02-02 11:45:04.032218','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(51,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65619','2026-02-02 11:45:18.664359','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(52,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65623','2026-02-02 11:45:31.261579','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(53,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65625','2026-02-02 11:45:41.417795','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(54,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65627','2026-02-02 11:45:53.400318','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(55,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65827','2026-02-02 11:46:13.667212','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(56,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65864','2026-02-02 11:46:29.839558','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(57,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65826','2026-02-02 11:46:45.202236','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(58,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65755','2026-02-02 11:46:59.099229','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(59,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65699','2026-02-02 11:47:13.028309','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(60,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65722','2026-02-02 11:47:26.508628','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(61,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65881','2026-02-02 11:47:56.093428','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(62,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65731','2026-02-02 11:48:07.869982','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(63,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65724','2026-02-02 11:48:24.591175','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(64,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65882','2026-02-02 11:48:47.226705','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(65,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65853','2026-02-02 11:49:00.823114','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(66,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65723','2026-02-02 11:49:20.276621','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(67,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65846','2026-02-02 11:49:45.153134','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(68,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65707','2026-02-02 11:50:24.060800','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(69,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65858','2026-02-02 11:51:22.117627','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(70,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65705','2026-02-02 11:51:35.984267','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(71,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65684','2026-02-02 12:53:14.942677','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(72,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65688','2026-02-02 12:53:37.582542','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(73,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65677','2026-02-02 12:53:52.096861','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(74,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65689','2026-02-02 12:54:07.881069','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(75,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65680','2026-02-02 12:54:21.979045','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(76,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65685','2026-02-02 12:54:35.162007','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(77,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65682','2026-02-02 12:54:45.435748','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(78,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65802','2026-02-02 12:55:00.635033','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(79,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65813','2026-02-02 12:55:14.833818','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(80,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65809','2026-02-02 12:55:26.265741','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(81,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65821','2026-02-02 12:55:39.474208','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(82,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65807','2026-02-02 12:55:52.691343','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(83,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65814','2026-02-02 12:56:06.101425','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(84,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65817','2026-02-02 12:56:18.451418','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(85,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65806','2026-02-02 12:56:29.028889','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(86,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65683','2026-02-02 12:57:55.446612','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(87,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65681','2026-02-02 12:58:10.198505','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(88,'Eduardo Pacheco Ferreira','CREATE','Monitor ThinkVision Lenovo TeleAudiencia',1,'Saida','61-65690','2026-02-02 12:58:23.327724','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(89,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65803','2026-02-02 12:58:42.096125','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(90,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65818','2026-02-02 12:58:53.089754','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL),(91,'Eduardo Pacheco Ferreira','CREATE','Microcomputador Lenovo TinkVision TeleAudiencia',1,'Saida','61-65805','2026-02-02 12:59:04.686501','10.168.11.176',NULL,'Movimentacao',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Auditorias` ENABLE KEYS */;

-- 
-- Definition of BackupLogs
-- 

DROP TABLE IF EXISTS `BackupLogs`;
CREATE TABLE IF NOT EXISTS `BackupLogs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Acao` longtext NOT NULL,
  `Arquivo` longtext NOT NULL,
  `Usuario` longtext NOT NULL,
  `Data` datetime(6) NOT NULL,
  `Status` longtext NOT NULL,
  `MensagemErro` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 
-- Dumping data for table BackupLogs
-- 

/*!40000 ALTER TABLE `BackupLogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `BackupLogs` ENABLE KEYS */;

-- 
-- Definition of Produtos
-- 

DROP TABLE IF EXISTS `Produtos`;
CREATE TABLE IF NOT EXISTS `Produtos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` longtext NOT NULL,
  `Descricao` longtext DEFAULT NULL,
  `Estoque` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL DEFAULT 0,
  `Foto` longtext DEFAULT NULL,
  `EstoqueMinimo` int(11) NOT NULL DEFAULT 0,
  `Patrimonio` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 
-- Dumping data for table Produtos
-- 

/*!40000 ALTER TABLE `Produtos` DISABLE KEYS */;
INSERT INTO `Produtos`(`Id`,`Nome`,`Descricao`,`Estoque`,`Quantidade`,`Foto`,`EstoqueMinimo`,`Patrimonio`) VALUES(1,'Computador Lenovo ThinkCentre ','Computador Lenovo ThinkCentre  SEM WIFI\r\nM75s Gen 2 (Type 11R7, 11R8, 11R9, 11RA) Desktop (ThinkCentre) - Type 11R7\r\nIncial de Patrimonio: ',4,1,'124fcb4f-0313-4dec-9e9e-157783c7c581.png',0,NULL),(2,'Monitor ThinkVision Lenovo da GTIC Compra 2026','Monitor Lenovo da GTIC\r\nMonitor ThinkVision T24i-30 23,8\r\n\r\n',139,138,'8322f6a9-7ee1-4867-b614-61dd9d9a82b9.png',0,NULL),(4,'Microcomputador ThinkCentre Lenovo da GTIC Compra 2026','Microcomputador ThinkCentre Lenovo da GTIC Compra 2026\r\nDescriçao: \r\nM75q Gen 2 (Type 11JN, 11JQ, 11JR, 11JS) Desktop (ThinkCentre) - Type 13E0\r\n\r\nNao Patrimoniada ainda\r\n',138,138,'6447f6ab-44fc-4b87-9ae2-8ffbd10e61b5.png',0,NULL),(5,'Microcomputador ThinkCentre  Lenovo RADIO','Microcomputador ThinkCentre M70q Gen 4 Lenovo RADIO\r\nDescriçao: M70q Gen 4 Desktop (ThinkCentre) - Type 12E4\r\nIncial do Patrimonio: 64-14xx ou 64-15xx',1,1,'726c7821-102c-4e5b-a0b3-05de2efd1697.png',0,NULL),(6,'Monitor ThinkVision T24i-30 Lenovo RADIO','Monitor ThinkVision T24i-30 Lenovo RADIO\r\nDescriçao: ThinkVision T24i-30 - Type 63CF Com Suporte\r\nInicial do Patrimonio:64-14xx ou 64-15xx',1,1,'a6e109ab-f2db-404c-b2fe-0d7beb78511a.png',0,NULL),(7,'Monitor ThinkVision Lenovo TeleAudiencia','Monitor ThinkVision Lenovo TeleAudiencia\r\nDescriçao:Monitor ThinkVision T24i-30 Lenovo\r\nInicial do Patrimonio:61-65xxxx',125,150,'20987015-bb2c-46d8-af0f-478a037469de.png',0,NULL),(8,'Microcomputador Lenovo TinkVision TeleAudiencia','Microcomputador Lenovo TinkVision TeleAudiencia\r\nDescriçao:Microcomputador ThinkCentre M70q Gen 5 Lenovo\r\nInicial do Patrimonio: 61-65xxx',124,150,'e88f466e-63e2-4b66-9df0-a20fdb39180a.png',0,NULL),(9,'Microcomputador Dell OptiPlex7060','Microcomputador Dell OptiPlex7060\r\nDescriçao:OptiPlex 7060 Micro\r\nInicial do Patrimonio:61-xxxxx',1,1,'3d33bdc2-d858-4168-9c85-145dedd178f6.png',0,NULL),(10,'Microcomputador Dell OptiPlex 3000','Microcomputador Dell OptiPlex 3000\r\nDescriçao:OptiPlex 3000 Micro\r\nInicial do Patrimonio:61-xxxx',1,1,'ede2f89c-db48-40ce-98ed-293dc3426926.png',0,NULL);
/*!40000 ALTER TABLE `Produtos` ENABLE KEYS */;

-- 
-- Definition of Movimentacoes
-- 

DROP TABLE IF EXISTS `Movimentacoes`;
CREATE TABLE IF NOT EXISTS `Movimentacoes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProdutoId` int(11) NOT NULL,
  `Tipo` longtext NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Data` datetime(6) NOT NULL,
  `Patrimonio` longtext NOT NULL,
  `Setor` longtext NOT NULL,
  `Unidade` longtext NOT NULL,
  `Foto` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Movimentacoes_ProdutoId` (`ProdutoId`),
  CONSTRAINT `FK_Movimentacoes_Produtos_ProdutoId` FOREIGN KEY (`ProdutoId`) REFERENCES `Produtos` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 
-- Dumping data for table Movimentacoes
-- 

/*!40000 ALTER TABLE `Movimentacoes` DISABLE KEYS */;
INSERT INTO `Movimentacoes`(`Id`,`ProdutoId`,`Tipo`,`Quantidade`,`Data`,`Patrimonio`,`Setor`,`Unidade`,`Foto`) VALUES(5,8,'Saida',1,'2026-01-30 17:15:32.359275','61-65643','CASCUVV','1',NULL),(6,8,'Saida',1,'2026-01-30 17:15:51.461283','61-65656','CASCUVV','1',NULL),(7,8,'Saida',1,'2026-01-30 17:16:07.392354','61-65659','CASCUVV','1',NULL),(8,1,'Entrada',1,'2026-02-02 11:00:46.567041','61-56522','CDPV2 Para GTIC','1',NULL),(9,1,'Entrada',1,'2026-02-02 11:05:24.670558','61-56512','CDPV2 Para GTIC','1',NULL),(10,7,'Saida',1,'2026-02-02 11:42:33.423285','61-65624','CASCUVV','1',NULL),(11,7,'Saida',1,'2026-02-02 11:42:47.986627','61-65616','CASCUVV','1',NULL),(12,7,'Saida',1,'2026-02-02 11:43:05.792426','61-65632','CASCUVV','1',NULL),(13,8,'Saida',1,'2026-02-02 11:43:49.300888','61-65653','CDPCI','1',NULL),(14,8,'Saida',1,'2026-02-02 11:44:02.463700','61-65654','CDPCI','1',NULL),(15,8,'Saida',1,'2026-02-02 11:44:16.260664','61-65644','CDPCI','1',NULL),(16,8,'Saida',1,'2026-02-02 11:44:27.756703','61-65658','CDPCI','1',NULL),(17,7,'Saida',1,'2026-02-02 11:45:18.660365','61-65619','CDPCI','1',NULL),(18,7,'Saida',1,'2026-02-02 11:45:31.254009','61-65623','CDPCI','1',NULL),(19,7,'Saida',1,'2026-02-02 11:45:41.414578','61-65625','CDPCI','1',NULL),(20,7,'Saida',1,'2026-02-02 11:45:53.396646','61-65627','CDPCI','1',NULL),(21,8,'Saida',1,'2026-02-02 11:46:13.664101','61-65827','CDPVV','1',NULL),(22,8,'Saida',1,'2026-02-02 11:46:29.834478','61-65864','CDPVV','1',NULL),(23,8,'Saida',1,'2026-02-02 11:46:45.197810','61-65826','CDPVV','1',NULL),(24,7,'Saida',1,'2026-02-02 11:46:59.094614','61-65755','CDPVV','1',NULL),(25,7,'Saida',1,'2026-02-02 11:47:13.024942','61-65699','CDPVV','1',NULL),(26,7,'Saida',1,'2026-02-02 11:47:26.504996','61-65722','CDPVV','1',NULL),(27,8,'Saida',1,'2026-02-02 11:47:56.088904','61-65881','PSVV','1',NULL),(28,7,'Saida',1,'2026-02-02 11:48:07.864767','61-65731','PSVV','1',NULL),(29,8,'Saida',1,'2026-02-02 11:48:24.585749','61-65724','PEVV1','1',NULL),(30,8,'Saida',1,'2026-02-02 11:48:47.222809','61-65882','PEVV1','1',NULL),(31,7,'Saida',1,'2026-02-02 11:49:00.819650','61-65853','PEVV1','1',NULL),(32,7,'Saida',1,'2026-02-02 11:49:20.272790','61-65723','PEVV1','1',NULL),(33,8,'Saida',1,'2026-02-02 11:49:45.148406','61-65846','PEVV3','1',NULL),(34,7,'Saida',1,'2026-02-02 11:50:24.056550','61-65707','PEVV3','1',NULL),(35,8,'Saida',1,'2026-02-02 11:51:22.114439','61-65858','PEVV6','1',NULL),(36,7,'Saida',1,'2026-02-02 11:51:35.979640','61-65705','PEVV6','1',NULL),(37,7,'Saida',1,'2026-02-02 12:53:14.938870','61-65684','CDPV2','1',NULL),(38,7,'Saida',1,'2026-02-02 12:53:37.578798','61-65688','CDPV2','1',NULL),(39,7,'Saida',1,'2026-02-02 12:53:52.093783','61-65677','CDPV2','1',NULL),(40,7,'Saida',1,'2026-02-02 12:54:07.877742','61-65689','CDPV2','1',NULL),(41,7,'Saida',1,'2026-02-02 12:54:21.974169','61-65680','CDPV2','1',NULL),(42,7,'Saida',1,'2026-02-02 12:54:35.157708','61-65685','CDPV2','1',NULL),(43,7,'Saida',1,'2026-02-02 12:54:45.431601','61-65682','CDPV2','1',NULL),(44,8,'Saida',1,'2026-02-02 12:55:00.631675','61-65802','CDPV2','1',NULL),(45,8,'Saida',1,'2026-02-02 12:55:14.830615','61-65813','CDPV2','1',NULL),(46,8,'Saida',1,'2026-02-02 12:55:26.261238','61-65809','CDPV2','1',NULL),(47,8,'Saida',1,'2026-02-02 12:55:39.470504','61-65821','CDPV2','1',NULL),(48,8,'Saida',1,'2026-02-02 12:55:52.687372','61-65807','CDPV2','1',NULL),(49,8,'Saida',1,'2026-02-02 12:56:06.097954','61-65814','CDPV2','1',NULL),(50,8,'Saida',1,'2026-02-02 12:56:18.448487','61-65817','CDPV2','1',NULL),(51,8,'Saida',1,'2026-02-02 12:56:29.024037','61-65806','CDPV2','1',NULL),(52,7,'Saida',1,'2026-02-02 12:57:55.443011','61-65683','PSMA2','1',NULL),(53,7,'Saida',1,'2026-02-02 12:58:10.194712','61-65681','PSMA2','1',NULL),(54,7,'Saida',1,'2026-02-02 12:58:23.322707','61-65690','PSMA2','1',NULL),(55,8,'Saida',1,'2026-02-02 12:58:42.092496','61-65803','PSMA2','1',NULL),(56,8,'Saida',1,'2026-02-02 12:58:53.086135','61-65818','PSMA2','1',NULL),(57,8,'Saida',1,'2026-02-02 12:59:04.681638','61-65805','PSMA2','1',NULL);
/*!40000 ALTER TABLE `Movimentacoes` ENABLE KEYS */;

-- 
-- Definition of UsuarioLogs
-- 

DROP TABLE IF EXISTS `UsuarioLogs`;
CREATE TABLE IF NOT EXISTS `UsuarioLogs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` longtext NOT NULL,
  `Acao` longtext NOT NULL,
  `Alvo` longtext NOT NULL,
  `Data` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 
-- Dumping data for table UsuarioLogs
-- 

/*!40000 ALTER TABLE `UsuarioLogs` DISABLE KEYS */;
INSERT INTO `UsuarioLogs`(`Id`,`Usuario`,`Acao`,`Alvo`,`Data`) VALUES(1,'Administrador','Criou','Renata Calheiras Schulz','2026-01-29 19:52:04.036617'),(2,'Administrador','Editou','Renata Calheiras Schulz','2026-01-29 19:52:12.664442'),(3,'Administrador','Criou','Eduardo Pacheco Ferreira','2026-01-30 10:36:56.499006'),(4,'Administrador','Editou','Eduardo Pacheco Ferreira','2026-02-02 10:56:38.160378');
/*!40000 ALTER TABLE `UsuarioLogs` ENABLE KEYS */;

-- 
-- Definition of Usuarios
-- 

DROP TABLE IF EXISTS `Usuarios`;
CREATE TABLE IF NOT EXISTS `Usuarios` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` longtext NOT NULL,
  `Email` longtext NOT NULL,
  `Senha` longtext NOT NULL,
  `Perfil` longtext NOT NULL,
  `Ativo` tinyint(1) NOT NULL DEFAULT 0,
  `UltimoLogin` datetime(6) DEFAULT NULL,
  `UltimaLeituraAtualizacoes` datetime(6) DEFAULT NULL,
  `AlterarSenhaProximoLogin` tinyint(1) NOT NULL DEFAULT 0,
  `NotificacoesAtivas` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 
-- Dumping data for table Usuarios
-- 

/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios`(`Id`,`Nome`,`Email`,`Senha`,`Perfil`,`Ativo`,`UltimoLogin`,`UltimaLeituraAtualizacoes`,`AlterarSenhaProximoLogin`,`NotificacoesAtivas`) VALUES(1,'Administrador','admin@admin.com','$2a$11$F3lXosn2RKiD9HB5UTSZ/umW/yTvh7IEQaaYkot3a72rzQo2t1vy.','Admin',1,NULL,NULL,0,1),(2,'Renata Calheiras Schulz','renata@gmail.com','123456','Operador',1,NULL,NULL,1,0),(3,'Eduardo Pacheco Ferreira','eduardopf1997@gmail.com','$2a$11$Sb/5f70yWfjJrL7y6kWnd.vwOuAFWYP3ZWnsI830bz/B3OO/ZfflO','Admin',1,NULL,NULL,0,0);
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;

-- 
-- Definition of AtualizacoesLidas
-- 

DROP TABLE IF EXISTS `AtualizacoesLidas`;
CREATE TABLE IF NOT EXISTS `AtualizacoesLidas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UsuarioId` int(11) NOT NULL,
  `AtualizacaoSistemaId` int(11) NOT NULL,
  `DataLeitura` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AtualizacoesLidas_AtualizacaoSistemaId` (`AtualizacaoSistemaId`),
  KEY `IX_AtualizacoesLidas_UsuarioId` (`UsuarioId`),
  CONSTRAINT `FK_AtualizacoesLidas_AtualizacoesSistema_AtualizacaoSistemaId` FOREIGN KEY (`AtualizacaoSistemaId`) REFERENCES `AtualizacoesSistema` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AtualizacoesLidas_Usuarios_UsuarioId` FOREIGN KEY (`UsuarioId`) REFERENCES `Usuarios` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 
-- Dumping data for table AtualizacoesLidas
-- 

/*!40000 ALTER TABLE `AtualizacoesLidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `AtualizacoesLidas` ENABLE KEYS */;

-- 
-- Definition of __EFMigrationsHistory
-- 

DROP TABLE IF EXISTS `__EFMigrationsHistory`;
CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 
-- Dumping data for table __EFMigrationsHistory
-- 

/*!40000 ALTER TABLE `__EFMigrationsHistory` DISABLE KEYS */;
INSERT INTO `__EFMigrationsHistory`(`MigrationId`,`ProductVersion`) VALUES('20260121155307_InitialCreate','9.0.0'),('20260121160150_RelacionamentoProdutoMovimentacao','9.0.0'),('20260121162559_RelacionamentoProdutoMovimentacao2','9.0.0'),('20260121162839_RelacionamentoProdutoMovimentacao3','9.0.0'),('20260121173028_SeedAdmin','9.0.0'),('20260121180013_AtualizaProduto','9.0.0'),('20260121180944_AjusteProdutoMovimentacoes','9.0.0'),('20260121181321_AjusteMovimentacaoProdutoNullable','9.0.0'),('20260121194352_AddFotoProduto','9.0.0'),('20260121200024_AddFotoProduto2','9.0.0'),('20260121201600_AddCamposMovimentacao','9.0.0'),('20260121203234_AddCamposMovimentacao4','9.0.0'),('20260122125129_AddCamposMovimentacao5','9.0.0'),('20260123000435_Auditoria','9.0.0'),('20260123105450_AddMotivoAuditoria','9.0.0'),('20260123110412_AddMotivoAuditoria6','9.0.0'),('20260123222431_AtualizaProdutoModelo','9.0.0'),('20260123233001_AtualizaProdutoModelo3','9.0.0'),('20260123235652_AtualizaProdutoModelo5','9.0.0'),('20260124001518_AtualizaProdutoModelo6','9.0.0'),('20260124113946_InitialCreate2','9.0.0'),('20260124123255_InitialCreate3','9.0.0'),('20260124132110_InitialCreate4','9.0.0'),('20260124133827_InitialCreate5','9.0.0'),('20260124134034_InitialCreate6','9.0.0'),('20260125103840_CreateAtualizacoes','9.0.0'),('20260125104912_CreateAtualizacoes2','9.0.0'),('20260125105304_CreateAtualizacoes3','9.0.0'),('20260125110639_CreateAtualizacoes4','9.0.0'),('20260125111326_CreateAtualizacoes5','9.0.0'),('20260125115835_CreateAtualizacoes6','9.0.0'),('20260125122941_CreateAtualizacoes7','9.0.0'),('20260125123201_CreateAtualizacoes8','9.0.0'),('20260125161332_CreateAtualizacoes9','9.0.0'),('20260125161828_CreateAtualizacoes10','9.0.0'),('20260125162806_CreateAtualizacoes11','9.0.0'),('20260125163507_CreateAtualizacoes12','9.0.0'),('20260125225831_InitialCreate13','9.0.0'),('20260127224417_AddNotificacoesAtivasEUltimoLogin','9.0.0'),('20260128233315_CreateTabelaAtualizacoes','9.0.0'),('20260128234827_CreateTabelaAtualizacoes2','9.0.0'),('20260129000959_CreateTabelaAtualizacoes3','9.0.0'),('20260129002338_CreateTabelaAtualizacoes5','9.0.0');
/*!40000 ALTER TABLE `__EFMigrationsHistory` ENABLE KEYS */;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2026-02-02 12:59:54
-- Total time: 0:0:0:0:277 (d:h:m:s:ms)
