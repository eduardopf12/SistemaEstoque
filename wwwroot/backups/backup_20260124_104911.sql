-- MySqlBackup.NET 2.6.5.0
-- Dump Time: 2026-01-24 10:49:11
-- --------------------------------------
-- Server version 8.0.43 MySQL Community Server - GPL


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
-- Definition of __efmigrationshistory
-- 

DROP TABLE IF EXISTS `__efmigrationshistory`;
CREATE TABLE IF NOT EXISTS `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table __efmigrationshistory
-- 

/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory`(`MigrationId`,`ProductVersion`) VALUES('20260121155307_InitialCreate','9.0.0'),('20260121160150_RelacionamentoProdutoMovimentacao','9.0.0'),('20260121162559_RelacionamentoProdutoMovimentacao2','9.0.0'),('20260121162839_RelacionamentoProdutoMovimentacao3','9.0.0'),('20260121173028_SeedAdmin','9.0.0'),('20260121180013_AtualizaProduto','9.0.0'),('20260121180944_AjusteProdutoMovimentacoes','9.0.0'),('20260121181321_AjusteMovimentacaoProdutoNullable','9.0.0'),('20260121194352_AddFotoProduto','9.0.0'),('20260121200024_AddFotoProduto2','9.0.0'),('20260121201600_AddCamposMovimentacao','9.0.0'),('20260121203234_AddCamposMovimentacao4','9.0.0'),('20260122125129_AddCamposMovimentacao5','9.0.0'),('20260123000435_Auditoria','9.0.0'),('20260123105450_AddMotivoAuditoria','9.0.0'),('20260123110412_AddMotivoAuditoria6','9.0.0'),('20260123222431_AtualizaProdutoModelo','9.0.0'),('20260123233001_AtualizaProdutoModelo3','9.0.0'),('20260123235652_AtualizaProdutoModelo5','9.0.0'),('20260124001518_AtualizaProdutoModelo6','9.0.0'),('20260124113946_InitialCreate2','9.0.0'),('20260124123255_InitialCreate3','9.0.0'),('20260124132110_InitialCreate4','9.0.0'),('20260124133827_InitialCreate5','9.0.0'),('20260124134034_InitialCreate6','9.0.0');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;

-- 
-- Definition of auditorias
-- 

DROP TABLE IF EXISTS `auditorias`;
CREATE TABLE IF NOT EXISTS `auditorias` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Usuario` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Acao` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Produto` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Quantidade` int NOT NULL,
  `Tipo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Patrimonio` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Data` datetime(6) NOT NULL,
  `Ip` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Motivo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table auditorias
-- 

/*!40000 ALTER TABLE `auditorias` DISABLE KEYS */;
INSERT INTO `auditorias`(`Id`,`Usuario`,`Acao`,`Produto`,`Quantidade`,`Tipo`,`Patrimonio`,`Data`,`Ip`,`Motivo`) VALUES(1,'Administrador','CREATE','MANGA ',2,'Produto','','2026-01-24 09:02:16.995650','::1',''),(2,'Administrador','EDIT','MANGA ',1,'Saida','1','2026-01-24 09:33:29.620549','::1',NULL),(3,'Administrador','AJUSTE DE ESTOQUE','MANGA ',1,'Produto','-','2026-01-24 09:59:14.302665','::1','teste'),(4,'Administrador','EDIT','MANGA ',190,'Produto','','2026-01-24 10:07:36.063228','::1',''),(5,'Administrador','EDIT','MANGA ',2,'Saida','123','2026-01-24 10:07:50.491058','::1',NULL),(6,'Administrador','EDIT','MANGA ',2,'Entrada','123','2026-01-24 10:08:05.753275','::1',NULL),(7,'Administrador','CREATE','MANGA ',1,'Entrada','123','2026-01-24 10:08:21.197532','::1',NULL),(8,'Administrador','DELETE','MANGA ',1,'Entrada','123','2026-01-24 10:11:30.017133','::1',NULL),(9,'Administrador','CREATE','MANGA ',1,'Saida','123','2026-01-24 10:12:06.327386','::1',NULL),(10,'Administrador','EDIT','MANGA ',1,'Produto','','2026-01-24 10:23:03.344549','::1',''),(11,'Administrador','EDIT','MANGA ',2,'Produto','','2026-01-24 10:25:04.401095','::1',''),(12,'Administrador','AJUSTE DE ESTOQUE','MANGA ',2,'Produto','-','2026-01-24 10:25:51.614376','::1','1'),(13,'Administrador','CREATE','teste',2,'Produto','','2026-01-24 10:43:52.766518','::1',''),(14,'Administrador','AJUSTE DE ESTOQUE','teste',2,'Produto','-','2026-01-24 10:44:00.911972','::1','2'),(15,'Administrador','EDIT','MANGA ',2,'Produto','','2026-01-24 10:44:26.615768','::1',''),(16,'Administrador','EDIT','teste',2,'Produto','','2026-01-24 10:44:38.474714','::1',''),(17,'Administrador','EDIT','teste',2,'Produto','','2026-01-24 10:44:58.290968','::1',''),(18,'Administrador','AJUSTE DE ESTOQUE','MANGA ',2,'Produto','-','2026-01-24 10:45:05.184437','::1','1');
/*!40000 ALTER TABLE `auditorias` ENABLE KEYS */;

-- 
-- Definition of backuplogs
-- 

DROP TABLE IF EXISTS `backuplogs`;
CREATE TABLE IF NOT EXISTS `backuplogs` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Acao` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Arquivo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Usuario` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Data` datetime(6) NOT NULL,
  `Status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MensagemErro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table backuplogs
-- 

/*!40000 ALTER TABLE `backuplogs` DISABLE KEYS */;
INSERT INTO `backuplogs`(`Id`,`Acao`,`Arquivo`,`Usuario`,`Data`,`Status`,`MensagemErro`) VALUES(1,'Backup','backup_20260124_104704.sql','Administrador','2026-01-24 10:47:04.484475','Sucesso',NULL),(2,'Excluir Backup','backup_20260124_104704.sql','Administrador','2026-01-24 10:47:10.054510','Sucesso',NULL),(3,'Excluir Backup','backup_20260123_202627.sql','Administrador','2026-01-24 10:49:08.862822','Sucesso',NULL),(4,'Excluir Backup','backup_20260123_203557.sql','Administrador','2026-01-24 10:49:10.892598','Sucesso',NULL);
/*!40000 ALTER TABLE `backuplogs` ENABLE KEYS */;

-- 
-- Definition of produtos
-- 

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Descricao` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Estoque` int NOT NULL,
  `Quantidade` int NOT NULL DEFAULT '0',
  `Foto` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `EstoqueMinimo` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table produtos
-- 

/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos`(`Id`,`Nome`,`Descricao`,`Estoque`,`Quantidade`,`Foto`,`EstoqueMinimo`) VALUES(1,'MANGA ','1',0,2,NULL,0),(2,'teste','1',2,2,NULL,0);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;

