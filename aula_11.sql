	use filmes_db;

-- Mostre o t�tulo de todas as s�ries e use alias para que o nome do campo fique com a primeira letra mai�scula.
	SELECT titulo AS Titulo FROM series;


-- Busque por t�tulo de filmes com Avalia��o superior a 3, com mais de 1 pr�mio e com data de 
-- lan�amento entre '01-01-1988' e '31-12-2009'. Classifique os resultados em ordem decrescente.
	SELECT avaliacao, premios, titulo FROM filmes
	WHERE avaliacao > 3 AND premios > 1 AND data_lancamento BETWEEN '1988-01-01' AND '2009-12-31'
	ORDER BY avaliacao DESC;
	
	
-- Fazer um top 3 com os filmes a partir do 10� registro da consulta anterior.  
	SELECT avaliacao, premios, titulo FROM filmes
	WHERE avaliacao > 3 AND premios > 1 AND data_lancamento BETWEEN '1988-01-01' AND '2009-12-31'
	ORDER BY avaliacao DESC
	LIMIT 3 
	OFFSET 10;
	
	-- Quais s�o os 3 piores epis�dios considerando suas avalia��es?
	SELECT * FROM episodios ORDER BY avaliacao ASC 
	LIMIT 3;
	
	
	-- Liste nome, sobrenome e avaliacao da tabela Atores. Utilize Alias para mostrar o t�tulo das colunas com 
	-- a 1a letra mai�scula. Substitua o nome  da coluna id por Identifica��o e da coluna avaliacao por Classifica��o.+
	SELECT ID AS Identifica��o, nome AS Nome, sobrenome AS Sobrenome, avaliacao AS Clasifica��o ,
	FROM atores;
	
	
	SELECT nome FROM atores
	WHERE nome LIKE '_A%';