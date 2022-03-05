-- Entidade playlist --------------------------------------------------------------------------------------------------------
CREATE TABLE `playlist`
(
`idPlaylist` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`nome` VARCHAR(45),
`dataCriacao` DATETIME,
`privado` SMALLINT(6),

`Usuario_idUsuario` INT(11) NOT NULL
);

ALTER TABLE `playlist`
ADD CONSTRAINT `fk_Usuario_idUsuario` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`);
-- Final playlist ------------------------------------------------------------------------------------------------------------

-- Entidade playlist_video ---------------------------------------------------------------------------------------------------
CREATE TABLE `playlist_video`
(
`Video_idVideo` INT(11) NOT NULL,
`Playlist_idPlaylist` INT(11) NOT NULL
);

ALTER TABLE `playlist_video`
ADD CONSTRAINT `fk_Playlist_idPlaylist` FOREIGN KEY (`Playlist_idPlaylist`) REFERENCES `playlist` (`idPlaylist`);

ALTER TABLE `playlist_video`
ADD CONSTRAINT `fk_Video_idVideo` FOREIGN KEY (`Video_idVideo`) REFERENCES `video` (`idVideo`);

-- Final playlist_video ------------------------------------------------------------------------------------------------------

-- Entidade pais -------------------------------------------------------------------------------------------------------------
CREATE TABLE `pais`
(
`idPais` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`nome` VARCHAR(100)
);
-- Final pais -----------------------------------------------------------------------------------------------------------------

-- Entidade usuario -----------------------------------------------------------------------------------------------------------
CREATE TABLE `usuario`
(
`IdUsuario` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`nome` VARCHAR(45),
`email` VARCHAR(45),
`senha` VARCHAR(45),
`dataNascimento` DATETIME,
`cep` VARCHAR(45),

`Pais_idPais` INT(11),
`Avatar_idAvatar` INT(11)
);

ALTER TABLE `usuario`
ADD CONSTRAINT `fk_Pais_idPais` FOREIGN KEY (`Pais_idPais`) REFERENCES `pais` (`idPais`);

ALTER TABLE `usuario`
ADD CONSTRAINT `fk_Avatar_idAvatar` FOREIGN KEY (`Avatar_idAvatar`) REFERENCES `avatar` (`idAvatar`);

ALTER TABLE `usuario` MODIFY `Pais_idPais` INT NOT NULL;
ALTER TABLE `usuario` MODIFY `Avatar_idAvatar` INT NOT NULL;
-- Final usuario -------------------------------------------------------------------------------------------------------------

-- Entidade avatar -----------------------------------------------------------------------------------------------------------
CREATE TABLE `avatar`
(
`IdAvatar` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`nome` VARCHAR(45),
`urlimagem` VARCHAR(100)
);
-- Final avatar ---------------------------------------------------------------------------------------------------------------

-- Entidade canal -------------------------------------------------------------------------------------------------------------
CREATE TABLE `canal`
(
`IdCanal` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`nome` VARCHAR(45),
`descricao` TEXT,
`dataCriacao` DATETIME,

`Usuario_idUsuario` INT(11) NOT NULL
);

ALTER TABLE `canal`
ADD CONSTRAINT `fk2_Usuario_idUsuario` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`);
-- Final canal -----------------------------------------------------------------------------------------------------------------

-- Entidade video --------------------------------------------------------------------------------------------------------------
CREATE TABLE `video`
(
`IdVideo` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`Usuario_idUsuario` INT(11) NOT NULL,
`titulo` VARCHAR(45),
`descricao` TEXT,
`tamanho` DOUBLE,
`nomeArquivo` VARCHAR(100),
`duracao` DOUBLE,
`imagem` VARCHAR(100),
`qtdReproducoes` INT(11),
`qtdLikes` INT(11),
`qtdDislikes` INT(11),
`privado` SMALLINT(6),
`dataPublicacao` DATETIME
);


ALTER TABLE `video`
ADD CONSTRAINT `fkvideo_Usuario_idUsuario` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`);
-- Final video -----------------------------------------------------------------------------------------------------------------




