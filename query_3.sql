use RestauranteDB;

SELECT c.Nome, c.Categoria, c.Preco,
       COUNT(ip.ItemID) AS VezesPedido,
       SUM(ip.Quantidade) AS TotalItensVendidos
FROM Cardapio c
LEFT JOIN ItensPedido ip ON c.ItemID = ip.ItemID
GROUP BY c.ItemID
ORDER BY TotalItensVendidos DESC;