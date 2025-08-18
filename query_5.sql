use RestauranteDB;

SELECT Nome, Preco
FROM Cardapio
WHERE ItemID NOT IN (
    SELECT DISTINCT ItemID
    FROM ItensPedido
);