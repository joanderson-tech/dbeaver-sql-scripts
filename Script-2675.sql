
CREATE DATABASE IF NOT EXISTS livraria_db;
USE livraria_db;

-- 1. TABELA CLIENTES (Remove a redundância dos dados do cliente dos pedidos)
CREATE TABLE IF NOT EXISTS Clientes (
    ClienteID INT NOT NULL,
    NomeCliente VARCHAR(100) NOT NULL,
    EnderecoEntrega VARCHAR(200) NOT NULL,
    PRIMARY KEY (ClienteID)
);

-- 2. TABELA PRODUTOS (Catálogo central de livros)
CREATE TABLE IF NOT EXISTS Produtos (
    ProdutoID INT NOT NULL,
    NomeProduto VARCHAR(150) NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    PrecoUnitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (ProdutoID)
);

-- 3. TABELA PEDIDOS (Cabeçalho com o cliente que fez o pedido)
CREATE TABLE IF NOT EXISTS Pedidos (
    PedidoID INT NOT NULL,
    ClienteID INT NOT NULL,
    PRIMARY KEY (PedidoID),
    CONSTRAINT fk_Pedidos_Clientes
        FOREIGN KEY (ClienteID) REFERENCES Clientes (ClienteID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 4. TABELA ITENS_PEDIDO (Relacionamento N:M - Elimina dependências parciais)
CREATE TABLE IF NOT EXISTS ItensPedido (
    PedidoID INT NOT NULL,
    ProdutoID INT NOT NULL,
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (PedidoID, ProdutoID),
    CONSTRAINT fk_Itens_Pedidos
        FOREIGN KEY (PedidoID) REFERENCES Pedidos (PedidoID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_Itens_Produtos
        FOREIGN KEY (ProdutoID) REFERENCES Produtos (ProdutoID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


-- Inserindo Clientes (Conforme tabela do exercício)
INSERT INTO Clientes (ClienteID, NomeCliente, EnderecoEntrega) VALUES
(101, 'João Silva', 'Rua A, 123'),
(102, 'Maria Souza', 'Rua B, 456'),
(103, 'Ana Lima', 'Rua C, 789');

-- Inserindo Produtos (Conforme tabela do exercício)
INSERT INTO Produtos (ProdutoID, NomeProduto, Categoria, PrecoUnitario) VALUES
(201, 'Livro A', 'Ficção', 20.00),
(202, 'Livro B', 'História', 30.00),
(203, 'Livro C', 'Ciência', 25.00);

-- Inserindo Pedidos
INSERT INTO Pedidos (PedidoID, ClienteID) VALUES
(1, 101),
(2, 102),
(3, 103);

-- Inserindo os Itens dos Pedidos
INSERT INTO ItensPedido (PedidoID, ProdutoID, Quantidade, PrecoUnitario) VALUES
(1, 201, 2, 20.00),
(2, 202, 1, 30.00),
(3, 203, 3, 25.00);