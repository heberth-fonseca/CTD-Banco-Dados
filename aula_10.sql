-- Criar banco de dados
# Criar comentário

CREATE SCHEMA restaurante;

USE restaurante;

CREATE TABLE cliente(
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome_cliente VARCHAR(50),
sobrenome_cliente VARCHAR(50),
cpf_cliente CHAR(11),
nr_celular_cliente CHAR(15),
email_cliente VARCHAR(150) UNIQUE
);

CREATE TABLE cardapio(
id_cardapio INT AUTO_INCREMENT PRIMARY KEY,
nome_cardapio VARCHAR (50),
imagem_cardapio VARCHAR(250)
);

CREATE TABLE produto(
id_produto INT AUTO_INCREMENT PRIMARY KEY,
id_cardapio INT,
nome_produto VARCHAR(50),
descricao_produto VARCHAR(300),
imagem_produto VARCHAR(250),
valor_produto DECIMAL (5,2),
CONSTRAINT FKcardapio
FOREIGN KEY (id_cardapio)
REFERENCES restaurante.cardapio (id_cardapio)
);

CREATE TABLE pedido (
id_pedido INT AUTO_INCREMENT PRIMARY KEY,
id_produto INT,
id_cliente INT,
quantidade_pedido INT,
preco_total DECIMAL(7,2),
CONSTRAINT FKproduto
FOREIGN KEY (id_produto)
REFERENCES restaurante.produto (id_produto),
CONSTRAINT FKcliente
FOREIGN KEY (id_cliente)
REFERENCES restaurante.cliente (id_cliente)
);

CREATE TABLE venda (
id_venda INT AUTO_INCREMENT PRIMARY KEY,
id_pedido INT,
data_atual DATE,
hora_atual TIME,
total DECIMAL(7,2),
CONSTRAINT FKpedido
FOREIGN KEY (id_pedido)
REFERENCES restaurante.pedido (id_pedido)
);

INSERT INTO cardapio (nome_cardapio, imagem_cardapio)
VALUES ('Comida Japonesa', 'https://p2.trrsf.com/image/fget/cf/648/0/images.terra.com/2021/09/30/1184578213-shutterstock10213676412.jpg%27);

INSERT INTO produto (nome_produto,descricao_produto, imagem_produto, valor_produto)
VALUES ('SUSHI BURGUER','Maravilhoso ultra hamburgue de Sushi',
'https://img-21.ccm2.net/yu-BCvJBRdx-7TEh0wMBN570kA0=/4986e5fe86904cc8b623e1d2e492e386/ccm-faq/1179749.jpg',
50.00);

SELECT*FROM produto;

UPDATE produto SET
id_cardapio = 1
WHERE id_produto = 3;

DELETE FROM produto WHERE id_produto = 1;