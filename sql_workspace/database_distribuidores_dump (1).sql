/*  Verifica se o banco de dados já existe e em caso positivo, deleta.   */
DROP DATABASE IF EXISTS distribuidora;

/*  Cria o Banco de Dados "distribuidora".  */
CREATE DATABASE distribuidora;

/*
=========================

Cria a tabela "clientes".

=========================
*/

CREATE TABLE distribuidora.clientes (
	id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	cnpj_cpf VARCHAR(16) NOT NULL,
	endereco VARCHAR(100) NOT NULL,
	tipo_cliente VARCHAR(20) NOT NULL
);

/*
================================

Cria a tabela "forma_pagamento".

================================
*/

CREATE TABLE distribuidora.forma_pagamento (
	id_forma_pagamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	forma_pagamento VARCHAR(20) NOT NULL
);

/*
=======================

Cria a tabela "vendas".

=======================
*/

CREATE TABLE distribuidora.vendas (
	id_venda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR(200) NOT NULL,
	hora DATETIME,
	total DECIMAL(5,2) NOT NULL,
	
	fk_id_cliente INT NOT NULL,
	fk_id_forma_pagamento INT NOT NULL,
	FOREIGN KEY (fk_id_cliente) REFERENCES clientes(id_cliente),
	FOREIGN KEY (fk_id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)
	
);

/*
===============================

Cria a tabela "distribuidores".

===============================
*/

CREATE TABLE distribuidora.distribuidores (
	id_distribuidor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	telefone VARCHAR(16) NOT NULL,
	razao_social VARCHAR(100) NOT NULL
);

/*
=========================

Cria a tabela "produtos".

=========================
*/

CREATE TABLE distribuidora.produtos (
	id_produtos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	preco_custo DECIMAL(5,2) NOT NULL,
	preco_venda DECIMAL (5,2) NOT NULL,
	data_validade DATE NOT NULL,
	descricao VARCHAR (250) NOT NULL,
	
	fk_id_distribuidor INT NOT NULL,
	FOREIGN KEY (fk_id_distribuidor) REFERENCES distribuidores(id_distribuidor)
); 

/*
============================

Cria a tabela "itens_venda".

============================
*/

CREATE TABLE distribuidora.itens_venda (
	numero_nf VARCHAR(20) NOT NULL PRIMARY KEY,
	quantidade INT NOT NULL,

	fk_id_venda INT NOT NULL,
	fk_id_produtos INT NOT NULL,
	FOREIGN KEY (fk_id_venda) REFERENCES vendas (id_venda),
	FOREIGN KEY (fk_id_produtos) REFERENCES produtos(id_produtos)	
);



/* * * * * * * * * * * * * * * *  
 * INSERE OS DADOS NAS TABELAS *
 * * * * * * * * * * * * * * * */


/*  Insere os três primeiros registros na tabela "clientes".  */

INSERT INTO distribuidora.clientes (nome, cnpj_cpf, endereco, tipo_cliente) VALUES ('Rafael','476.664.859-04','Alameda Jacinto, 58','PF');
INSERT INTO distribuidora.clientes (nome, cnpj_cpf, endereco, tipo_cliente) VALUES ('Joyce','786.644.959-21','Rua das Orquídeas, 87','PF');
INSERT INTO distribuidora.clientes (nome, cnpj_cpf, endereco, tipo_cliente) VALUES ('Ana Beatriz','566.904.859-04','Avenida Matias, 783','PF');


/*  Insere os três primeiros registros na tabela "forma_pagamento".  */

INSERT INTO distribuidora.forma_pagamento (forma_pagamento) VALUES ('dinheiro');
INSERT INTO distribuidora.forma_pagamento (forma_pagamento) VALUES ('cartão de crédito');
INSERT INTO distribuidora.forma_pagamento (forma_pagamento) VALUES ('pix');


/*  Insere os três primeiros registros na tabela "vendas".  */

INSERT INTO distribuidora.vendas (descricao, hora, total, fk_id_cliente, fk_id_forma_pagamento ) VALUES ('notebook',CURRENT_TIMESTAMP,'87','1','2');
INSERT INTO distribuidora.vendas (descricao, hora, total, fk_id_cliente, fk_id_forma_pagamento ) VALUES ('celular',CURRENT_TIMESTAMP,'12','3','3');
INSERT INTO distribuidora.vendas (descricao, hora, total, fk_id_cliente, fk_id_forma_pagamento ) VALUES ('tablet',CURRENT_TIMESTAMP,'20','2','1');


/*  Insere os três primeiros registros na tabela "distribuidores".  */

INSERT INTO distribuidora.distribuidores (telefone, razao_social ) VALUES ('97564-7750','Mega Distribuidora Cícero');
INSERT INTO distribuidora.distribuidores (telefone, razao_social) VALUES ('75863-9472','Magazine Camila');
INSERT INTO distribuidora.distribuidores (telefone, razao_social) VALUES ('94658-1382','Empreendimentos Imobiliários Aninha');


/*  Insere os três primeiros registros na tabela "produtos".  */

INSERT INTO distribuidora.produtos (preco_custo, preco_venda, data_validade, descricao, fk_id_distribuidor) VALUES ('25','32','2025-02-14','celular','2');
INSERT INTO distribuidora.produtos (preco_custo, preco_venda, data_validade, descricao, fk_id_distribuidor) VALUES ('13','15','2023-09-15','tablet','1');
INSERT INTO distribuidora.produtos (preco_custo, preco_venda, data_validade, descricao, fk_id_distribuidor) VALUES ('35','38','2029-12-30','computador','3');


/*  Insere os três primeiros registros na tabela "itens_venda".  */

INSERT INTO distribuidora.itens_venda (quantidade, numero_nf, fk_id_venda, fk_id_produtos ) VALUES ('5','3658382','1','3');
INSERT INTO distribuidora.itens_venda (quantidade, numero_nf, fk_id_venda, fk_id_produtos ) VALUES ('3','3548867','2','2');
INSERT INTO distribuidora.itens_venda (quantidade, numero_nf, fk_id_venda, fk_id_produtos ) VALUES ('1','2538844','3','1');



/* * * * * * * * * * * * * * * * * * * * * *  
 * EXIBE AS TABELAS COM OS DADOS INSERIDOS *
 * * * * * * * ** * * * * * * * * * ** * * */

SELECT * from distribuidora.clientes;

SELECT * from distribuidora.distribuidores;

SELECT * from distribuidora.forma_pagamento;

SELECT * from distribuidora.itens_venda;

SELECT * from distribuidora.produtos;

SELECT * from distribuidora.vendas;

SELECT * from curso.cliente;



/* * * * * * * * * * * * * * * * * * * * * *  
 *                FIM                      *
 * * * * * * * ** * * * * * * * * * ** * * */






