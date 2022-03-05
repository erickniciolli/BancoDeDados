select count(id) from clientes group by pais having pais like 'Br%';

select count(id) from cancoes group by id_genero having id_genero=6;

select sum(valor_total) from faturas;

select id_album, avg(duracao_milisegundos) from cancoes group by id_album;

select min(bytes) from cancoes;

select id_cliente, sum(valor_total) as total from faturas group by id_cliente having total > 45