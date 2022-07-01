/* * * * * * * * * * * * * * * * *

RESUMO SQL - AULAS 10 E 13 DE JUNHO

 * * * * * * * * * * * * * * * * */

-- CREATE TABLE
CREATE TABLE distribuidora.clientes_externos (
	id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	cnpj_cpf VARCHAR(16) NOT NULL,
	endereco VARCHAR(100) NOT NULL,
	tipo_cliente VARCHAR(20) NOT NULL
); 
-- ALTER TABLE (mudando o tipo de variável da coluna 'total' , de decimal(5,2) para decimal(7,2))
ALTER TABLE distribuidora.vendas MODIFY COLUMN total decimal(7,2) NOT NULL;

-- SELECT
SELECT * FROM distribuidora.clientes c ;
SELECT * FROM distribuidora.clientes_externos;

-- INSERT
INSERT into distribuidora.clientes_externos values ('1','marcelo','132.321.55-87','rua x','pf');

-- UPDATE
UPDATE distribuidora.vendas SET descricao = 'smartphone' , total = 23 WHERE id_venda = 2;

-- DELETE
DELETE FROM distribuidora.vendas WHERE descricao='celular';

-- SELECT com alias
SELECT v.descricao, v.total FROM distribuidora.vendas as v;

-- GROUP BY
SELECT descricao FROM distribuidora.vendas GROUP BY descricao;

-- COUNT()
SELECT descricao, count(1) FROM distribuidora.vendas GROUP BY descricao;
SELECT descricao, count(*) FROM distribuidora.vendas GROUP BY descricao;
SELECT descricao, count(descricao) FROM distribuidora.vendas GROUP BY descricao;
SELECT descricao, count(1) quantidade FROM distribuidora.vendas GROUP BY descricao;

-- HAVING 
SELECT descricao, count(1) quantidade 
FROM distribuidora.vendas 
GROUP BY descricao
HAVING count(1) > 1 ;

-- ORDER BY
SELECT * FROM distribuidora.vendas  ORDER BY total;
SELECT * FROM distribuidora.vendas  ORDER BY total ASC;
SELECT * FROM distribuidora.vendas  ORDER BY total DESC;
SELECT descricao from distribuidora.vendas v order by total;
SELECT descricao from distribuidora.vendas v order by descricao;

-- MAX()
SELECT MAX(total)  FROM distribuidora.vendas;
SELECT MAX(descricao),  FROM distribuidora.vendas;
/* SELECT descricao, MAX(total)  FROM distribuidora.vendas; */

-- MIN()
SELECT MIN(total) from distribuidora.vendas;

-- SUBSTRING()
SELECT SUBSTRING(descricao,2,4) from distribuidora.vendas;
SELECT SUBSTRING(descricao,2,4) from distribuidora.vendas WHERE SUBSTRING(descricao,2,4) = 'oteb'; 

-- INNER JOING, LEFT JOIN, RIGHT JOIN e FULL OUTER JOIN
SELECT * FROM distribuidora.vendas v INNER JOIN distribuidora.clientes c ON v.fk_id_cliente = c.id_cliente ;
SELECT nome, descricao FROM distribuidora.vendas v INNER JOIN distribuidora.clientes c ON v.fk_id_cliente = c.id_cliente ;

SELECT nome, descricao, total FROM distribuidora.vendas v 
INNER JOIN distribuidora.clientes c ON v.fk_id_cliente = c.id_cliente ;

-- LEFT JOIN
SELECT * FROM distribuidora.vendas v LEFT JOIN distribuidora.clientes c ON v.fk_id_cliente = c.id_cliente

-- UNION (as duas tabelas devem ter o mesmo número de colunas com os mesmos nomes)
SELECT c.nome, c.endereco from distribuidora.clientes c 
UNION
select ce.nome, ce.endereco from distribuidora.clientes_externos ce ;


SELECT * from distribuidora.clientes c UNION SELECT * from distribuidora.clientes_externos ce ;

-- SUBQUERY e LIMIT 1

SELECT * from ( SELECT c.nome , count(1) total from distribuidora.vendas v
INNER JOIN distribuidora.clientes c ON v.fk_id_cliente = c.id_cliente 
group by v.fk_id_cliente 
LIMIT 1 ) subquery ;

-- ORDER BY (com ASC ou DESC)
select forma_pagamento, count(1) quantidade from distribuidora.forma_pagamento fp 
group by forma_pagamento order by quantidade ASC  limit 1;

-- SUM()
SELECT nome, SUM(total) from distribuidora.vendas v
INNER JOIN distribuidora.clientes c on v.fk_id_cliente  =c.id_cliente 
group by v.fk_id_cliente limit 1;

-- UNION
select * from distribuidora.clientes c 
UNION
SELECT * FROM distribuidora.clientes_externos ce ;

-- INNER JOIN (com mais de duas tabelas)
SELECT * FROM distribuidora.vendas v 
INNER JOIN distribuidora.clientes c ON v.fk_id_cliente  = c.id_cliente  
INNER JOIN distribuidora.forma_pagamento fp ON v.fk_id_forma_pagamento = fk_id_forma_pagamento 
WHERE v.total >= 50;
 
-- MAX()
SELECT nome, max(total) FROM ( SELECT clientes.nome, sum(total) total
FROM vendas INNER JOIN clientes on vendas.fk_id_cliente = clientes.id_cliente
GROUP BY vendas.fk_id_cliente) as nome_qualquer; 

-- SUBQUERY
SELECT c.nome, count(1) total from distribuidora.vendas v 
inner join distribuidora.clientes c on c.id_cliente  = v.fk_id_cliente 
GROUP BY v.fk_id_cliente 
HAVING COUNT(1) = (
	SELECT max(total) as total from (
		SELECT c.nome, COUNT(1) total FROM distribuidora.vendas v
		INNER JOIN distribuidora.clientes c ON c.id_cliente = v.fk_id_cliente GROUP BY v.fk_id_cliente 
		) subquery
	);

-- VIEW
CREATE VIEW distribuidora.clientes_geral AS
SELECT c.nome, c.cnpj_cpf FROM distribuidora.clientes c
UNION SELECT ce.nome_clientes, ce.cnpj FROM distribuidora.clientes_externos ce; 

CREATE VIEW dist_prod AS
SELECT * FROM distribuidora.distribuidores d 
INNER JOIN distribuidora.produtos p
ON p.fk_id_distribuidor = d.id_distribuidor ;

SELECT * FROM dist_prod;








