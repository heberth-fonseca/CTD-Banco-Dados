USE musimundos;

-- 1 - O valor da fatura mais alta cujo a cidade de cobrança é “Oslo”. (MAX)
SELECT MAX(valor_total) AS FaturaMax FROM faturas
WHERE cidade_cobranca = "Oslo";

-- 2 - O valor da fatura mais baixa de todas. (MIN)
SELECT MIN(valor_total) AS FaturaMin FROM faturas;

-- 3 - O valor médio das faturas que o país de cobrança é “Canada”. (AVG)
SELECT AVG(valor_total) AS ValorMedio FROM faturas
WHERE pais_cobranca = "Canada";

-- 4 - A quantidade de faturas que o país de cobrança é “Canada”. (COUNT)
SELECT COUNT(*) AS QtdFatura FROM faturas
WHERE pais_cobranca = "Canada";

-- 5 - O valor total somado de todas as faturas. (SUM)
SELECT SUM(valor_total) AS SomaFatura FROM faturas;

-- 6 - Selecione o id, a data e valor das faturas com valor abaixo da média. (Subqueries e AVG)
SELECT id, data_fatura, valor_total FROM faturas
WHERE valor_total < (SELECT AVG(valor_total) FROM faturas);

-- 7 - A data de nascimento do funcionário mais jovem da empresa (MAX)
SELECT MAX(data_nascimento) AS MaxDataNasc FROM empregados;

-- 8 - A data de nascimento do funcionário mais velho da empresa (MIN)
SELECT MIN(data_nascimento) AS MinDataNasc FROM empregados;

-- 9 - Formate a data do nascimento dos funcionários no formato ex: "02 May 2020". (DATE_FORMAT)
SELECT DATE_FORMAT(data_nascimento, "%d %M %Y") AS DataNascimento FROM empregados;

-- 10 - O numero de cancoes que tem como compositor “AC/DC”. (COUNT) 
SELECT COUNT(*) AS CompACDC FROM cancoes
WHERE compositor = "AC/DC";

-- 11 - A duração média das músicas em milisegundos (AVG)
SELECT AVG(duracao_milisegundos) AS DuracaoMiliseg FROM cancoes;

-- 12 - O tamanho médio em bytes das músicas que como compositor “AC/DC”. (AVG)
SELECT AVG(bytes) AS TamanBytes FROM cancoes
WHERE compositor = "AC/DC";

-- 13 - Quantidade de clientes que moram na cidade de “São Paulo”. (COUNT)
SELECT COUNT(*) AS MoramSP FROM clientes
WHERE cidade = "São Paulo";

-- 14 - Quantidade de clientes que moram na cidade “Paris”. (COUNT)
SELECT COUNT(*) AS MoramParis FROM clientes
WHERE cidade = "Paris";

-- 15 - Quantidade de clientes que tenham email do “yahoo”. (COUNT e LIKE)
SELECT COUNT(*) AS EmailYahoo FROM clientes
WHERE email LIKE "%yahoo%";



