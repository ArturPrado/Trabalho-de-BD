# 📋 README - Sistema de Gestão de Restaurante

## 📌 Nome e Tema do Projeto
**Nome:** RestauranteDB  
**Tema:** Sistema de Gestão para Restaurantes (Grupo 3)

## 🎯 Descrição do Problema Modelado
O sistema foi desenvolvido para resolver problemas de gestão em restaurantes, incluindo:

- Controle de mesas e ocupação
- Gestão de pedidos e comandas
- Cadastro de cardápio e itens
- Registro de clientes e histórico
- Relatórios de vendas e desempenho

O modelo substitui sistemas manuais ou planilhas, automatizando processos e fornecendo dados para tomada de decisão.

## 🗃️ Entidades e Relacionamentos

### Principais Entidades:
1. **Clientes** - Armazena dados dos clientes (nome, contato)
2. **Mesas** - Cadastro das mesas do restaurante (capacidade, status)
3. **Funcionários** - Registro da equipe (cargo, data de contratação)
4. **Cardápio** - Itens disponíveis para venda (preço, categoria)
5. **Pedidos** - Registro de comandas (status, valor total)
6. **ItensPedido** - Relaciona pedidos com itens do cardápio (quantidade)

### Relacionamentos Chave:
- Um **Pedido** pertence a uma **Mesa** (1:N)
- Um **Pedido** é atendido por um **Funcionário** (1:N)
- Um **Pedido** pode ter um **Cliente** associado (1:N - opcional)
- Um **Pedido** contém vários **Itens do Cardápio** (N:M via tabela ItensPedido)

## 📊 Exemplos de Consultas

### 1. Pedidos em Aberto
```sql
SELECT p.PedidoID, m.Numero AS Mesa, 
       COALESCE(c.Nome, 'Consumidor não identificado') AS Cliente,
       p.Total
FROM Pedidos p
JOIN Mesas m ON p.MesaID = m.MesaID
LEFT JOIN Clientes c ON p.ClienteID = c.ClienteID
WHERE p.Status = 'Aberto';
```
![Resultado Query 1 - Pedidos em Aberto](/assets/query1.png)

### 2. Itens Mais Vendidos
```sql
SELECT c.Nome, SUM(ip.Quantidade) AS TotalVendido
FROM ItensPedido ip
JOIN Cardapio c ON ip.ItemID = c.ItemID
GROUP BY c.ItemID
ORDER BY TotalVendido DESC
LIMIT 5;
```
![Resultado Query 2 - Itens Mais Vendidos](/assets/query2.png)

### 3. Faturamento por Categoria
```sql
SELECT cat.Categoria, 
       SUM(ip.Quantidade * ip.PrecoUnitario) AS Faturamento
FROM (
    SELECT ItemID, Categoria 
    FROM Cardapio
) cat
JOIN ItensPedido ip ON cat.ItemID = ip.ItemID
GROUP BY cat.Categoria;
```
![Resultado Query 3 - Faturamento por Categoria](/assets/query3.png)

### 4. Clientes Frequentes
```sql
SELECT c.Nome, COUNT(p.PedidoID) AS TotalPedidos,
       SUM(p.Total) AS ValorTotal
FROM Clientes c
JOIN Pedidos p ON c.ClienteID = p.ClienteID
GROUP BY c.ClienteID
ORDER BY TotalPedidos DESC
LIMIT 5;
```
![Resultado Query 4 - Clientes Frequentes](/assets/query4.png)

### 5. Mesas Mais Utilizadas
```sql
SELECT m.Numero, COUNT(p.PedidoID) AS TotalUsos,
       SUM(p.Total) AS FaturamentoTotal
FROM Mesas m
JOIN Pedidos p ON m.MesaID = p.MesaID
GROUP BY m.MesaID
ORDER BY TotalUsos DESC
LIMIT 5;
```
![Resultado Query 5 - Mesas Mais Utilizadas](/assets/query5.png)

### 6. Funcionários com Mais Vendas
```sql
SELECT f.Nome, f.Cargo, COUNT(p.PedidoID) AS TotalAtendimentos,
       SUM(p.Total) AS ValorVendido
FROM Funcionarios f
JOIN Pedidos p ON f.FuncionarioID = p.FuncionarioID
GROUP BY f.FuncionarioID
ORDER BY TotalAtendimentos DESC
LIMIT 5;
```
![Resultado Query 6 - Funcionários com Mais Vendas](/assets/query6.png)

### 7. Horários de Pico
```sql
SELECT 
    CASE 
        WHEN HOUR(p.DataHora) BETWEEN 6 AND 11 THEN 'Manhã'
        WHEN HOUR(p.DataHora) BETWEEN 12 AND 17 THEN 'Tarde'
        ELSE 'Noite'
    END AS Periodo,
    COUNT(*) AS TotalPedidos,
    SUM(p.Total) AS Faturamento
FROM Pedidos p
GROUP BY Periodo
ORDER BY TotalPedidos DESC;
```
![Resultado Query 7 - Horários de Pico](/assets/query7.png)

## 🖼️ Diagrama do Banco de Dados

### Modelo Entidade-Relacionamento
![Diagrama ER - RestauranteDB](/restauranteDB.png)

## ⚙️ Como Utilizar
Executar scripts SQL na ordem de criação

Popular com dados iniciais

Utilizar as views e procedures criadas

📝 Observações
Projeto do Pradinho desenvolvido para AV3 de Banco de Dados

Modelo normalizado até 3FN

Compatível com MySQL 8.0+


