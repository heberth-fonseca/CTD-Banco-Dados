USE musimundos;

-- 1 - O valor da fatura mais alta cujo a cidade de cobran�a � �Oslo�. (MAX)
SELECT MAX(valor_total) AS FaturaMax FROM faturas
WHERE cidade_cobranca = "Oslo";

-- 2 - O valor da fatura mais baixa de todas. (MIN)
SELECT MIN(valor_total) AS FaturaMin FROM faturas;

-- 3 - O valor m�dio das faturas que o pa�s de cobran�a � �Canada�. (AVG)
SELECT AVG(valor_total) AS ValorMedio FROM faturas
WHERE pais_cobranca = "Canada";

-- 4 - A quantidade de faturas que o pa�s de cobran�a � �Canada�. (COUNT)
SELECT COUNT(*) AS QtdFatura FROM faturas
WHERE pais_cobranca = "Canada";

-- 5 - O valor total somado de todas as faturas. (SUM)
SELECT SUM(valor_total) AS SomaFatura FROM faturas;

-- 6 - Selecione o id, a data e valor das faturas com valor abaixo da m�dia. (Subqueries e AVG)
SELECT id, data_fatura, valor_total FROM faturas
WHERE valor_total < (SELECT AVG(valor_total) FROM faturas);

-- 7 - A data de nascimento do funcion�rio mais jovem da empresa (MAX)
SELECT MAX(data_nascimento) AS MaxDataNasc FROM empregados;

-- 8 - A data de nascimento do funcion�rio mais velho da empresa (MIN)
SELECT MIN(data_nascimento) AS MinDataNasc FROM empregados;

-- 9 - Formate a data do nascimento dos funcion�rios no formato ex: "02 May 2020". (DATE_FORMAT)
SELECT DATE_FORMAT(data_nascimento, "%d %M %Y") AS DataNascimento FROM empregados;

-- 10 - O numero de cancoes que tem como compositor �AC/DC�. (COUNT) 
SELECT COUNT(*) AS CompACDC FROM cancoes
WHERE compositor = "AC/DC";

-- 11 - A dura��o m�dia das m�sicas em milisegundos (AVG)
SELECT AVG(duracao_milisegundos) AS DuracaoMiliseg FROM cancoes;

-- 12 - O tamanho m�dio em bytes das m�sicas que como compositor �AC/DC�. (AVG)
SELECT AVG(bytes) AS TamanBytes FROM cancoes
WHERE compositor = "AC/DC";

-- 13 - Quantidade de clientes que moram na cidade de �S�o Paulo�. (COUNT)
SELECT COUNT(*) AS MoramSP FROM clientes
WHERE cidade = "S�o Paulo";

-- 14 - Quantidade de clientes que moram na cidade �Paris�. (COUNT)
SELECT COUNT(*) AS MoramParis FROM clientes
WHERE cidade = "Paris";

-- 15 - Quantidade de clientes que tenham email do �yahoo�. (COUNT e LIKE)
SELECT COUNT(*) AS EmailYahoo FROM clientes
WHERE email LIKE "%yahoo%";



