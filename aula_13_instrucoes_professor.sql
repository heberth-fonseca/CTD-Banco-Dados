USE emarket;

SELECT DataFatura FROM faturas;

SELECT COUNT(*) FROM faturas;

SELECT DATE_FORMAT(DataFatura, "%d/%m/%Y") AS DATA FROM faturas;

SELECT MAX(DataFatura) FROM faturas;

SELECT MIN(DataFatura) FROM faturas;

SELECT AVG(PrecoUnitario) FROM produtos;

SELECT ProdutoNome, PrecoUnitario FROM produtos
WHERE PrecoUnitario < (SELECT AVG(PrecoUnitario) FROM produtos);