-- 
-- Definition of movimentacoes
-- 

DROP TABLE IF EXISTS `movimentacoes`;
CREATE TABLE IF NOT EXISTS `movimentacoes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ProdutoId` int NOT NULL,
  `Tipo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Quantidade` int NOT NULL,
  `Data` datetime(6) NOT NULL,
  `Patrimonio` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Setor` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Unidade` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Foto` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_Movimentacoes_ProdutoId` (`ProdutoId`),
  CONSTRAINT `FK_Movimentacoes_Produtos_ProdutoId` FOREIGN KEY (`ProdutoId`) REFERENCES `produtos` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table movimentacoes
-- 

/*!40000 ALTER TABLE `movimentacoes` DISABLE KEYS */;
INSERT INTO `movimentacoes`(`Id`,`ProdutoId`,`Tipo`,`Quantidade`,`Data`,`Patrimonio`,`Setor`,`Unidade`,`Foto`) VALUES(1,1,'Entrada',2,'2026-01-24 09:27:53.637917','123','GTIC','2',NULL),(3,1,'Saida',1,'2026-01-24 10:12:06.272395','123','GTIC','1',NULL);
/*!40000 ALTER TABLE `movimentacoes` ENABLE KEYS */;

-- 
-- Definition of usuariologs
-- 

DROP TABLE IF EXISTS `usuariologs`;
CREATE TABLE IF NOT EXISTS `usuariologs` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Usuario` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Acao` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Alvo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Data` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table usuariologs
-- 

/*!40000 ALTER TABLE `usuariologs` DISABLE KEYS */;
INSERT INTO `usuariologs`(`Id`,`Usuario`,`Acao`,`Alvo`,`Data`) VALUES(1,'Administrador','Editou','Administrador','2026-01-24 08:58:39.613887'),(2,'Administrador','Editou','Administrador','2026-01-24 08:58:55.081614'),(3,'Administrador','Criou','teste','2026-01-24 08:59:26.235456'),(4,'Administrador','Desativou','teste','2026-01-24 09:00:07.919660'),(5,'Administrador','Ativou','teste','2026-01-24 09:00:08.751710'),(6,'Administrador','Excluiu','teste','2026-01-24 09:54:13.159466');
/*!40000 ALTER TABLE `usuariologs` ENABLE KEYS */;

-- 
-- Definition of usuarios
-- 

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Senha` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Perfil` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Ativo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table usuarios
-- 

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios`(`Id`,`Nome`,`Email`,`Senha`,`Perfil`,`Ativo`) VALUES(1,'Administrador','admin@admin.com','123456','Admin',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2026-01-24 10:49:11
-- Total time: 0:0:0:0:98 (d:h:m:s:ms)
