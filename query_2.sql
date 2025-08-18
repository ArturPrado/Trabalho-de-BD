use RestauranteDB;

SELECT p.PedidoID, p.DataHora, p.Total,
       c.Nome AS Cliente, 
       f.Nome AS Funcionario, f.Cargo
FROM Pedidos p
INNER JOIN Funcionarios f ON p.FuncionarioID = f.FuncionarioID
LEFT JOIN Clientes c ON p.ClienteID = c.ClienteID;
