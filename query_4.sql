use RestauranteDB;

SELECT p.PedidoID, m.Numero AS Mesa, 
       c.Nome AS Cliente, f.Nome AS Garcom,
       card.Nome AS Item, ip.Quantidade, ip.PrecoUnitario,
       (ip.Quantidade * ip.PrecoUnitario) AS Subtotal
FROM Pedidos p
JOIN Mesas m ON p.MesaID = m.MesaID
LEFT JOIN Clientes c ON p.ClienteID = c.ClienteID
JOIN Funcionarios f ON p.FuncionarioID = f.FuncionarioID
JOIN ItensPedido ip ON p.PedidoID = ip.PedidoID
JOIN Cardapio card ON ip.ItemID = card.ItemID
WHERE p.PedidoID = 1;