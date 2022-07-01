-- UNION
select * from distribuidora.clientes c 
UNION
SELECT * FROM distribuidora.clientes_externos ce ;

-- UNION (com mais de duas tabelas)
SELECT * FROM distribuidora.vendas v 
INNER JOIN distribuidora.clientes c ON v.fk_id_cliente  = c.id_cliente  
INNER JOIN distribuidora.forma_pagamento fp ON v.fk_id_forma_pagamento = fk_id_forma_pagamento 
WHERE v.total >= 50;
 
-- MAX()
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT nome, max(total) FROM ( SELECT clientes.nome, sum(total) total
FROM vendas INNER JOIN clientes on vendas.fk_id_cliente = clientes.id_cliente
GROUP BY vendas.fk_id_cliente) as nome_qualquer; 

SELECT max(total) as total from (
	SELECT c.nome, COUNT(1) total FROM distribuidora.vendas v
	INNER JOIN distribuidora.clientes c ON c.id_cliente = v.fk_id_cliente GROUP BY v.fk_id_cliente 
	) subquery

SELECT * FROM distribuidora.vendas v 
WHERE fk_id_cliente in (
	SELECT fk_id_cliente from distribuidora.clientes c 
	WHERE tipo_cliente = 'PF'
);


SELECT
	max(total) as total
from
	(
	SELECT
		c.nome,
		COUNT(1) total
	FROM
		distribuidora.vendas v
	INNER JOIN distribuidora.clientes c ON
		c.id_cliente = v.fk_id_cliente
	GROUP BY
		v.fk_id_cliente 
		) subquery
		
		

SELECT c.nome, count(1) total from distribuidora.vendas v 
inner join distribuidora.clientes c on c.id_cliente  = v.fk_id_cliente 
GROUP BY v.fk_id_cliente 
HAVING COUNT(1) = (
	SELECT max(total) as total from (
		SELECT c.nome, COUNT(1) total FROM distribuidora.vendas v
		INNER JOIN distribuidora.clientes c ON c.id_cliente = v.fk_id_cliente GROUP BY v.fk_id_cliente 
		) subquery
	);

SELECT c.nome, COUNT(1) total from distribuidora.vendas v 
INNER JOIN distribuidora.clientes c on c.id_cliente = v.fk_id_cliente 
GROUP BY v.fk_id_cliente 
ORDER BY total desc;

/* ERRO
 *
SELECT forma_pagamento , min(total) from
( select forma_pagamento , count(1) total from distribuidora.vendas v 
	inner join distribuidora.forma_pagamento fp on v.fk_id_forma_pagamento = fp.id_forma_pagamento
	group by fk_id_forma_pagamento ) sub ;

 
SQL Error [1140] [42000]: 
In aggregated query without GROUP BY, 
expression #1 of SELECT list contains 
nonaggregated column 'sub.forma_pagamento'; 
this is incompatible with sql_mode=only_full_group_by

 
SQL Error [1140] [42000]: 
In aggregated query without GROUP BY, 
expression #1 of SELECT list contains 
nonaggregated column 'nome_qualquer.nome'; 
this is incompatible with sql_mode=only_full_group_by

*/

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


-- CREATE VIEW
CREATE view distribuidora.clientes_geral 
as
select * from distribuidora.clientes c 
UNION
SELECT * FROM distribuidora.clientes_externos ce ;

SELECT * from distribuidora.clientes_geral;


--  EXERCÍCIOS

CREATE VIEW distribuidora.clientes_geral 
AS
SELECT c.nome, c.cnpj_cpf FROM distribuidora.clientes c
UNION
SELECT ce.nome_clientes, ce.cnpj FROM distribuidora.clientes_externos ce; 

/*  QUAL DISTRIBUIDOR POSSUI MAIS PRODUTOS CADASTRADOS NA BASE DE DADOS?
QUAL O PRODUTO MAIS VENDIDO NA BASE DE DADOS ?
QUAIS VENDAS TEM A FORMA DE PAGAMENTO IGUAL A BOLETO? DEVE USAR SUBQUERY

CRIAR UMA VIEW COM ALGUMA CONSULTA */


INSERT INTO distribuidora.produtos(preco_custo
,preco_venda,data_validade,descricao, fk_id_distribuidor) 
values(200.00, 400.00, '2022-07-22', 'pack cervejas',2);

INSERT INTO distribuidora.produtos(preco_custo
,preco_venda,data_validade,descricao, fk_id_distribuidor) 
values(100.00, 300.00, '2023-07-22', 'pack refrigerantes',3);

INSERT INTO distribuidora.produtos(preco_custo
,preco_venda,data_validade,descricao, fk_id_distribuidor) 
values(200.00, 400.00, '2022-08-22', 'pack suco de laranja',1);



select * from distribuidora.distribuidores d ;

SELECT * FROM distribuidora.produtos p  ;

-- QUAL DISTRIBUIDOR POSSUI MAIS PRODUTOS CADASTRADOS NA BASE DE DADOS?

SELECT razao_social from (select d.razao_social , count(1) total from distribuidora.produtos p 
inner join distribuidora.distribuidores d on p.fk_id_distribuidor = d.id_distribuidor 
group BY p.fk_id_distribuidor order by total DESC 
) alias limit 1 ;

-- CRIAR UMA VIEW


create view dist_prod as
select * from distribuidora.distribuidores d 
inner join distribuidora.produtos p
on p.fk_id_distribuidor = d.id_distribuidor ;

SELECT *
FROM distribuidora.distribuidores d 
left join distribuidora.produtos p 
on p.fk_id_distribuidor = d.id_distribuidor
order by id_distribuidor 

union

SELECT *
FROM distribuidora.distribuidores d 
right join distribuidora.produtos p 
on p.fk_id_distribuidor = d.id_distribuidor
order by id_distribuidor ;


CREATE view  Dist_Prod_Itens as
select * from dist_prod dp 
inner join itens_venda iv 
on iv.fk_id_produtos = id_produtos; 


SELECT razao_social, descricao from distribuidora.dist_prod ;

select razao_social, descricao, quantidade from Dist_Prod_Itens ;




-- QUAL O PRODUTO MAIS VENDIDO NA BASE DE DADOS ?









-- QUAL O PRODUTO MAIS VENDIDO NA BASE DE DADOS ?


SELECT * from (select itens_venda.quantidade  , count(1) total from distribuidora.itens_venda iv  
inner join distribuidora.vendas v on iv.fk_id_venda = v.id_venda
group BY iv.fk_id_venda order by total DESC 
) alias limit 1 ;



































