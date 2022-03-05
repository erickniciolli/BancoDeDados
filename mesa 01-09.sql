select `titulo` from `cancao` where titulo like '%z%';

select `titulo` from `cancao` where titulo like '_a%s';

select idPlaylist AS `ID Playlist`, idusuario AS `ID Usuário`, titulo AS `T[itulo`, qtdcancoes AS `Quantidade de canções`, idestado AS `ID Estado`, Datacriacao AS `Data de criação`, Dataexclusao as `Data_de_exclusão` from playlist ORDER BY qtdcancoes DESC;

SELECT * FROM usuario ORDER BY Data_nac LIMIT 5 OFFSET 10;

SELECT * FROM cancao ORDER BY qtdreproducao DESC LIMIT 5;

SELECT * FROM album ORDER BY titulo;

SELECT * FROM album WHERE imagemcapa is null ORDER BY titulo;

INSERT INTO usuario VALUES (20, `novousuariodespotify@gmail.com`, `Elmer Santos`, `15/11/1991`, `Masculino`, `B4129ATF`, `S4321m`, `Brasil`, `1`);

SELECT * FROM genero;

DELETE FROM genero WHERE genero = "Pop";

UPDATE artista SET imagem = "imagem em falta" WHERE imagem is null;
