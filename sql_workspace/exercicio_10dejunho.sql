/* * * * * * * * *  
 *               *
 *  EXERCÍCIOS   * 
 *               *
 * * * * * * * * */

-- Qual cliente tem mais vendas?

SELECT nome FROM ( SELECT c.nome , COUNT(1) total FROM distribuidora.vendas v
INNER JOIN distribuidora.clientes c ON v.fk_id_cliente = c.id_cliente 
GROUP BY v.fk_id_cliente ORDER BY total DESC 
) subquery_alias LIMIT 1 ;

-- Qual forma de pagamento foi menos utilizada em vendas?

SELECT forma_pagamento FROM (SELECT  forma_pagamento, COUNT(1) quantidade FROM distribuidora.forma_pagamento fp 
GROUP BY forma_pagamento ORDER BY quantidade ASC) alias  LIMIT 1;

-- Quais são os clientes cadastrados que nunca efetuaram compra?

SELECT  nome FROM distribuidora.vendas v 
RIGHT JOIN distribuidora.clientes c ON v.fk_id_cliente = c.id_cliente  WHERE id_venda IS NULL ;

-- Qual o nome do cliente que gastou mais dinheiro em compras?

SELECT  nome FROM (SELECT nome, SUM(total) FROM distribuidora.vendas v
INNER JOIN distribuidora.clientes c ON v.fk_id_cliente  =c.id_cliente 
GROUP BY v.fk_id_cliente) alias LIMIT 1 ;

-- Existem quantos clientes PF e quantos Clientes PJ?

SELECT  tipo_cliente, COUNT(1) quantidade FROM distribuidora.clientes c WHERE tipo_cliente = "PF" ;

SELECT  tipo_cliente, COUNT(1) quantidade FROM distribuidora.clientes c WHERE tipo_cliente = "PJ" ;

-- Qual o total de vendas efetuadas até hoje?

SELECT  SUM(total) Total  FROM distribuidora.vendas v ;









-- QUAL O PRODUTO MAIS VENDIDO NA BASE DE DADOS ?


SELECT * from (select itens_venda.quantidade  , count(1) total from distribuidora.itens_venda iv  
inner join distribuidora.vendas v on iv.fk_id_venda = v.id_venda
group BY iv.fk_id_venda order by total DESC 
) alias limit 1 ;



































