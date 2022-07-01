SELECT * FROM distribuidora.vendas;
select * FROM world.city;

SELECT * FROM distribuidora.clientes;

UPDATE distribuidora.vendas SET descricao = 'smartphone' , total = 23 WHERE id_venda = 2;
INSERT INTO distribuidora.vendas (descricao, hora, total, fk_id_cliente, fk_id_forma_pagamento) VALUES ( 'celular', NOW(), '45', '1', '2');
INSERT INTO distribuidora.vendas (descricao, hora, total, fk_id_cliente, fk_id_forma_pagamento) VALUES ('notebook',CURRENT_TIMESTAMP,'87','1','2');

DELETE FROM distribuidora.vendas WHERE descricao='celular';

SELECT vendas.descricao, vendas.total FROM distribuidora.vendas;

SELECT v.descricao, v.total FROM distribuidora.vendas as v;

SELECT v.descricao, v.total FROM distribuidora.vendas v;

SELECT descricao FROM distribuidora.vendas GROUP BY descricao;

SELECT descricao, count(1) FROM distribuidora.vendas GROUP BY descricao;
SELECT descricao, count(*) FROM distribuidora.vendas GROUP BY descricao;
SELECT descricao, count(descricao) FROM distribuidora.vendas GROUP BY descricao;

SELECT descricao, count(1) quantidade FROM distribuidora.vendas GROUP BY descricao;

SELECT descricao, count(1) quantidade 
FROM distribuidora.vendas 
GROUP BY descricao
HAVING count(1) > 1 ;


SELECT descricao, count(1) quantidade 
FROM distribuidora.vendas 
GROUP BY descricao
HAVING count(1) > 2 ;

SELECT * FROM distribuidora.vendas  ORDER BY total;
SELECT * FROM distribuidora.vendas  ORDER BY total ASC;
SELECT * FROM distribuidora.vendas  ORDER BY total DESC;
SELECT descricao from distribuidora.vendas v order by total;
SELECT descricao from distribuidora.vendas v order by descricao;
SELECT MAX(total)  FROM distribuidora.vendas;
SELECT MAX(descricao),  FROM distribuidora.vendas;
/* SELECT descricao, MAX(total)  FROM distribuidora.vendas; */
SELECT descricao, total FROM distribuidora.vendas;
select MIN(total) from distribuidora.vendas;
SELECT SUM(total) from distribuidora.vendas; 
SELECT SUBSTRING(descricao,2,4) from distribuidora.vendas;
SELECT SUBSTRING(descricao,2,4) from distribuidora.vendas WHERE SUBSTRING(descricao,2,4) = 'oteb'; 

/* união de tabelas usando INNER JOIN, LEFT JOIN, RIGHT JOIN E FULL OUTER JOIN */

SELECT * FROM distribuidora.vendas v 
INNER JOIN distribuidora.clientes c 
ON v.fk_id_cliente = c.id_cliente ;

SELECT nome, descricao FROM distribuidora.vendas v 
INNER JOIN distribuidora.clientes c 
ON v.fk_id_cliente = c.id_cliente ;

SELECT nome, descricao, total FROM distribuidora.vendas v 
INNER JOIN distribuidora.clientes c 
ON v.fk_id_cliente = c.id_cliente ;

/*  select nome, id_cliente  FROM distribuidora.clientes c 
LEFT JOIN distribuidora.vendas v on v.fk_id_cliente  = c.id_cliente WHERE id_venda = NULL ;
*/

CREATE TABLE distribuidora.clientes_externos (
	id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	cnpj_cpf VARCHAR(16) NOT NULL,
	endereco VARCHAR(100) NOT NULL,
	tipo_cliente VARCHAR(20) NOT NULL
); 

SELECT * FROM distribuidora.clientes c ;
SELECT * FROM distribuidora.clientes_externos;

INSERT into distribuidora.clientes_externos values ('1','marcelo','132.321.55-87','rua x','pf');


SELECT c.nome, c.endereco from distribuidora.clientes c 
UNION
select ce.nome, ce.endereco from distribuidora.clientes_externos ce ;


SELECT * from distribuidora.clientes c 
UNION
select * from distribuidora.clientes_externos ce ;


/*  
Qual cliente tem mais vendas?
Qual forma de pagamento foi menos utilizada em vendas?
Quais são os clientes cadastrados que nunca efetuaram compra ?
Qual o nome do cliente que gastou mais dinheiro em compras?
Existem quantos clientes PF e quantos Clientes PJ?
Qual total de vendas efetuadas até hoje ?  */

-- Qual cliente tem mais vendas?

SELECT c.nome , count(1) from distribuidora.vendas v
INNER JOIN distribuidora.clientes c ON v.fk_id_cliente = c.id_cliente 
group by v.fk_id_cliente  ;

SELECT c.nome , count(1) total from distribuidora.vendas v
INNER JOIN distribuidora.clientes c ON v.fk_id_cliente = c.id_cliente 
group by v.fk_id_cliente  
limit 1 ;

SELECT c.nome , count(1) total from distribuidora.vendas v
INNER JOIN distribuidora.clientes c ON v.fk_id_cliente = c.id_cliente 
group by v.fk_id_cliente 
limit 1 ;

SELECT * from ( SELECT c.nome , count(1) total from distribuidora.vendas v
INNER JOIN distribuidora.clientes c ON v.fk_id_cliente = c.id_cliente 
group by v.fk_id_cliente 
limit 1 ) subquery_alias ;

SELECT * from ( SELECT c.nome , count(1) total from distribuidora.vendas v
INNER JOIN distribuidora.clientes c ON v.fk_id_cliente = c.id_cliente 
group by v.fk_id_cliente ) subquery_alias ;

SELECT  MAX(total) FROM ( SELECT c.nome , count(1) total from distribuidora.vendas v
INNER JOIN distribuidora.clientes c ON v.fk_id_cliente = c.id_cliente 
group by v.fk_id_cliente ) subquery_alias ;

SELECT  MAX(total) total FROM ( SELECT c.nome , count(1) total from distribuidora.vendas v
INNER JOIN distribuidora.clientes c ON v.fk_id_cliente = c.id_cliente 
group by v.fk_id_cliente ) subquery_alias ;

SELECT nome, total FROM ( SELECT c.nome , count(1) total from distribuidora.vendas v
INNER JOIN distribuidora.clientes c ON v.fk_id_cliente = c.id_cliente 
group by v.fk_id_cliente ) subquery_alias ;

SELECT nome, max(total) FROM (
SELECT c.nome, count(1) total FROM distribuidora.vendas v
INNER JOIN distribuidora.clientes c ON c.id_cliente = v.fk_id_cliente  GROUP BY v.fk_id_cliente 
) subquery ;

INSERT into forma_pagamento (forma_pagamento) values ('pix');
INSERT into forma_pagamento (forma_pagamento) values ('cartão de crédito');

SELECT * from distribuidora.forma_pagamento fp ;

select forma_pagamento, count(1) q from distribuidora.forma_pagamento fp 
group by forma_pagamento order by q ASC;

select forma_pagamento, count(1) quantidade from distribuidora.forma_pagamento fp 
group by forma_pagamento order by quantidade ASC  limit 1;

SELECT nome, SUM(total) from distribuidora.vendas v
INNER JOIN distribuidora.clientes c on v.fk_id_cliente  =c.id_cliente 
group by v.fk_id_cliente limit 1;








