/*  
Qual cliente tem mais vendas?
Qual forma de pagamento foi menos utilizada em vendas?
Quais são os clientes cadastrados que nunca efetuaram compra ?
Qual o nome do cliente que gastou mais dinheiro em compras?
Existem quantos clientes PF e quantos Clientes PJ?
Qual total de vendas efetuadas até hoje ?  */

-- Qual cliente tem mais vendas?

SELECT nome from ( SELECT c.nome , count(1) total from distribuidora.vendas v
INNER JOIN distribuidora.clientes c ON v.fk_id_cliente = c.id_cliente 
group by v.fk_id_cliente order by total desc
) subquery_alias limit 1 ;

-- Qual forma de pagamento foi menos utilizada em vendas?

select forma_pagamento from (SELECT  forma_pagamento, COUNT(1) quantidade FROM distribuidora.forma_pagamento fp 
GROUP BY forma_pagamento ORDER BY quantidade ASC) alias  LIMIT 1;

-- Quais são os clientes cadastrados que nunca efetuaram compra?

select nome from distribuidora.vendas v 
right join distribuidora.clientes c on v.fk_id_cliente = c.id_cliente  where id_venda is NULL ;

-- Qual o nome do cliente que gastou mais dinheiro em compras?

select nome from (SELECT nome, SUM(total) from distribuidora.vendas v
INNER JOIN distribuidora.clientes c on v.fk_id_cliente  =c.id_cliente 
group by v.fk_id_cliente) alias limit 1 ;

-- Existem quantos clientes PF e quantos Clientes PJ?

select tipo_cliente, count(1) quantidade from distribuidora.clientes c where tipo_cliente = "PF" ;

select tipo_cliente, count(1) quantidade from distribuidora.clientes c where tipo_cliente = "PJ" ;

-- Qual o total de vendas efetuadas até hoje?

select sum(total) Total  from distribuidora.vendas v ;







