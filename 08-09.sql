-- tabela faturas

SELECT MAX(valor_total) as maximo_valor from faturas where cidade_cobranca = "Oslo";

SELECT MIN(valor_total) as minimo_valor from faturas;

SELECT AVG(valor_total) as media from faturas where pais_cobranca = "Canada";

SELECT COUNT(id) from faturas where pais_cobranca = "Canada";

select sum(valor_total) from faturas;

select id, data_fatura, valor_total from faturas where valor_total < (select avg(valor_total) from faturas);

-- tabela empregados

select nome, sobrenome, max(data_nascimento) from empregados;

select nome, sobrenome, min(data_nascimento) from empregados;

select id, nome, date_format(`data_nascimento`, "%d %M %y") as data_formatada from empregados;

-- tabela cancoes

select count(id) from cancoes where compositor = "AC/DC";

select avg(duracao_milisegundos) from cancoes;

select avg(bytes) from cancoes where compositor = "AC/DC";

-- tabela clientes

select count(id) from clientes where cidade = "São Paulo";

select count(id) from clientes where cidade = "Paris";

select count(id) from clientes where email like  "%@yahoo%";
