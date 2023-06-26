DROP DATABASE IF EXISTS `bomcorte`;
CREATE DATABASE IF NOT EXISTS `bomcorte` CHARSET utf8;

USE `bomcorte`;

DROP TABLE IF EXISTS `tipoUsuario`;
CREATE TABLE `tipoUsuario` (
	`idTipoUsuario`	INT NOT NULL auto_increment, 
	`tipoUsuario`	VARCHAR(20), -- {'Cliente' = 1, 'Funcionários' = 2, 'Gerente' = 3, 'Administrador' = 4, 'Douglas' = 5}
    PRIMARY KEY (`idTipoUsuario`)
);

INSERT INTO `tipoUsuario` ( `tipoUsuario` ) values ('Cliente');
INSERT INTO `tipoUsuario` ( `tipoUsuario` ) values ('Funcionários');
INSERT INTO `tipoUsuario` ( `tipoUsuario` ) values ('Gerente');
INSERT INTO `tipoUsuario` ( `tipoUsuario` ) values ('Administrador');
INSERT INTO `tipoUsuario` ( `tipoUsuario` ) values ('Douglas');

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
	`idUsuario` 	INT NOT NULL auto_increment, 
    `nome`			VARCHAR(50)  NOT NULL, 
	`email`			VARCHAR(100) UNIQUE, 
    `senha`			VARCHAR(64)  NOT NULL UNIQUE, 
    `telefone`		VARCHAR(15)	 NOT NULL, 
    `cpf`			VARCHAR(14)  NOT NULL, 
    `foto`			VARCHAR(100) DEFAULT NULL,
    `idTipoUsuario`	INT	         DEFAULT '1', 
	PRIMARY KEY (`idUsuario`),
    FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipoUsuario` (`idTipoUsuario`)
);

INSERT INTO `bomcorte`.`usuario` (`idUsuario`, `nome`, `email`, `senha`, `telefone`, `cpf`, `foto`, `idTipoUsuario`) values ( 1, 'Douglas de Souza Soares', 'bom.corte.ds@gmail.com', '997036007', '+5511941950606', '40737536810', '0', '5');
INSERT INTO `bomcorte`.`usuario` (`idUsuario`, `nome`, `email`, `senha`, `telefone`, `cpf`, `foto`, `idTipoUsuario`) values ( 2, 'Sistema', 'bom.corte.naoresponda@gmail.com', 'oBOMn3CORTEqq', '+5511956704687', '00000000000', '0', '4');

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
	`idCategoria`	INT NOT NULL auto_increment, 
	`descricao`		VARCHAR(30), 
    PRIMARY KEY (`idCategoria`)
);

INSERT INTO `categoria` (`descricao`) values ('Corte Adulto');
INSERT INTO `categoria` (`descricao`) values ('Corte Infantil');
INSERT INTO `categoria` (`descricao`) values ('Pinturas e Outros');

DROP TABLE IF EXISTS `corte`;
CREATE TABLE `corte` (
	`idCorte`		INT NOT NULL auto_increment, 
	`nome`			VARCHAR(50)  NOT NULL, 
    `preco`			DECIMAL(6,2), 
    `preco2`		DECIMAL(6,2), 
    `idCategoria`	int, 
    PRIMARY KEY (`idcorte`), 
    FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`)
);

INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Corte com degrade na gilete', '40.00', '30.00', '1');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Corte com degrade', '30.00', '25.00', '1');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Corte sem degrade simples', '25.00', '20.00', '1');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Corte so maquininha e pezinho', '20.00', '15.00', '1');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Corte e barba sem degrade', '45.00', '35.00', '1');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Corte e barba com degrade', '50.00', '40.00', '1');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Corte e barba com degrade na gilete', '60.00', '45.00', '1');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Alisamento', '25.00', '20.00', '3');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Barba', '20.00', '15.00', '3');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Corte com luzes', '60.00', '50.00', '3');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Corte com pigmentacao completa', '60.00', '50.00', '3');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Corte com pintura', '60.00', '50.00', '3');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Corte com progressiva', '70.00', '70.00', '3');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Corte com progressiva e barba', '90.00', '80.00', '1');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Corte infantil com degrade', '25.00', '20.00', '2');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Corte infantil simples', '20.00', '15.00', '2');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Corte e platinado', '100.00', '100.00', '3');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Luzes', '30.00', '25.00', '3');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Pigmentacao', '30.00', '30.00', '3');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Pintura', '30.00', '25.00', '3');
INSERT INTO `bomcorte`.`corte` (`nome`, `preco`, `preco2`, `idCategoria`) VALUES ('Progressiva', '50.00', '50.00', '3');

