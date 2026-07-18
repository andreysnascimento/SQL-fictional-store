-- seed_data.sql
-- Popula o banco com dados fictícios para permitir análises realistas

INSERT INTO customers (name, email, city, state, created_at) VALUES
('Ana Silva', 'ana.silva@email.com', 'São Paulo', 'SP', '2024-01-10'),
('Bruno Costa', 'bruno.costa@email.com', 'Rio de Janeiro', 'RJ', '2024-01-15'),
('Carla Mendes', 'carla.mendes@email.com', 'Mauá', 'SP', '2024-02-02'),
('Diego Santos', 'diego.santos@email.com', 'Belo Horizonte', 'MG', '2024-02-20'),
('Elisa Ferreira', 'elisa.ferreira@email.com', 'Curitiba', 'PR', '2024-03-05'),
('Fábio Almeida', 'fabio.almeida@email.com', 'São Paulo', 'SP', '2024-03-18'),
('Gabriela Rocha', 'gabriela.rocha@email.com', 'Salvador', 'BA', '2024-04-01'),
('Hugo Martins', 'hugo.martins@email.com', 'Porto Alegre', 'RS', '2024-04-22'),
('Isabela Nunes', 'isabela.nunes@email.com', 'Mauá', 'SP', '2024-05-10'),
('João Pereira', 'joao.pereira@email.com', 'Recife', 'PE', '2024-06-01');

INSERT INTO categories (name) VALUES
('Eletrônicos'),
('Acessórios'),
('Roupas'),
('Casa e Cozinha'),
('Livros');

INSERT INTO products (name, category_id, price, stock_quantity) VALUES
('Fone de Ouvido Bluetooth', 1, 129.90, 50),
('Carregador Rápido USB-C', 1, 59.90, 120),
('Relógio Digital Prata', 2, 149.90, 30),
('Corrente de Prata 45cm', 2, 189.90, 25),
('Camiseta Básica Algodão', 3, 49.90, 200),
('Jaqueta Corta-Vento', 3, 199.90, 40),
('Jogo de Panelas Antiaderente', 4, 249.90, 15),
('Copo Térmico 500ml', 4, 79.90, 80),
('Livro: Introdução a Algoritmos', 5, 189.90, 20),
('Livro: SQL na Prática', 5, 99.90, 60);

INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2024-06-01', 'completed'),
(2, '2024-06-03', 'completed'),
(3, '2024-06-05', 'completed'),
(1, '2024-06-10', 'completed'),
(4, '2024-06-12', 'cancelled'),
(5, '2024-06-15', 'completed'),
(6, '2024-06-18', 'pending'),
(3, '2024-06-20', 'completed'),
(7, '2024-06-22', 'completed'),
(8, '2024-06-25', 'completed'),
(9, '2024-07-01', 'completed'),
(2, '2024-07-03', 'completed'),
(10, '2024-07-05', 'pending'),
(9, '2024-07-08', 'completed'),
(5, '2024-07-10', 'completed');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 129.90),
(1, 5, 2, 49.90),
(2, 3, 1, 149.90),
(3, 9, 1, 189.90),
(3, 10, 1, 99.90),
(4, 2, 3, 59.90),
(5, 6, 1, 199.90),
(6, 4, 1, 189.90),
(7, 7, 1, 249.90),
(8, 8, 2, 79.90),
(8, 5, 1, 49.90),
(9, 1, 2, 129.90),
(10, 3, 1, 149.90),
(10, 4, 1, 189.90),
(11, 10, 3, 99.90),
(12, 6, 1, 199.90),
(13, 2, 1, 59.90),
(14, 9, 1, 189.90),
(14, 1, 1, 129.90),
(15, 7, 1, 249.90);
