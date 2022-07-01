CREATE DATABASE distribuidora;
USE distribuidora;

CREATE TABLE distribuidora.clientes (
	id_cliente INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	cnpj_cpf VARCHAR(16) NOT NULL,
	endereco VARCHAR(100) NOT NULL,
	tipo_cliente VARCHAR(20) NOT NULL,
	PRIMARY KEY (id_cliente)
);

INSERT INTO distribuidora.clientes(nome,cnpj_cpf,endereco,tipo_cliente) 
values('breno','5986894','rua rututt','pessoa fisica');

select * from clientes;

CREATE TABLE distribuidora.forma_pagamento (
	id_forma_pagamento INT NOT NULL AUTO_INCREMENT,
	forma_pagamento VARCHAR(20) NOT NULL,
	PRIMARY KEY (id_forma_pagamento)
);
select * from forma_pagamento;
INSERT INTO distribuidora.forma_pagamento(forma_pagamento) 
values('pix');

CREATE TABLE distribuidora.vendas (
	id_venda INT NOT NULL AUTO_INCREMENT ,
	id_cliente INT NOT NULL,
	id_forma_pagamento INT NOT NULL,
	descricao VARCHAR(200) NOT NULL,
	hora DATETIME,
	total DECIMAL(5,2) NOT NULL,
	PRIMARY KEY (id_venda),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento));
select * from vendas;
INSERT INTO distribuidora.vendas(id_cliente,id_forma_pagamento,descricao,hora,total) 
values(1,1,'venda1',now(),202.02);

CREATE TABLE distribuidora.distribuidores (
	id_distribuidor INT NOT NULL AUTO_INCREMENT,
	telefone VARCHAR(16) NOT NULL,
	razao_social VARCHAR(100) NOT NULL,
	PRIMARY KEY (id_distribuidor)
);
 
select * from distribuidores;
INSERT INTO distribuidora.distribuidores(telefone,razao_social) 
values('98833-3333' , 'kika distribuidora');

CREATE TABLE distribuidora.produtos (
	id_produtos INT NOT NULL AUTO_INCREMENT,
	id_distribuidor INT NOT NULL,
	preco_custo DECIMAL(5,2) NOT NULL,
	preco_venda DECIMAL (5,2) NOT NULL,
	data_validade DATE NOT NULL,
	descricao VARCHAR (250) NOT NULL,
	PRIMARY KEY (id_produtos),
	FOREIGN KEY (id_distribuidor) REFERENCES distribuidores(id_distribuidor)
);
select * from produtos;
INSERT INTO distribuidora.produtos(id_produtos,id_distribuidor,preco_custo
,preco_venda,data_validade,descricao) 
values(1,1,200.00, 400.00, '2022-07-22', 'pack cervejas');

CREATE TABLE distribuidora.itens_venda (
	id_venda INT NOT NULL,
	id_produtos INT NOT NULL,
	quantidade INT NOT NULL,
	numero_nf VARCHAR(20) NOT NULL,
	PRIMARY KEY (numero_nf),
	FOREIGN KEY (id_venda) REFERENCES vendas (id_venda),
	FOREIGN KEY (id_produtos) REFERENCES produtos(id_produtos)	
);
select * from itens_venda;
INSERT INTO distribuidora.itens_venda(id_venda, id_produtos,quantidade, numero_nf)
values(1,1,222,'388833');


