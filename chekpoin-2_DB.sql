-- -- --																																																	  					 -- -- --
-- Projeto e utilizado como delivery de entrega de gas de cozinha onde o cliente liga para a empresa e solicita uma entrega. --
-- -- --																																																							 -- -- --

CREATE DATABASE delivery_gas;

USE delivery_gas;

CREATE TABLE cliente (
	telefone VARCHAR ( 11 ) NOT NULL,
	nome VARCHAR ( 50 ),
	sobrenome VARCHAR ( 100 ),
	cpf CHAR ( 11 ),
	PRIMARY KEY ( telefone ) 
);

CREATE TABLE endereco (
	endereco_id INT NOT NULL AUTO_INCREMENT,
	telefone VARCHAR ( 11 ) NOT NULL,
	endereco VARCHAR ( 200 ),
	numero INT,
	bairro VARCHAR ( 50 ),
	complemento VARCHAR ( 50 ),
	PRIMARY KEY ( endereco_id ),
	CONSTRAINT FKtelefone FOREIGN KEY ( telefone ) REFERENCES cliente ( telefone ) 
);

CREATE TABLE entregador ( 
	entregador_id INT NOT NULL AUTO_INCREMENT, 
	nome VARCHAR ( 50 ), 
	sobrenome VARCHAR ( 100 ), 
	contato VARCHAR ( 100 ), 
	PRIMARY KEY ( entregador_id ) 
);

CREATE TABLE fornecedor ( 
	fornecedor_id INT NOT NULL AUTO_INCREMENT, 
	razao_social VARCHAR ( 200 ), 
	cnpj CHAR ( 14 ), telefone VARCHAR ( 15 ), 
	PRIMARY KEY ( fornecedor_id ) 
);

CREATE TABLE produto (
	produto_id INT NOT NULL AUTO_INCREMENT,
	fornecedor_id INT NOT NULL,
	nome_produto VARCHAR ( 50 ),
	valor_custo DECIMAL ( 8, 2 ),
	valor_venda DECIMAL ( 8, 2 ),
	PRIMARY KEY ( produto_id ),
	CONSTRAINT FKfornecedor FOREIGN KEY ( fornecedor_id ) REFERENCES fornecedor ( fornecedor_id ) 
);

CREATE TABLE compra (
	compra_id INT NOT NULL AUTO_INCREMENT,
	produto_id INT NOT NULL,
	telefone VARCHAR ( 11 ) NOT NULL,
	endereco_id INT NOT NULL,
	entregador_id INT NOT NULL,
	PRIMARY KEY ( compra_id ),
	CONSTRAINT FKprodutoCompra FOREIGN KEY ( produto_id ) REFERENCES produto ( produto_id ),
	CONSTRAINT FKtelefoneCompra FOREIGN KEY ( telefone ) REFERENCES cliente ( telefone ),
	CONSTRAINT FKenderecoCompra FOREIGN KEY ( endereco_id ) REFERENCES endereco ( endereco_id ),
	CONSTRAINT FKentregadorCompra FOREIGN KEY ( entregador_id ) REFERENCES entregador ( entregador_id ) 
);

INSERT INTO cliente ( telefone, nome, sobrenome, cpf ) 
VALUE
	( '27998925017', 'Heberth', "Fonseca", "11998233685" );

INSERT INTO endereco ( telefone, endereco, numero, bairro, complemento ) 
VALUE
	( '27998925017', 'Avenida Maruipe', "827", "Maruipe", "na Full Color" );

INSERT INTO entregador ( nome, sobrenome, contato ) 
VALUE
	( 'Gabriel', 'Menezes', '2734212626' );
	
INSERT INTO fornecedor ( razao_social, cnpj, telefone ) 
VALUE
	( 'SUDESTE COLOR FOTOS LTDA', '07996451000170', '2734212604' );	

INSERT INTO produto ( fornecedor_id, nome_produto, valor_custo, valor_venda ) 
VALUE
	( '1', 'Botijão de Gas 13kg', '61.90', '95.00' );	

UPDATE produto 
SET valor_custo = '63.20', valor_venda = '99.50';

DELETE FROM	produto 
WHERE	produto_id = 1;

SELECT * FROM cliente;

-- Creditos
-- Heberth Fonseca Turma 15 NT