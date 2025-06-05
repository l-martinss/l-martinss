
   create table categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

    create table produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    categoria_id INT,
    fornecedor_id INT,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

create table clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco TEXT,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco TEXT
);


create table pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('PENDENTE', 'PROCESSANDO', 'ENVIADO', 'ENTREGUE', 'CANCELADO') DEFAULT 'PENDENTE',
    total DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

create table vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL,
    metodo_pagamento ENUM('DINHEIRO', 'CARTAO_CREDITO', 'CARTAO_DEBITO', 'PIX', 'BOLETO') NOT NULL,
    observacoes TEXT,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
);

INSERT INTO categorias (nome, descricao) VALUES
('Celulares', 'Smartphones de várias marcas'),
('Notebooks', 'Computadores portáteis'),
('Televisores', 'TVs LED, OLED e QLED'),
('Acessórios', 'Fones, carregadores, cabos e outros');

INSERT INTO produtos (nome, descricao, preco, estoque, categoria_id, fornecedor_id) VALUES
-- Celulares
('iPhone 14 Pro', 'Apple iPhone 14 Pro com 128GB', 7499.00, 10, 1, 2),
('Samsung Galaxy S23', 'Galaxy S23 com 256GB, preto', 4299.00, 15, 1, 1),
('Xiaomi Redmi Note 12', 'Smartphone Xiaomi 128GB', 1899.00, 20, 1, 4),

-- Notebooks
('MacBook Air M2', 'Apple MacBook Air 13" com chip M2', 8999.00, 5, 2, 2),
('Samsung Book Intel i5', 'Notebook Samsung Intel Core i5 11ª Geração', 3299.00, 8, 2, 1),

-- Televisores
('Smart TV LG 50"', 'Smart TV LG 4K UHD LED', 2599.00, 7, 3, 3),
('Samsung QLED 55"', 'TV Samsung 55" QLED 4K', 3499.00, 4, 3, 1),

-- Acessórios
('Carregador Turbo Samsung', 'Carregador rapido Samsung 25W', 119.00, 30, 4, 1),
('Fone de ouvido Apple AirPods', 'Fone sem fio AirPods 2ª geração', 999.00, 12, 4, 2),
('Cabo USB-C Xiaomi', 'Cabo de carregamento rapido USB-C', 59.00, 50, 4, 4);
