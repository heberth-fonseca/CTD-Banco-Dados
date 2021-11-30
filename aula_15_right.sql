SELECT CONCAT("00000000",FaturaId) FROM faturas;

SELECT RIGHT (CONCAT("00000000",f.FaturaId),8) AS NFatura,
DATE_FORMAT(f.DataFatura, '%Y-%m-%d') AS DF, c.Cidade AS Cidade_cliente, f.CidadeEnvio AS Cidade_Fatura, c.Pais AS Pais
FROM faturas AS f
INNER JOIN clientes AS c ON c.ClienteID = f.ClienteID
WHERE c.Cidade <> f.CidadeEnvio AND c.Pais = "UK";
