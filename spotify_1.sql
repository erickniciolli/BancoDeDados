CREATE DATABASE IF NOT EXISTS Spotify
DEFAULT CHARSET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_general_ci';

USE Spotify;

CREATE TABLE IF NOT EXISTS Usuario
(
	nUsuarioID INT UNSIGNED AUTO_INCREMENT,
    strNomeUsuario VARCHAR(45) NULL,
    dtNascimento DATE NULL,
    strSexo CHAR(1),
    strEmail VARCHAR(150) NULL,
    strSenha VARCHAR(45),
    CONSTRAINT PK_Usuario_nUsuarioID PRIMARY KEY (nUsuarioID)
);

INSERT INTO Usuario
VALUES	(DEFAULT,'Daniel', '1992-09-01', 'M', 'dsangelo@dh.com', 'senha'),
		(DEFAULT,'Sangelo', '1992-09-02', 'M', 'dsp@dh.com', 'senha_2'),
        (DEFAULT,'Passos', '1992-09-03', 'M', 'dpassos@dh.com', 'senha_3');

CREATE TABLE Artista
(
	nArtistaID INT UNSIGNED AUTO_INCREMENT,
    strNome VARCHAR(45) NULL,
    strSobrenome VARCHAR(100),
    CONSTRAINT PK_Artista_nArtistaID PRIMARY KEY (nArtistaID)
);

INSERT INTO Artista
VALUES (DEFAULT, 'Tom', 'Holland');

INSERT INTO Artista
VALUES (DEFAULT, 'Daniel', 'Radcliff');

INSERT INTO Artista
VALUES (DEFAULT, 'Marcos', 'Palmeira');

CREATE TABLE Genero
(
	nGeneroID INT UNSIGNED AUTO_INCREMENT,
    strGenero VARCHAR(45),
    PRIMARY KEY (nGeneroID)
);

INSERT INTO Genero
VALUES 	(DEFAULT, 'Sertanejo'),
		(DEFAULT, 'Rock'),
		(DEFAULT, 'Pagode');
        
CREATE TABLE Playlist
(
	nPlaylistID INT UNSIGNED AUTO_INCREMENT,
    nUsuarioID INT UNSIGNED,
    strTitulo VARCHAR(45) NULL,    
    nQtdeCancoes MEDIUMINT,
    dtCriacao DATETIME,
    CONSTRAINT PK_Playlist_nPlaylistID PRIMARY KEY (nPlaylistID),    
    CONSTRAINT FK_nUsuarioID_Usuario FOREIGN KEY (nUsuarioID)
		REFERENCES Usuario (nUsuarioID)
);


CREATE TABLE PlaylistCancao
(
	nPlaylistCancao INT UNSIGNED AUTO_INCREMENT,
    nCancaoID INT UNSIGNED,
    nPlaylistID INT UNSIGNED,
    PRIMARY KEY (nPlaylistCancao),
    CONSTRAINT FK_nPlaylistID_Playlist FOREIGN KEY (nPlaylistID)
		REFERENCES Playlist (nPlaylistID)
);

CREATE TABLE Cancao
(
	nCancaoID INT UNSIGNED AUTO_INCREMENT,
    strTitulo VARCHAR(45),
    nDuracao DOUBLE,
    nQtdeReproducao INT UNSIGNED,
    nQtdeLikes INT UNSIGNED,
    nAlbumID INT UNSIGNED,
    PRIMARY KEY (nCancaoID)
);

ALTER TABLE PlaylistCancao ADD CONSTRAINT Fk_nCancaoID_Cancao FOREIGN KEY (nCancaoID)
	REFERENCES Cancao (nCancaoID);
    
CREATE TABLE Album
(
	nAlbumID INT UNSIGNED AUTO_INCREMENT,
    strTitulo VARCHAR(45),
    nArtistaID INT UNSIGNED,
    PRIMARY KEY (nAlbumID),
    CONSTRAINT FK_nArtistaID_Artista FOREIGN KEY (nArtistaID)
		REFERENCES Artista (nArtistaID)
);

ALTER TABLE Cancao ADD CONSTRAINT Fk_nAlbumID_Cancao FOREIGN KEY (nAlbumID)
	REFERENCES Album (nAlbumID);
    
CREATE TABLE GeneroCancao
(
	nGeneroCancaoID INT UNSIGNED AUTO_INCREMENT,
    nCancaoID INT UNSIGNED,
    nGeneroID INT UNSIGNED,
    CONSTRAINT PK_nGeneroCancaoID PRIMARY KEY (nGeneroCancaoID),
    CONSTRAINT FK_nCancaoID_Cancao_01 FOREIGN KEY (nCancaoID)
		REFERENCES Cancao (nCancaoID),
	FOREIGN KEY (nGeneroID)
		REFERENCES Genero (nGeneroID)
);

