DROP TABLE IF EXISTS `agendamento`;
CREATE TABLE `agendamento` (
	`idAgendamento`	INT NOT NULL AUTO_INCREMENT,
	`nome`			VARCHAR(50)  NOT NULL, 
	`cpf`			VARCHAR(14)  NOT NULL, 
	`data`      	DATE, -- VARCHAR(10), -- YYYY/MM/DD
	`idCorte`    	INT, 
    `barbeiro`    	varchar(20), 
    `descricao`		TEXT, 
    `horario`     	VARCHAR(5),
    `idUsuario`   	INT, 
	PRIMARY KEY (`idAgendamento`), 
    FOREIGN KEY (`idUsuario`) REFERENCES usuario (`idUsuario`), 
	FOREIGN KEY (`idCorte`) REFERENCES corte (`idCorte`)
);

INSERT INTO `agendamento`(`idAgendamento`, `nome`, `cpf`, `data`, `idCorte`, `barbeiro`, `horario`, `idUsuario`) 
VALUES ("9", "Tiago Victor Vicente Santos", "87823848023", "2021-02-12", "8", "douglas", "15:40", "1");

INSERT INTO `agendamento`(`idAgendamento`, `nome`, `cpf`, `data`, `idCorte`, `barbeiro`, `horario`, `idUsuario`) 
VALUES ("12", "Tiago Victor Vicente Santos", "87823848023", "2021-02-18", "15", "douglas", "16:00", "1");

INSERT INTO `agendamento`(`idAgendamento`, `nome`, `cpf`, `data`, `idCorte`, `barbeiro`, `horario`, `idUsuario`) 
VALUES ("13", "Tiago Victor Vicente Santos", "87823848023", "2021-02-17", "20", "douglas", "16:00", "1");

INSERT INTO `agendamento`(`idAgendamento`, `nome`, `cpf`, `data`, `idCorte`, `barbeiro`, `horario`, `idUsuario`)
VALUES ("25", "Tiago Victor Vicente", "87823848023", "2021-02-12", "14", "artur", "9:20", "1");

INSERT INTO `agendamento`(`idAgendamento`, `nome`, `cpf`, `data`, `idCorte`, `barbeiro`, `descricao`, `horario`,`idUsuario`) 
VALUES ("29", "Tiago Victor", "87823848023", "2021-02-12", "7", "kevin", "Olá amig", "13:40", "1");

INSERT INTO `agendamento`(`idAgendamento`, `nome`, `cpf`, `data`, `idCorte`, `barbeiro`, `descricao`, `horario`,`idUsuario`) 
VALUES ("30", "Tiago Victor", "87823848023", "2021-02-12", "7", "kevin", "Olá amig", "13:40", "1");

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
	`idProduto`		INT NOT NULL auto_increment, 
    `nome`			VARCHAR(100), 
    `preco`			Decimal(6,2),
    `marca`			VARCHAR(100), 
    `fabricante`	VARCHAR(100), 
    `modelo`		VARCHAR(100), 
    `idCategoria`	INT, 
    `dtFabricacao`	DATE, -- VARCHAR(10), -- YYYY/MM/DD
    `validade`      DATE,
    `descricao`		TEXT,
    `unidades` 		INT,
    PRIMARY KEY (`idProduto`),
    FOREIGN KEY (`idCategoria`) REFERENCES categoria (`idCategoria`)
);

DROP VIEW IF EXISTS `view_agendamento`;
CREATE VIEW `view_agendamento` AS 
	SELECT 
		`a`.`idAgendamento`,
        `a`.`data`,
        `a`.`barbeiro`,
        `a`.`descricao`,
        `a`.`horario`,
        `c`.`nome` 
	AS 
		`corte`,
        `c`.`preco`,
        `c`.`preco2`, 
        `u`.`nome`,
        `u`.`email`,
        `u`.`telefone`,
        `u`.`cpf`, 
        `k`.`descricao` 
	AS `categoria`
	FROM `agendamento` as `a`, `corte` as `c`, `usuario` as `u`, `categoria` as `k`
	WHERE `a`.`idUsuario` = `u`.`idUsuario`
		AND `a`.`idCorte` = `c`.`idCorte`
	AND `c`.`idCategoria` = `k`.`idCategoria`
	AND `a`.`data` >= NOW();







