use RestauranteDB;

SELECT DATE(DataHora) AS Dia,
       COUNT(*) AS QuantidadePedidos,
       SUM(Total) AS TotalVendido,
       AVG(Total) AS TicketMedio
FROM Pedidos
WHERE Status = 'Fechado'
GROUP BY DATE(DataHora)
ORDER BY Dia;