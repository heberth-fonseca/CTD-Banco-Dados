SELECT * FROM correios;
SELECT * FROM clientes;

SELECT c.Empresa, COUNT(cl.ClienteID), SUM(f.Transporte)
FROM faturas AS f
INNER JOIN clientes AS cl ON cl.ClienteID = f.ClienteID 
INNER JOIN correios AS c ON c.CorreioID = f.FormaEnvio
GROUP BY c.Empresa;
