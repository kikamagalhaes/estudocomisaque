
/*
Verifica se o banco de dados já existe e em caso positivo, deleta.
*/

DROP DATABASE IF EXISTS distribuidora;


/*
Cria o Banco de Dados "distribuidora".
*/

CREATE DATABASE distribuidora;

/*
=========================

Cria a tabela "clientes".

=========================
*/

CREATE TABLE distribuidora.clientes (
	id_cliente INT NOT NULL,
	nome VARCHAR(100) NOT NULL,
	cnpj_cpf VARCHAR(16) NOT NULL,
	endereco VARCHAR(100) NOT NULL,
	tipo_cliente VARCHAR(20) NOT NULL
/*	PRIMARY KEY (id_cliente)   */
);

/*
Insere os três primeiros registros na tabela "clientes".
*/

INSERT INTO distribuidora.clientes (id_cliente, nome, cnpj_cpf, endereco, tipo_cliente) VALUES ('1','Rafael','476.664.859-04','Alameda Jacinto, 58','PF');
INSERT INTO distribuidora.clientes (id_cliente, nome, cnpj_cpf, endereco, tipo_cliente) VALUES ('2','Joyce','786.644.959-21','Rua das Orquídeas, 87','PF');
INSERT INTO distribuidora.clientes (id_cliente, nome, cnpj_cpf, endereco, tipo_cliente) VALUES ('3','Ana Beatriz','566.904.859-04','Avenida Matias, 783','PF');

/*
Altera a tabela "clientes" para modificar a coluna "id_cliente" inserindo o "auto-incremento" e adicionando a "chave primária".
*/

ALTER TABLE distribuidora.clientes (
 	MODIFY id_cliente int NOT NULL AUTO_INCREMENT, 
	AUTO_INCREMENT=4,
  	ADD PRIMARY KEY (id_cliente)
);


/*
================================

Cria a tabela "forma_pagamento".

================================
*/
	

CREATE TABLE distribuidora.forma_pagamento (
	id_forma_pagamento INT NOT NULL,
	forma_pagamento VARCHAR(20) NOT NULL,
/*	PRIMARY KEY (id_forma_pagamento) */
);


/*
Insere os três primeiros registros na tabela "forma_pagamento".
*/

INSERT INTO distribuidora.forma_pagamento (id_forma_pagamento, forma_pagamento) VALUES ('1','dinheiro');
INSERT INTO distribuidora.forma_pagamento (id_forma_pagamento, forma_pagamento) VALUES ('2','cartão de crédito');
INSERT INTO distribuidora.forma_pagamento (id_forma_pagamento, forma_pagamento) VALUES ('3','pix');

/*
Altera a tabela "forma_pagamento" para modificar a coluna "id_forma_pagamento" inserindo o "auto-incremento" e adicionando a "chave primária".
*/

ALTER TABLE distribuidora.forma_pagamento (
 	MODIFY id_forma_pagamento int NOT NULL AUTO_INCREMENT, 
	AUTO_INCREMENT=4,
  	ADD PRIMARY KEY (id_forma_pagamento)
);


/*
=======================

Cria a tabela "vendas".

=======================
*/


CREATE TABLE distribuidora.vendas (
	id_venda INT NOT NULL,
	id_cliente INT NOT NULL,
	id_forma_pagamento INT NOT NULL,
	descricao VARCHAR(200) NOT NULL,
	hora DATETIME,
	total DECIMAL(5,2) NOT NULL,
/*	PRIMARY KEY (id_venda),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)  */
	
);

/*
Insere os três primeiros registros na tabela "vendas".
*/

INSERT INTO distribuidora.vendas (id_venda, descricao, hora, total ) VALUES ('1','notebook',CURRENT_TIMESTAMP,'8700.00');
INSERT INTO distribuidora.vendas (id_venda, descricao, hora, total ) VALUES ('2','celular',CURRENT_TIMESTAMP,'1200.00');
INSERT INTO distribuidora.vendas (id_venda, descricao, hora, total ) VALUES ('3','tablet',CURRENT_TIMESTAMP,'2000.00');

/*
Altera a tabela "vendas" para modificar a coluna "id_venda" inserindo o "auto-incremento" e adicionando as chaves primária e estrangeiras.
*/

ALTER TABLE distribuidora.vendas (
 	MODIFY id_venda int NOT NULL AUTO_INCREMENT, 
	AUTO_INCREMENT=4,
  	ADD PRIMARY KEY (id_venda),
	ADD FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	ADD FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)
);

