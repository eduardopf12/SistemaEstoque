-- MySqlBackup.NET 2.6.5.0
-- Dump Time: 2026-01-26 21:23:02
-- --------------------------------------
-- Server version 8.0.45 MySQL Community Server - GPL


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
INSERT INTO `__efmigrationshistory`(`MigrationId`,`ProductVersion`) VALUES('20260121155307_InitialCreate','9.0.0'),('20260121160150_RelacionamentoProdutoMovimentacao','9.0.0'),('20260121162559_RelacionamentoProdutoMovimentacao2','9.0.0'),('20260121162839_RelacionamentoProdutoMovimentacao3','9.0.0'),('20260121173028_SeedAdmin','9.0.0'),('20260121180013_AtualizaProduto','9.0.0'),('20260121180944_AjusteProdutoMovimentacoes','9.0.0'),('20260121181321_AjusteMovimentacaoProdutoNullable','9.0.0'),('20260121194352_AddFotoProduto','9.0.0'),('20260121200024_AddFotoProduto2','9.0.0'),('20260121201600_AddCamposMovimentacao','9.0.0'),('20260121203234_AddCamposMovimentacao4','9.0.0'),('20260122125129_AddCamposMovimentacao5','9.0.0'),('20260123000435_Auditoria','9.0.0'),('20260123105450_AddMotivoAuditoria','9.0.0'),('20260123110412_AddMotivoAuditoria6','9.0.0'),('20260123222431_AtualizaProdutoModelo','9.0.0'),('20260123233001_AtualizaProdutoModelo3','9.0.0'),('20260123235652_AtualizaProdutoModelo5','9.0.0'),('20260124001518_AtualizaProdutoModelo6','9.0.0'),('20260124113946_InitialCreate2','9.0.0'),('20260124123255_InitialCreate3','9.0.0'),('20260124132110_InitialCreate4','9.0.0'),('20260124133827_InitialCreate5','9.0.0'),('20260124134034_InitialCreate6','9.0.0'),('20260125103840_CreateAtualizacoes','9.0.0'),('20260125104912_CreateAtualizacoes2','9.0.0'),('20260125105304_CreateAtualizacoes3','9.0.0'),('20260125110639_CreateAtualizacoes4','9.0.0'),('20260125111326_CreateAtualizacoes5','9.0.0'),('20260125115835_CreateAtualizacoes6','9.0.0'),('20260125122941_CreateAtualizacoes7','9.0.0'),('20260125123201_CreateAtualizacoes8','9.0.0'),('20260125161332_CreateAtualizacoes9','9.0.0'),('20260125161828_CreateAtualizacoes10','9.0.0'),('20260125162806_CreateAtualizacoes11','9.0.0'),('20260125163507_CreateAtualizacoes12','9.0.0'),('20260125225831_InitialCreate13','9.0.0');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;

-- 
-- Definition of atualizacoessistema
-- 

