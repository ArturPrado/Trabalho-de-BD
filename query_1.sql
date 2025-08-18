use RestauranteDB;

INSERT INTO Clientes (Nome, Telefone, Email, DataCadastro) VALUES
('João Silva', '(11) 9999-8888', 'joao@email.com', '2023-01-15'),
('Maria Santos', '(11) 7777-6666', 'maria@email.com', '2023-02-20'),
('Carlos Oliveira', '(11) 5555-4444', NULL, '2023-03-10'),
('Ana Costa', '(11) 3333-2222', 'ana@email.com', '2023-04-05');

INSERT INTO Mesas (Numero, Capacidade, Status) VALUES
(2, 4, 'Livre'),
(3, 6, 'Livre'),
(4, 6, 'Livre'),
(5, 8, 'Livre'),
(6, 4, 'Livre');

INSERT INTO Funcionarios (Nome, Cargo, DataContratacao, Salario) VALUES
('Pedro Almeida', 'Garçom', '2022-05-10', 2200.00),
('Fernanda Lima', 'Chef de Cozinha', '2021-11-15', 4500.00),
('Ricardo Souza', 'Gerente', '2020-08-20', 5800.00),
('Juliana Rocha', 'Garçom', '2023-01-05', 2200.00);

INSERT INTO Cardapio (Nome, Descricao, Preco, Categoria, Disponivel) VALUES
('Pizza Margherita', 'Molho de tomate, mussarela e manjericão', 45.90, 'Pizza', TRUE),
('Lasanha Bolonhesa', 'Camadas de massa com molho bolonhesa e queijo', 52.50, 'Massas', TRUE),
('Filé Mignon', '200g com molho madeira e acompanhamentos', 78.90, 'Carnes', TRUE),
('Salada Caesar', 'Alface, croutons, parmesão e molho caesar', 32.00, 'Saladas', TRUE),
('Suco Natural', 'Laranja, limão ou abacaxi com hortelã', 12.50, 'Bebidas', TRUE),
('Tiramisu', 'Sobremesa italiana com café e mascarpone', 28.00, 'Sobremesas', TRUE),
('Risoto de Cogumelos', 'Arroz arbóreo com cogumelos frescos', 46.00, 'Massas', FALSE);

INSERT INTO Pedidos (ClienteID, MesaID, FuncionarioID, DataHora, Status) VALUES
(1, 2, 1, '2023-05-01 19:30:00', 'Fechado'),
(2, 1, 4, '2023-05-01 20:15:00', 'Fechado'),
(NULL, 3, 1, '2023-05-02 12:45:00', 'Aberto'),
(3, 4, 4, '2023-05-02 21:00:00', 'Fechado');

INSERT INTO ItensPedido (PedidoID, ItemID, Quantidade, PrecoUnitario, Observacao) VALUES
(1, 1, 2, 45.90, 'Sem manjericão'),
(1, 5, 3, 12.50, '2 de laranja e 1 de abacaxi'),
(1, 6, 1, 28.00, NULL),
(2, 2, 1, 52.50, NULL),
(2, 4, 1, 32.00, 'Sem croutons'),
(3, 3, 1, 78.90, 'Bem passado'),
(3, 5, 2, 12.50, '1 de limão e 1 de laranja'),
(4, 1, 1, 45.90, NULL),
(4, 3, 2, 78.90, '1 ao ponto e 1 mal passado'),
(4, 6, 2, 28.00, NULL);

UPDATE Pedidos p
SET Total = (
    SELECT SUM(ip.Quantidade * ip.PrecoUnitario)
    FROM ItensPedido ip
    WHERE ip.PedidoID = p.PedidoID
);