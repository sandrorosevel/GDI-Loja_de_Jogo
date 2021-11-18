CREATE DATABASE loja;

CREATE TABLE ContaLoja(
  nome varchar(30),
  email varchar(100),
  senha varchar(20),
  primary key(nome)
);

CREATE TABLE Cliente(
  cpf char(11),
  nome varchar(100),
  apelido varchar(30),
  status_cliente varchar(15),
  primary key(nome)
);

CREATE TABLE Distribuidora(
  cnpj varchar(20),
  nome varchar(100) primary key,
  site_distribuidora varchar(100)
);

CREATE TABLE Jogo(
  nome varchar(100) primary key,
  desenvolvedora varchar(100) foreign key references Distribuidora(nome),
  nome_distribuidora varchar(100),
  classificacao_etaria integer,
  data_publi_atualicao date,
  pag_jogo varchar(100),
  preco varchar(10),
  nota_avaliacao real,
  especificacao_minima text,
  especificacao_recomendada text
);

CREATE TABLE DLC(
  id_dlc integer primary key,
  nome varchar(60),
  preco varchar(10),
  tamanho varchar(10),
  midia varchar(10)
);

CREATE TABLE Loja(
  id_loja integer,
  nome_jogo varchar(100) foreign key references Jogo(nome),
  tipo varchar(10) primary key(tipo)
);

CREATE TABLE repositorio(
  nome_jogo varchar(100) foreign key references Jogo(nome),
  nome_cliente varchar(100) foreign key references Cliente(nome),
  tipo_loja varchar(10),
  forma_adquirido varchar(10),
  data_adquido datetime,
  forma_pagamento varchar(20),
  primary key(nome_jogo, nome_cliente)
);

CREATE TABLE Emprestimo(
  nome_empresta varchar(100) foreign key references Cliente(nome),
  nome_recebe varchar(100) foreign key references Cliente(nome),
  nome_jogo varchar(100) foreign key references Jogo(nome),
  data_emprestimo date,
  data_devolucao date,
  primary key(nome_empresta, nome_recebe, nome_jogo)
);

CREATE TABLE formaPagamento(
  id_pagamento integer identity primary key,
  nome_cliente varchar(100) foreign key references Cliente(nome),
  numero_cartao char(16),
  codigo_seguraca char(3),
  nome_titular varchar(100),
  cpf_titular char(11),
  data_validade date,
  cep char(8),
  rua varchar(100),
  numero_casa integer,
  complemento text
);

CREATE TABLE Compra(
  nome_cliente varchar(100) foreign key references Cliente(nome),
  id_formaPagamento integer foreign key references formaPagamento(id_pagamento),
  data_compra date
);

CREATE TABLE generoJogo(
  nome_jogo varchar(100) foreign key references Jogo(nome),
  genero varchar(40),
  primary key (nome_jogo)
);

CREATE TABLE Idioma(
  nome_jogo varchar(100) foreign key references Jogo(nome),
  idioma varchar(15),
  primary key (nome_jogo)
);

CREATE TABLE Joga(
  nome_cliente varchar(100) foreign key references Cliente(nome),
  nome_jogo varchar(100) foreign key references Jogo(nome),
  data_hora_inicioSecao datetime,
  primary key (nome_cliente, nome_jogo)
);

CREATE TABLE Doa(
  nome_doa varchar(100) foreign key references Cliente(nome),
  nome_recebe varchar(100) foreign key references Cliente(nome),
  tipo_loja varchar(10) references Loja(tipo)
);

CREATE TABLE publicaJogo(
  nome_jogo varchar(100) foreign key references Jogo(nome),
  nome_distribuidora varchar(100) foreign key references Distribuidora(nome),
  tipo_loja varchar(10) foreign key references Loja(tipo)
);

CREATE TABLE publicaDLC(
  nome_jogo varchar(100) foreign key references Jogo(nome),
  nome_distribuidora varchar(100) foreign key references Distribuidora(nome),
  tipo_loja varchar(10) foreign key references Loja(tipo)
);