------------------------------------------------------------------------------
-- TRIGGER e PROCEDURE (construir regras em cima de gatilhos ou procedimentos)
------------------------------------------------------------------------------

/*
==================================

			TRIGGER
  
================================== 
*/


-- Criando a TABELA que receberá os dados pela TRIGGER
DROP TABLE IF EXISTS distribuidora.clientes_auditoria;

CREATE TABLE distribuidora.clientes_auditoria (
	id_cliente_auditoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome_antigo VARCHAR(100) NOT NULL,
	nome_novo VARCHAR(100) NOT NULL,
	cnpj_cpf_antigo VARCHAR(16) NOT NULL,
	cnpj_cpf_novo VARCHAR(16) NOT NULL,
	endereco_antigo VARCHAR(100) NOT NULL,
	endereco_novo VARCHAR(100) NOT NULL,
	tipo_cliente_antigo VARCHAR(20) NOT NULL,
	tipo_cliente_novo VARCHAR(20) NOT NULL ,
	data_hora DATETIME 
);

-- Criando a TRIGGER 
DROP TRIGGER IF EXISTS distribuidora.tg_auditoria_clientes;

CREATE TRIGGER distribuidora.tg_auditoria_clientes
AFTER UPDATE ON distribuidora.clientes 
FOR EACH ROW 
BEGIN 
	INSERT INTO distribuidora.clientes_auditoria 
	(nome_antigo, nome_novo, cnpj_cpf_antigo, cnpj_cpf_novo, endereco_antigo, endereco_novo, 
	tipo_cliente_antigo, tipo_cliente_novo, data_hora)
	VALUES (OLD.nome, NEW.nome, OLD.cnpj_cpf, NEW.cnpj_cpf, OLD.endereco, NEW.endereco, 
	OLD.tipo_cliente, NEW.tipo_cliente ,  NOW()
	);
	
END ;   

-- Acionando a TRIGGER através de um gatilho.
UPDATE distribuidora.clientes
SET nome='Rafael', cnpj_cpf='47507', endereco='rua dois', tipo_cliente='PJ'
WHERE id_cliente=1;

-- Verificando os resultados nas tabelas
SELECT * FROM distribuidora.clientes;
SELECT * FROM distribuidora.clientes_auditoria;


/*
==================================

		    PROCEDURE
  
================================== 
*/


CREATE PROCEDURE distribuidora.total_clientes(in tabela int)
BEGIN
	DECLARE qtde int;

	IF tabela = 1 THEN 
		SELECT COUNT(*) INTO qtde FROM distribuidora.clientes; 
		SELECT 'o valor da tabela cliente é' + qtde;
	END IF;
	
	IF tabela = 2 THEN 
		SELECT COUNT(*) INTO qtde FROM distribuidora.clientes_externos; 
		SELECT 'o valor da tabela clientes_externos é' + qtde;
	END IF	;
END

-- CALL (comando para chamar e executar o procedimento)

CALL distribuidora.total_clientes(1);

CALL distribuidora.total_clientes(2);




/* * * * * * * * * * * * * * * * *
 *                               *
 * 		EXERCÍCIOS               *
 *                               *
 * * * * * * * * * * * * * * * * */


-- Criar uma trigger para fazer auditoria da forma_pagamento


CREATE table distribuidora.forma_pagamento_auditoria (
	id_forma_pagamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	forma_pagamento_antigo  VARCHAR(100) NOT NULL,
	forma_pagamento_novo  VARCHAR(100) NOT NULL);

CREATE TRIGGER distribuidora.tg_forma_pagamento_auditoria
AFTER UPDATE ON distribuidora.forma_pagamento  
FOR EACH ROW 
BEGIN 
	INSERT INTO distribuidora.forma_pagamento_auditoria 
	(forma_pagamento_antigo, forma_pagamento_novo)
	VALUES (OLD.forma_pagamento, NEW.forma_pagamento
	);
	
END ;   

UPDATE distribuidora.forma_pagamento 
SET forma_pagamento ='dinheiro'
WHERE id_forma_pagamento =3;

SELECT * FROM distribuidora.forma_pagamento fp ;
SELECT * FROM distribuidora.forma_pagamento_auditoria ;





-- Criar uma procedure para imprimir o total de registros da tabela vendas


CREATE PROCEDURE distribuidora.total_vendas(IN tabela INT)
BEGIN
	DECLARE qtde INT;
	IF tabela = 1 THEN 
		SELECT COUNT(*) INTO qtde FROM distribuidora.vendas; 
		SELECT 'o total de registros na tabela vendas é' + qtde;
	END IF;
	
END




CALL distribuidora.total_vendas(1);


















