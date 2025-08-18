use RestauranteDB;

SELECT c.Nome, c.Telefone, p.Total AS ValorPedido
FROM Clientes c
JOIN (
    SELECT ClienteID, Total
    FROM Pedidos
    WHERE Total > (SELECT AVG(Total) FROM Pedidos)
) p ON c.ClienteID = p.ClienteID;