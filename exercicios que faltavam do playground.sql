select * from cancoes, generos
where cancoes.compositor = 'Willie Dixon'
and generos.nome = 'Blues';

select * from cancoes
JOIN generos
ON cancoes.id_genero = generos.id
WHERE generos.nome = 'Rock';

select albuns.titulo, artistas.nome from albuns
JOIN artistas
on albuns.id_artista = artistas.id;

select cancoes.nome, tipos_de_arquivo.nome from cancoes
JOIN tipos_de_arquivo
on cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id;

select distinct titulo from empregados;

select distinct cancoes.nome from cancoes
JOIN cancoes_playlists
on cancoes.id = cancoes_playlists.id_cancao
JOIN playlists
on playlists.id = cancoes_playlists.id_playlist;

select distinct concat ('A música ', cancoes.nome, ' foi composta por ', cancoes.compositor) from cancoes, artistas;

select coalesce (estado_cobranca, pais_cobranca, cep_cobranca) from faturas;

select datediff (data_nascimento, data_contratacao)/365 from empregados;

select * from faturas where id_cliente=2 order by data_fatura DESC;

create view FATURAS_NACIONAIS as
select faturas.id, faturas. id_cliente, clientes.nome, clientes.sobrenome, faturas.valor_total from clientes, faturas;

create view LATINOS as 
select 
artistas.nome as nome_artista,
albuns.titulo,
cancoes.nome as nome_cancao
from artistas
join albuns
on artistas.id = albuns.id_artista
join cancoes
on albuns.id = cancoes.id_album
join generos
on generos.id = cancoes.id_genero
where generos.nome = 'Latin'
order by artistas.nome, cancoes.nome;

CREATE VIEW FATURAS_BRAZIL AS 
select clientes.nome, 
clientes.sobrenome,
faturas.pais_cobranca,
faturas.valor_total,
SUM(faturas.valor_total)
from clientes
join faturas
on clientes.id = faturas.id_cliente
where pais_cobranca = 'Brazil'
group by clientes.id
order by SUM(faturas.valor_total) DESC;

