CREATE DATABASE universo_leitura;
USE universo_leitura;
CREATE TABLE associados (
	associados_id INT NOT NULL AUTO_INCREMENT,
	associados_rg CHAR ( 7 ),
	associados_nome VARCHAR ( 50 ),
	associados_sobrenome VARCHAR ( 50 ),
	associados_endereco VARCHAR ( 150 ),
	associados_cidade VARCHAR ( 50 ),
	associados_estado VARCHAR ( 2 ),
	PRIMARY KEY ( associados_id ) 
);
CREATE TABLE editoras ( 
	editoras_id INT NOT NULL AUTO_INCREMENT, 
	editoras_razao VARCHAR ( 150 ), 
	editoras_telefone VARCHAR ( 100 ), 
	PRIMARY KEY ( editoras_id ) 
);
CREATE TABLE autores ( autores_id INT NOT NULL AUTO_INCREMENT, 
	autores_nome VARCHAR ( 100 ), 
	autores_sobrenome VARCHAR ( 100 ), 
	PRIMARY KEY ( autores_id ) 
);
CREATE TABLE telefone (
	telefone_id INT NOT NULL AUTO_INCREMENT,
	telefone_socio VARCHAR ( 100 ),
	associados_id INT NOT NULL,
	PRIMARY KEY ( telefone_id ),
	CONSTRAINT FKassociados FOREIGN KEY ( associados_id ) REFERENCES associados ( associados_id ) 
);
CREATE TABLE livros (
	livros_id INT NOT NULL AUTO_INCREMENT,
	livros_isbn VARCHAR ( 13 ),
	livros_titulo VARCHAR ( 200 ),
	livros_ano_criacao DATE,
	livros_ano_publicacao DATE,
	autores_id INT NOT NULL,
	editoras_id INT NOT NULL,
	PRIMARY KEY ( livros_id ),
	CONSTRAINT FKautores FOREIGN KEY ( autores_id ) REFERENCES autores ( autores_id ),
	CONSTRAINT FKeditoras FOREIGN KEY ( editoras_id ) REFERENCES editoras ( editoras_id ) 
);
CREATE TABLE emprestimos (
	emprestimos_id INT NOT NULL AUTO_INCREMENT,
	emprestimos_date DATE,
	emprestimos_prazo_devolucao DATE,
	emprestimos_data_devolucao DATE,
	associados_id INT NOT NULL,
	PRIMARY KEY ( emprestimos_id ),
	CONSTRAINT FKassociados_emprestimos FOREIGN KEY ( associados_id ) REFERENCES associados ( associados_id ) 
);
CREATE TABLE exemplares (
	exemplares_id INT NOT NULL AUTO_INCREMENT,
	exemplares_sinistro BOOL,
	livros_id INT NOT NULL,
	PRIMARY KEY ( exemplares_id ),
	CONSTRAINT FKlivros FOREIGN KEY ( livros_id ) REFERENCES livros ( livros_id ) 
);

CREATE TABLE emprestimo_exemplares (
	emprestimo_exemplares_id INT NOT NULL AUTO_INCREMENT,
	emprestimos_id INT NOT NULL,
	exemplares_id INT NOT NULL,
	PRIMARY KEY ( emprestimo_exemplares_id ),
	CONSTRAINT FKemprestimos FOREIGN KEY ( emprestimos_id ) REFERENCES emprestimos ( emprestimos_id ),
	CONSTRAINT FKexemplares FOREIGN KEY ( exemplares_id ) REFERENCES exemplares ( exemplares_id ) 
);

INSERT INTO associados ( associados_rg, associados_nome, associados_sobrenome, associados_endereco, associados_cidade, associados_estado )
VALUES
	( "010101", "Heberth", "Fonseca", "Rua Castro Alves 237 Jardim Limoeiro", "Serra", "ES" ),
	( "020202", "Rubens", "Trindade", "Rua Castro Alves 170 Jardim Limoeiro", "Serra", "ES" ),
	( "023030", "Marcos", "Barbosa", "Avenida Maruipe 827 Maruipe", "Vitoria", "ES" ),
	( "040404", "James", "Fonseca", "Rua Doutro Sabino Silva 826 Cidade Verde", "Almenara", "MG" ),
	( "505555", "Catia", "Pereira", "Rua Nossa Senhora Aparecida 90 Centro", "Almenara", "MG" );

INSERT INTO telefone ( telefone_socio, associados_id )
VALUES
	( "34212626", 3 ),
	( "37212000", 4 ),
	( "34211036", 4 ),
	( "98925017", 1 ),
	( "34212609", 2 ),
	( "96295496", 5 ),
	( "34212604", 1 ),
	( "34212615", 5 );

INSERT INTO autores ( autores_nome, autores_sobrenome )
VALUES
	( "Carlos", "Drumond" ),
	( "Machado", "de Assis" );
	
INSERT INTO editoras ( editoras_razao, editoras_telefone )
VALUES
	( "Clube do Autor", "32222222" ),
	( "Casa da Vovo", "01011111" ),
	( "Dona Pipoca", "40028422" );
	
INSERT INTO livros ( livros_isbn, livros_titulo, livros_ano_criacao, livros_ano_publicacao, autores_id, editoras_id )
VALUES
	( "616161", "A mordida da vaca banguela", "2010-01-20", "2012-02-01", 1, 3 ),
	( "101010", "A volta dos que não foram", "1999-05-15", "1999-03-21", 2, 2 ),
	( "202020", "A pipa não sobe mais", "2019-10-10", "2019-12-25", 1, 1 ),
	( "303030", "Nú com a mão no bolso", "2001-03-01", "2005-04-06", 1, 3 ),
	( "404040", "Comer tatu é bom", "1994-08-09", "1994-01-07", 2, 1 );