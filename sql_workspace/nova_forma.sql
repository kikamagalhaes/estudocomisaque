DROP DATABASE IF EXISTS distribuidora;

CREATE DATABASE distribuidora;

CREATE TABLE distribuidora.clientes (
	id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	cnpj_cpf VARCHAR(16) NOT NULL,
	endereco VARCHAR(100) NOT NULL,
	tipo_cliente VARCHAR(20) NOT NULL
);

CREATE TABLE distribuidora.forma_pagamento (
	id_forma_pagamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	forma_pagamento VARCHAR(20) NOT NULL
);

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

CREATE TABLE distribuidora.distribuidores (
	id_distribuidor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	telefone VARCHAR(16) NOT NULL,
	razao_social VARCHAR(100) NOT NULL,
);

CREATE TABLE distribuidora.produtos (
	id_produtos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	preco_custo DECIMAL(5,2) NOT NULL,
	preco_venda DECIMAL (5,2) NOT NULL,
	data_validade DATE NOT NULL,
	descricao VARCHAR (250) NOT NULL,
	
	fk_id_distribuidor INT NOT NULL,
	FOREIGN KEY (fk_id_distribuidor) REFERENCES distribuidores(id_distribuidor)
); 

CREATE TABLE distribuidora.itens_venda (
	numero_nf VARCHAR(20) NOT NULL PRIMARY KEY,
	quantidade INT NOT NULL,

	fk_id_venda INT NOT NULL,
	fk_id_produtos INT NOT NULL,
	FOREIGN KEY (fk_id_venda) REFERENCES vendas (id_venda),
	FOREIGN KEY (fk_id_produtos) REFERENCES produtos(id_produtos)	
);