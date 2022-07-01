/*
==================================

 Exercícios dia 13 de Junho 
  
================================== 
*/

-- QUAL DISTRIBUIDOR POSSUI MAIS PRODUTOS CADASTRADOS NA BASE DE DADOS? (Resolvendo sem criar a VIEW)
SELECT razao_social FROM (SELECT d.razao_social , COUNT(1) total FROM distribuidora.produtos p 
INNER JOIN distribuidora.distribuidores d ON p.fk_id_distribuidor = d.id_distribuidor 
GROUP BY p.fk_id_distribuidor ORDER BY total DESC 
) alias LIMIT 1 ;

-- CRIAR UMA VIEW COM ALGUMA CONSULTA
CREATE VIEW dist_prod AS
SELECT * FROM distribuidora.distribuidores d 
INNER JOIN distribuidora.produtos p
ON p.fk_id_distribuidor = d.id_distribuidor ;
 
SELECT razao_social, descricao FROM distribuidora.dist_prod ;


-- QUAL DISTRIBUIDOR POSSUI MAIS PRODUTOS CADASTRADOS NA BASE DE DADOS? (Resolvendo com a utilização da VIEW)

SET SESSION sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));  
/*código necessário para desabilitar o only_full_group_by */

SELECT razao_social , COUNT(1) produtos  FROM dist_prod GROUP BY razao_social ORDER BY produtos DESC  LIMIT 1; 



-- QUAL O PRODUTO MAIS VENDIDO NA BASE DE DADOS ? (aqui vou criar uma 'view' e depois fazer o 'select')
CREATE VIEW prod_itens AS  
SELECT * FROM distribuidora.produtos p 
INNER JOIN distribuidora.itens_venda iv 
ON iv.fk_id_produtos = p.id_produtos  ;
 
SELECT descricao, quantidade FROM distribuidora.prod_itens ORDER BY quantidade DESC LIMIT 1;



-- QUAIS VENDAS TEM A FORMA DE PAGAMENTO IGUAL A BOLETO? DEVE USAR SUBQUERY
SELECT  numero_nf , descricao , forma_pagamento FROM (SELECT * FROM distribuidora.vendas v 
INNER JOIN distribuidora.itens_venda iv ON iv.fk_id_venda = v.id_venda 
INNER JOIN distribuidora.forma_pagamento fp ON v.fk_id_forma_pagamento = fk_id_forma_pagamento) pagamento 
WHERE forma_pagamento = 'boleto';

