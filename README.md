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
2. Itens Mais Vendidos
sql
SELECT c.Nome, SUM(ip.Quantidade) AS TotalVendido
FROM ItensPedido ip
JOIN Cardapio c ON ip.ItemID = c.ItemID
GROUP BY c.ItemID
ORDER BY TotalVendido DESC
LIMIT 5;
3. Faturamento por Categoria
sql
SELECT cat.Categoria, 
       SUM(ip.Quantidade * ip.PrecoUnitario) AS Faturamento
FROM (
    SELECT ItemID, Categoria 
    FROM Cardapio
) cat
JOIN ItensPedido ip ON cat.ItemID = ip.ItemID
GROUP BY cat.Categoria;
🖼️ Prints do Sistema
(Espaço reservado para imagens do diagrama e resultados de consultas)

<!-- Exemplo de como inserir imagens posteriormente: ![Diagrama ER](caminho/para/imagem.png) ![Resultado Consulta](caminho/para/consulta.png) -->
⚙️ Como Utilizar
Executar scripts SQL na ordem de criação

Popular com dados iniciais

Utilizar as views e procedures criadas

📝 Observações
Projeto desenvolvido para AV3 de Banco de Dados

Modelo normalizado até 3FN

Compatível com MySQL 8.0+

text

Este README.md contém:
- Identificação clara do projeto
- Contextualização do problema
- Documentação da estrutura do banco
- Exemplos práticos de consultas
- Espaço dedicado para imagens (basta remover os comentários e adicionar os arquivos)
- Instruções básicas de uso

Você pode complementar com:
- Capturas do diagrama no Workbench
- Prints dos resultados das consultas
- Exemplos adicionais de uso
