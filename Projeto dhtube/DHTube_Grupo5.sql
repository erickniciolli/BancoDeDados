-- ******************************************************************************
-- * GRUPO 5 - CARLOS JUNIOR, JONATA SANTOS, GUILHERME TAVARES E WALLACE ASSIS. *
-- ******************************************************************************

CREATE DATABASE IF NOT EXISTS DHTUBE;		
USE DHTUBE;									

CREATE TABLE `avatar` (						
	`idAvatar` INT AUTO_INCREMENT,
    `nome` VARCHAR(45),
    `urlimagem` VARCHAR(100),
    PRIMARY KEY (`idAvatar`)				
);

CREATE TABLE `pais` (
	`idPais` INT AUTO_INCREMENT,
    `nome` VARCHAR(45),
    PRIMARY KEY (`idPais`)
);

CREATE TABLE `usuario` (
	`idUsuario` INT AUTO_INCREMENT,
    `nome` VARCHAR(45),
    `email` VARCHAR(45),
    `senha` VARCHAR(45),
    `dataNascimento` DATETIME,
    `cep` VARCHAR(45),
    `Pais_idPais` INT NOT NULL,
    `Avatar_idAvatar` INT NOT NULL,
    PRIMARY KEY (`idUsuario`),
    CONSTRAINT `FK_usuario_idAvatar` FOREIGN KEY (`Avatar_idAvatar`) REFERENCES `avatar`(`idAvatar`),
    CONSTRAINT `FK_usuario_idPais` FOREIGN KEY (`Pais_idPais`) REFERENCES `pais`(`idPais`)
);

CREATE TABLE `canal` (
	`idCanal` INT AUTO_INCREMENT,
    `nome` VARCHAR(45),
    `descricao` TEXT,
    `dataCriacao` DATETIME,
    `Usuario_idUsuario` INT NOT NULL,
    PRIMARY KEY (`idCanal`),
    CONSTRAINT `FK_canal_idUsuario` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario`(`idUsuario`)
);

CREATE TABLE `playlist` (
	`idPlaylist` INT AUTO_INCREMENT,
    `nome` VARCHAR(45),
    `dataCriacao` DATETIME,
    `privado` SMALLINT(6),
    `Usuario_idUsuario` INT NOT NULL,
    PRIMARY KEY (`idPlaylist`),
    CONSTRAINT `FK_playlist_idUsuario` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario`(`idUsuario`)
);

CREATE TABLE `video` (
	`idVideo` INT AUTO_INCREMENT,
    `titulo` VARCHAR(100),
    `descricao` TEXT,
    `tamanho` DOUBLE,
    `nomeArquivo` VARCHAR(100),
    `duracao` DOUBLE,
    `imagem` VARCHAR(100),
    `qtdReproducoes` INT(11),
    `qtdLikes` INT(11),
    `qtdDislikes` INT(11),
    `privado` SMALLINT(6),
    `dataPublicacao` DATETIME,
    `Usuario_idUsuario` INT NOT NULL,
    PRIMARY KEY (`idVideo`),
    CONSTRAINT `FK_video_idUsuario` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario`(`idUsuario`)
);

CREATE TABLE `playlist_video` (
	`Video_idVideo` INT NOT NULL,
    `Playlist_idPlaylist` INT NOT NULL,
    CONSTRAINT `FK_Video_idVideo` FOREIGN KEY (`Video_idVideo`) REFERENCES `video`(`idVideo`),
	CONSTRAINT `FK_Playlist_idPlaylist` FOREIGN KEY (`Playlist_idPlaylist`) REFERENCES `playlist`(`idPlaylist`)
);








