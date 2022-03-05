CREATE SCHEMA IF NOT EXISTS `DHTube`;
USE `DHTube`;

CREATE TABLE IF NOT EXISTS `DHTube`.`PLAYLIST` (
`idPlaylist` INT AUTO_INCREMENT,
`nome` VARCHAR(45),
`dataCriacao` DATETIME,
`Usuario_idUsuario` INT,
PRIMARY KEY (`idPlaylist`)
);

CREATE TABLE IF NOT EXISTS `DHtube`.`VIDEO` (
`idVideo` INT AUTO_INCREMENT,
`Usuario_idUsuario` INT,
`titulo` VARCHAR(100),
`descricao` TEXT,
`tamanho` DOUBLE,
`nomeArquivo` VARCHAR(100),
`duracao` DOUBLE,
`imagem` VARCHAR(100),
`qtdReproducoes` INT,
`qtdLikes` INT,
`qtdDislikes` INT,
`privado` SMALLINT,
`dataPublicacao` DATETIME,
PRIMARY KEY (`idVideo`)
);

CREATE TABLE IF NOT EXISTS `DHtube`.`PLAYLIST_VIDEO` (
`Video_idVideo` INT,
`Playlist_idPlaylist` INT
);

CREATE TABLE IF NOT EXISTS `DHtube`.`PAIS` (
`idPais` INT AUTO_INCREMENT,
`nome` VARCHAR(100),
PRIMARY KEY (`idPais`)
);

CREATE TABLE IF NOT EXISTS `DHTube`.`USUARIO` (
`idUsuario` INT AUTO_INCREMENT,
`nome` VARCHAR(45),
`email` VARCHAR(45),
`senha` VARCHAR(45),
`dataNascimento` DATETIME,
`cep` VARCHAR(45),
`Pais_idPais` INT,
`avata_idAvatar` INT,
PRIMARY KEY (`idUsuario`)
);

CREATE TABLE IF NOT EXISTS `DHTube`.`AVATAR` (
`idAvatar` INT AUTO_INCREMENT,
`nome` VARCHAR(45),
`urlImagem` VARCHAR(100),
PRIMARY KEY (`idAvatar`)
);

CREATE TABLE IF NOT EXISTS `DHTube`.`CANAL` (
`idCanal` INT AUTO_INCREMENT,
`nome` VARCHAR(45),
`descricao` TEXT,
`dataCriacao` DATETIME,
`Usuario_idUsuario` INT,
PRIMARY KEY (`idCanal`)
);

ALTER TABLE `PLAYLIST` ADD CONSTRAINT `FK_Playlist_idUsuario` FOREIGN KEY (`Usuario_idUsuario`)
REFERENCES `DHTube`.`USUARIO` (`idUsuario`);

ALTER TABLE `PLAYLIST_VIDEO` ADD CONSTRAINT `FK_Video_idVideo` FOREIGN KEY (`Video_idVideo`)
REFERENCES `DHTube`.`VIDEO` (`idVideo`);

ALTER TABLE `PLAYLIST_VIDEO` ADD CONSTRAINT `FK_Playlist_idPlaylist` FOREIGN KEY (`Playlist_idPlaylist`)
REFERENCES `DHTube`.`PLAYLIST` (`idPlaylist`);

ALTER TABLE `USUARIO` ADD CONSTRAINT `FK_Pais_idPais` FOREIGN KEY (`Pais_idPais`)
REFERENCES `DHTube`.`Pais` (`idPais`);

ALTER TABLE `USUARIO` ADD CONSTRAINT `FK_Avatar_idAvatar` FOREIGN KEY (`Avata_idAvatar`)
REFERENCES `DHTube`.`AVATAR` (`idAvatar`);

ALTER TABLE `CANAL` ADD CONSTRAINT `FK_Canal_idUsuario` FOREIGN KEY (`Usuario_idUsuario`)
REFERENCES `DHTube`.`USUARIO` (`idUsuario`);

ALTER TABLE `VIDEO` ADD CONSTRAINT `FK_Video_idUsuario` FOREIGN KEY (`Usuario_idUsuario`)
REFERENCES `DHTube`.`USUARIO` (`idUsuario`);

ALTER TABLE `USUARIO` MODIFY COLUMN `Pais_idPais` INT NOT NULL;

ALTER TABLE `USUARIO` MODIFY COLUMN `Avata_idAvatar` INT NOT NULL;

ALTER TABLE `PLAYLIST` MODIFY COLUMN `Usuario_idUsuario` INT NOT NULL;

ALTER TABLE `PLAYLIST_VIDEO` MODIFY COLUMN `video_idVideo` INT NOT NULL;

ALTER TABLE `PLAYLIST_VIDEO` MODIFY COLUMN `Playlist_idPlaylist` INT NOT NULL;

ALTER TABLE `CANAL` MODIFY COLUMN `Usuario_idUsuario` INT NOT NULL;

ALTER TABLE `VIDEO` MODIFY COLUMN `Usuario_idUsuario` INT NOT NULL;


