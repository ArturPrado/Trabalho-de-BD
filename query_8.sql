use RestauranteDB;

CREATE VIEW VendasPorCategoria AS
SELECT cat.Categoria, 
       SUM(ip.Quantidade * ip.PrecoUnitario) AS TotalVendido,
       COUNT(DISTINCT ip.PedidoID) AS PedidosComCategoria
FROM (
    SELECT ItemID, Categoria 
    FROM Cardapio
) cat
JOIN ItensPedido ip ON cat.ItemID = ip.ItemID
GROUP BY cat.Categoria
ORDER BY TotalVendido DESC;