DROP TABLE IF EXISTS `atualizacoessistema`;
CREATE TABLE IF NOT EXISTS `atualizacoessistema` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Titulo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Descricao` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Data` datetime(6) NOT NULL,
  `Tipo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Patrimonio` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ProdutoNome` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table atualizacoessistema
-- 

/*!40000 ALTER TABLE `atualizacoessistema` DISABLE KEYS */;
INSERT INTO `atualizacoessistema`(`Id`,`Titulo`,`Descricao`,`Data`,`Tipo`,`Patrimonio`,`ProdutoNome`) VALUES(1,'Novo produto cadastrado','Produto \'fytf\' foi criado no sistema.','2026-01-25 19:40:36.729044','estoque',NULL,NULL),(2,'Produto cadastrado','Produto \'asdas\' foi criado no sistema.','2026-01-25 19:59:00.731035','produto',NULL,'asdas'),(3,'Produto cadastrado','\nProduto \'dddd\' foi criado no sistema.','2026-01-25 20:03:04.240958','produto',NULL,'dddd'),(4,'Produto cadastrado','\nProduto \'Monitor ThinkCenter\' foi criado no sistema.','2026-01-26 21:22:38.077988','produto',NULL,'Monitor ThinkCenter');
/*!40000 ALTER TABLE `atualizacoessistema` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table auditorias
-- 

/*!40000 ALTER TABLE `auditorias` DISABLE KEYS */;
INSERT INTO `auditorias`(`Id`,`Usuario`,`Acao`,`Produto`,`Quantidade`,`Tipo`,`Patrimonio`,`Data`,`Ip`,`Motivo`) VALUES(1,'Administrador','CREATE','fytf',1,'Produto','','2026-01-25 19:40:36.814137','::1',''),(2,'Administrador','CREATE','asdas',2,'Produto','','2026-01-25 19:59:00.763987','::1',''),(3,'Administrador','CREATE','dddd',12,'Produto','','2026-01-25 20:03:04.314417','::1',''),(4,'Administrador','CREATE','Monitor ThinkCenter',150,'Produto','','2026-01-26 21:22:38.127673','::1','');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table backuplogs
-- 

/*!40000 ALTER TABLE `backuplogs` DISABLE KEYS */;
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
  `Patrimonio` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table produtos
-- 

/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos`(`Id`,`Nome`,`Descricao`,`Estoque`,`Quantidade`,`Foto`,`EstoqueMinimo`,`Patrimonio`) VALUES(1,'fytf','gdsdfsd',1,1,NULL,0,NULL),(2,'asdas','ads',2,2,NULL,0,NULL),(3,'dddd','AS',12,12,NULL,0,NULL),(4,'Monitor ThinkCenter','Monitor ThinkCenter wdadasda',150,150,'d5301f22-cf41-458b-8b74-6788e8d9f1bc.png',0,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table movimentacoes
-- 

/*!40000 ALTER TABLE `movimentacoes` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table usuariologs
-- 

/*!40000 ALTER TABLE `usuariologs` DISABLE KEYS */;
INSERT INTO `usuariologs`(`Id`,`Usuario`,`Acao`,`Alvo`,`Data`) VALUES(1,'Administrador','Criou','Eduardo Pacheco Ferreira','2026-01-26 21:05:16.594427');
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
  `UltimoLogin` datetime(6) DEFAULT NULL,
  `UltimaLeituraAtualizacoes` datetime(6) DEFAULT NULL,
  `AlterarSenhaProximoLogin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table usuarios
-- 

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios`(`Id`,`Nome`,`Email`,`Senha`,`Perfil`,`Ativo`,`UltimoLogin`,`UltimaLeituraAtualizacoes`,`AlterarSenhaProximoLogin`) VALUES(1,'Administrador','admin@admin.com','$2a$11$m1m3yAZR1XRHAiGznJExje3FOE90cIQV/ns8LI7vud5vhRaJWSYsy','Admin',1,NULL,NULL,0),(2,'Eduardo Pacheco Ferreira','eduardo.ferreira@sejus.es.gov.br','$2a$11$0zpIPZ32bRujE4MA68RDXe5lLguOYKLax28WYBSQwWsBeqg7ubu8G','Gerente',1,NULL,NULL,0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- 
-- Definition of atualizacoeslidas
-- 

DROP TABLE IF EXISTS `atualizacoeslidas`;
CREATE TABLE IF NOT EXISTS `atualizacoeslidas` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UsuarioId` int NOT NULL,
  `AtualizacaoSistemaId` int NOT NULL,
  `DataLeitura` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AtualizacoesLidas_AtualizacaoSistemaId` (`AtualizacaoSistemaId`),
  KEY `IX_AtualizacoesLidas_UsuarioId` (`UsuarioId`),
  CONSTRAINT `FK_AtualizacoesLidas_AtualizacoesSistema_AtualizacaoSistemaId` FOREIGN KEY (`AtualizacaoSistemaId`) REFERENCES `atualizacoessistema` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AtualizacoesLidas_Usuarios_UsuarioId` FOREIGN KEY (`UsuarioId`) REFERENCES `usuarios` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table atualizacoeslidas
-- 

/*!40000 ALTER TABLE `atualizacoeslidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `atualizacoeslidas` ENABLE KEYS */;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2026-01-26 21:23:03
-- Total time: 0:0:0:0:262 (d:h:m:s:ms)
