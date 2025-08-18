use RestauranteDB;

CREATE VIEW PedidosEmAberto AS
SELECT p.PedidoID, p.DataHora, m.Numero AS Mesa,
       COALESCE(c.Nome, 'Cliente não identificado') AS Cliente,
       f.Nome AS Funcionario, p.Total
FROM Pedidos p
JOIN Mesas m ON p.MesaID = m.MesaID
LEFT JOIN Clientes c ON p.ClienteID = c.ClienteID
JOIN Funcionarios f ON p.FuncionarioID = f.FuncionarioID
WHERE p.Status = 'Aberto';