/*
===============================

Cria a tabela "distribuidores".

===============================
*/

CREATE TABLE distribuidora.distribuidores (
	id_distribuidor INT NOT NULL,
	telefone VARCHAR(16) NOT NULL,
	razao_social VARCHAR(100) NOT NULL,
/*	PRIMARY KEY (id_distribuidor)  */
);


/*
Insere os três primeiros registros na tabela "distribuidores".
*/

INSERT INTO distribuidora.distribuidores (id_distribuidor, telefone, razao_social ) VALUES ('1','97564-7750','Mega Distribuidora Cícero');
INSERT INTO distribuidora.distribuidores (id_distribuidor, telefone, razao_social) VALUES ('2','75863-9472','Magazine Camila');
INSERT INTO distribuidora.distribuidores (id_distribuidor, telefone, razao_social) VALUES ('3','94658-1382','Empreendimentos Imobiliários Aninha');


/*
Altera a tabela "distribuidores" para modificar a coluna "id_distribuidor" inserindo o "auto-incremento" e adicionando a "chave primária".
*/

ALTER TABLE distribuidora.distribuidores (
 	MODIFY id_distribuidor int NOT NULL AUTO_INCREMENT, 
	AUTO_INCREMENT=4,
  	ADD PRIMARY KEY (id_distribuidor)
);

/*
=========================

Cria a tabela "produtos".

=========================
*/

CREATE TABLE distribuidora.produtos (
	id_produtos INT NOT NULL,
	id_distribuidor INT NOT NULL,
	preco_custo DECIMAL(5,2) NOT NULL,
	preco_venda DECIMAL (5,2) NOT NULL,
	data_validade DATE NOT NULL,
	descricao VARCHAR (250) NOT NULL,
/*	PRIMARY KEY (id_produtos),
	FOREIGN KEY (id_distribuidor) REFERENCES distribuidores(id_distribuidor)  */
);


/*
Insere os três primeiros registros na tabela "produtos".
*/

INSERT INTO distribuidora.produtos (id_produtos, preco_custo, preco_venda, data_validade, descricao ) VALUES ('1','2500.00','3200.00','14-02-2025','celular');
INSERT INTO distribuidora.produtos (id_produtos, preco_custo, preco_venda, data_validade, descricao ) VALUES ('2','1300.00','1500.00','14-02-2025','tablet');
INSERT INTO distribuidora.produtos (id_produtos, preco_custo, preco_venda, data_validade, descricao ) VALUES ('3','3500.00','3800.00','14-02-2025','computador');


/*
Altera a tabela "produtos" para modificar a coluna "id_produtos" inserindo o "auto-incremento" e adicionando as chaves primária e estrangeira.
*/

ALTER TABLE distribuidora.distribuidores (
 	MODIFY id_produtos int NOT NULL AUTO_INCREMENT, 
	AUTO_INCREMENT=4,
  	ADD PRIMARY KEY (id_produtos)
	ADD FOREIGN KEY (id_distribuidor) REFERENCES distribuidores(id_distribuidor)
);


/*
============================

Cria a tabela "itens_venda".

============================
*/


CREATE TABLE distribuidora.itens_venda (
	id_venda INT NOT NULL,
	id_produtos INT NOT NULL,
	quantidade INT NOT NULL,
	numero_nf VARCHAR(20) NOT NULL,
/*	PRIMARY KEY (numero_nf),
	FOREIGN KEY (id_venda) REFERENCES vendas (id_venda),
	FOREIGN KEY (id_produtos) REFERENCES produtos(id_produtos)	*/
);


/*
Insere os três primeiros registros na tabela "itens_venda".
*/

INSERT INTO distribuidora.itens_venda (quantidade, numero_nf ) VALUES ('5','3658382');
INSERT INTO distribuidora.itens_venda (quantidade, numero_nf ) VALUES ('3','3548867');
INSERT INTO distribuidora.itens_venda (quantidade, numero_nf ) VALUES ('1','2538844');


/*
Altera a tabela "itens_venda" para adicionar as chaves primária e estrangeira.
*/

ALTER TABLE distribuidora.distribuidores (
  	ADD PRIMARY KEY (id_venda)
	ADD FOREIGN KEY (id_venda) REFERENCES vendas (id_venda),
	ADD FOREIGN KEY (id_produtos) REFERENCES produtos(id_produtos)	
);
