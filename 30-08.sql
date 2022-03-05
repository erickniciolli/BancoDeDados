CREATE DATABASE IF NOT EXISTS `DHTube`;

USE `DHTube` ;

CREATE TABLE IF NOT EXISTS `DHTube`.`usuario` (
`idUsuario`INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`nome` VARCHAR(45) NULL,
`email` VARCHAR(45) NULL,
`senha` VARCHAR(45) NULL,
`dataNascimento` DATETIME NULL,
`cep` VARCHAR(45) NULL,
`Pais_idPais`INT(11) NOT NULL,
`Avatar_idAvatar` INT(11) NOT NULL
);

ALTER TABLE `usuario` ADD CONSTRAINT `FK_Avatar_idAvatar3` FOREIGN KEY (`Avatar_idAvatar`) REFERENCES avatar(`idAvatar`);

ALTER TABLE `usuario` ADD CONSTRAINT `FK_Pais_idPais` FOREIGN KEY (`Pais_idPais`) REFERENCES pais(`idpais`);


CREATE TABLE IF NOT EXISTS `DHTube`.`playlist` (
`idPlaylist` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`nome` VARCHAR(45) NULL,
`dataCriacao` DATETIME NULL,
`privado` SMALLINT(6),
`Usuario_idUsuario` INT (11)
);

ALTER TABLE `playlist` ADD CONSTRAINT `FK_Usuario_idUsuario` foreign key (`Usuario_idUsuario`) REFERENCES usuario(`idUsuario`);

CREATE TABLE IF NOT EXISTS `pais` (
`idpais` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`nome` VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS `DHTube`.`playlist_video` (
`Video_idVideo` INT(11) NOT NULL,
`Playlist_idPlaylist` INT(11) NOT NULL
);

ALTER TABLE `playlist_video` ADD CONSTRAINT `FK_video_idvideo` FOREIGN KEY (`Video_idVideo`) REFERENCES Video(`idVideo`);

ALTER TABLE `playlist_video` ADD CONSTRAINT `FK_Playlist_idPlaylist3` FOREIGN KEY (`Playlist_idPlaylist`) REFERENCES playlist(`idPlaylist`);


CREATE TABLE `DHTube`.`avatar` (
`idAvatar` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`nome` VARCHAR(45),
`urlimagem` VARCHAR(100)
);

CREATE TABLE `DHTube`.`canal` (
idCanal INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`nome` VARCHAR(45),
`descricao` TEXT,
`dataCriacao` DATETIME,
`Usuario_idUsuario` INT(11) NOT NULL
);

ALTER TABLE `canal` ADD CONSTRAINT `fk_Usuario_idUsuario_canal` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES usuario(`idUsuario`);

CREATE TABLE `DHTube`.`Video` (
`idVideo` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`Usuario_idUsuario` INT(11) NOT NULL,
`titulo` VARCHAR(100),
`descricao` TEXT,
`tamanho` DOUBLE,
`nomeArquivo` VARCHAR(100),
`DURACAO` double,
`imagem` VARCHAR(100),
`qtdReproducoes` INT(11),
`qtdLikes` INT(11),
`qtdDislikes` INT(11),
`privado` SMALLINT(6),
`dataPublicacao` DATETIME
);

ALTER TABLE `Video` ADD CONSTRAINT `FK_Usuario_idUsuario_video` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`);
