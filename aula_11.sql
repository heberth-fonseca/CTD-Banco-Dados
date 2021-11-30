	use filmes_db;

-- Mostre o título de todas as séries e use alias para que o nome do campo fique com a primeira letra maiúscula.
	SELECT titulo AS Titulo FROM series;


-- Busque por título de filmes com Avaliação superior a 3, com mais de 1 prêmio e com data de 
-- lançamento entre '01-01-1988' e '31-12-2009'. Classifique os resultados em ordem decrescente.
	SELECT avaliacao, premios, titulo FROM filmes
	WHERE avaliacao > 3 AND premios > 1 AND data_lancamento BETWEEN '1988-01-01' AND '2009-12-31'
	ORDER BY avaliacao DESC;
	
	
-- Fazer um top 3 com os filmes a partir do 10º registro da consulta anterior.  
	SELECT avaliacao, premios, titulo FROM filmes
	WHERE avaliacao > 3 AND premios > 1 AND data_lancamento BETWEEN '1988-01-01' AND '2009-12-31'
	ORDER BY avaliacao DESC
	LIMIT 3 
	OFFSET 10;
	
	-- Quais são os 3 piores episódios considerando suas avaliações?
	SELECT * FROM episodios ORDER BY avaliacao ASC 
	LIMIT 3;
	
	
	-- Liste nome, sobrenome e avaliacao da tabela Atores. Utilize Alias para mostrar o título das colunas com 
	-- a 1a letra maiúscula. Substitua o nome  da coluna id por Identificação e da coluna avaliacao por Classificação.+
	SELECT ID AS Identificação, nome AS Nome, sobrenome AS Sobrenome, avaliacao AS Clasificação ,
	FROM atores;
	
	
	SELECT nome FROM atores
	WHERE nome LIKE '_A%';