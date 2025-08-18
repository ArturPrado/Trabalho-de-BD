use RestauranteDB;

SELECT c.Nome, c.Categoria,
       SUM(ip.Quantidade) AS TotalVendido,
       SUM(ip.Quantidade * ip.PrecoUnitario) AS Faturamento
FROM ItensPedido ip
JOIN Cardapio c ON ip.ItemID = c.ItemID
GROUP BY c.ItemID
ORDER BY TotalVendido DESC
LIMIT 5;