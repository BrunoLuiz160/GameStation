CREATE DATABASE Game_Store;
USE Game_Store;

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Desenvolvedora (
    id_desenvolvedora INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    pais VARCHAR(60)
);

CREATE TABLE Jogo (
    id_jogo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    data_lancamento DATE,
    id_desenvolvedora INT NOT NULL,
    FOREIGN KEY (id_desenvolvedora)
        REFERENCES Desenvolvedora(id_desenvolvedora),
    CHECK (preco >= 0)
);

CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE,
    descricao TEXT
);

CREATE TABLE JogoCategoria (
    id_jogo INT NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY (id_jogo, id_categoria),
    FOREIGN KEY (id_jogo)
        REFERENCES Jogo(id_jogo),
    FOREIGN KEY (id_categoria)
        REFERENCES Categoria(id_categoria)
);

CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0,
    status VARCHAR(30) NOT NULL DEFAULT 'Pendente',
    FOREIGN KEY (id_usuario)
        REFERENCES Usuario(id_usuario),
    CHECK (valor_total >= 0)
);

CREATE TABLE ItemPedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_jogo INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    FOREIGN KEY (id_pedido)
        REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_jogo)
        REFERENCES Jogo(id_jogo),
    UNIQUE (id_pedido, id_jogo),
    CHECK (preco_unitario >= 0),
    CHECK (quantidade > 0)
);

CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL UNIQUE,
    metodo VARCHAR(40) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'Pendente',
    data_pagamento DATETIME,
    FOREIGN KEY (id_pedido)
        REFERENCES Pedido(id_pedido),
    CHECK (valor >= 0)
);

CREATE TABLE Biblioteca (
    id_biblioteca INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_jogo INT NOT NULL,
    data_aquisicao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario)
        REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_jogo)
        REFERENCES Jogo(id_jogo),
    UNIQUE (id_usuario, id_jogo)
);

CREATE TABLE Avaliacao (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_jogo INT NOT NULL,
    nota INT NOT NULL,
    comentario TEXT,
    data_avaliacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario)
        REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_jogo)
        REFERENCES Jogo(id_jogo),
    UNIQUE (id_usuario, id_jogo),
    CHECK (nota BETWEEN 1 AND 5)
);