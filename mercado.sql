
CREATE TABLE tbl_clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    email VARCHAR(100),
    endereco TEXT,
    data_nascimento DATE
);

CREATE TABLE tbl_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    categoria VARCHAR(50),
    preco_unitario DECIMAL(10,2) NOT NULL,
    qtd_estoque INT NOT NULL,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES tbl_fornecedores(id_fornecedor)
);

CREATE TABLE tbl_colaboradores (
    id_colaborador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    cargo VARCHAR(50),
    data_contratacao DATE,
    email VARCHAR(100)
);

CREATE TABLE tbl_vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATETIME NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(50),
    id_cliente INT,
    id_colaborador INT,
    FOREIGN KEY (id_cliente) REFERENCES tbl_clientes(id_cliente),
    FOREIGN KEY (id_colaborador) REFERENCES tbl_colaboradores(id_colaborador)
);

CREATE TABLE tbl_itens_venda (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT,
    id_produto INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES tbl_vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES tbl_produtos(id_produto)
);

CREATE TABLE tbl_fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    email VARCHAR(100),
    endereco TEXT
);
