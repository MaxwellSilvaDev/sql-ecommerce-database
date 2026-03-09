CREATE TABLE Cliente(
id INT PRIMARY KEY IDENTITY(1, 1),
nome VARCHAR(150) NOT NULL,
telefone VARCHAR(50) NOT NULL,
cpf CHAR(11),
cnpj CHAR(14),
endereco VARCHAR(200) NOT NULL,
tipo_cliente VARCHAR(2) NOT NULL
);

CREATE TABLE Fornecedor(
id INT PRIMARY KEY IDENTITY(1, 1),
nome VARCHAR(150) NOT NULL,
cnpj CHAR(14) NOT NULL
);

CREATE TABLE Vendedor_Terceirizado(
id INT PRIMARY KEY IDENTITY(1, 1),
nome VARCHAR(150) NOT NULL,
cnpj CHAR(14) NOT NULL
);

CREATE TABLE Produto(
id INT PRIMARY KEY IDENTITY(1, 1),
nome VARCHAR(150) NOT NULL,
preco DECIMAL(10,2) NOT NULL,
id_fornecedor INT NOT NULL,
id_vendedor INT NOT NULL,

FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id),
FOREIGN KEY (id_vendedor) REFERENCES Vendedor_Terceirizado(id)
);

CREATE TABLE Estoque(
id INT PRIMARY KEY IDENTITY(1, 1),
id_produto INT NOT NULL,
quantidade INT NOT NULL,

FOREIGN KEY (id_produto) REFERENCES Produto(id)
);

CREATE TABLE Pedido(
id INT PRIMARY KEY IDENTITY(1, 1),
id_cliente INT NOT NULL,
data_pedido DATE NOT NULL,
status_pedido VARCHAR(100) NOT NULL,
endereco_entrega VARCHAR(250) NOT NULL,

FOREIGN KEY (id_cliente) REFERENCES Cliente(id)
);

CREATE TABLE Item_Pedido(
id INT PRIMARY KEY IDENTITY(1, 1),
id_pedido INT NOT NULL,
id_produto INT NOT NULL,
quantidade INT NOT NULL,
preco_unitario DECIMAL(10,2) NOT NULL,

FOREIGN KEY (id_pedido) REFERENCES Pedido(id),
FOREIGN KEY (id_produto) REFERENCES Produto(id)
);

CREATE TABLE Pagamento(
id INT PRIMARY KEY IDENTITY(1, 1),
id_cliente INT NOT NULL,
tipo_pagamento VARCHAR(20) NOT NULL,

FOREIGN KEY (id_cliente) REFERENCES Cliente(id)
);

CREATE TABLE Entrega(
id INT PRIMARY KEY IDENTITY(1, 1),
id_pedido INT NOT NULL,
status_entrega VARCHAR(250) NOT NULL,
codigo_rastreamento VARCHAR(100) NOT NULL,

FOREIGN KEY (id_pedido) REFERENCES Pedido(id)
);
