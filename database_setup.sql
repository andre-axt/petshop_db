create database petshop_db;
use petshop_db;

create table cliente (
	id int not null primary key AUTO_INCREMENT,
    nome varchar(45) unique not null,
    cpf varchar(11) not null unique,
    telefone varchar(11) not null unique,
    email varchar(45) not null unique
);

create table pet (
	id int not null primary key AUTO_INCREMENT,
    cliente_id int not null,
    nome varchar(45) not null,
    especie ENUM("Cachorro", "Gato", "Tartaruga", "Passarinho") not null,
    porte ENUM("Pequeno", "Médio", "Grande") not null,
    nascimento date not null,
    CONSTRAINT fk_id_cliente FOREIGN key (cliente_id) REFERENCES cliente(id)
);

create table servico (
	id int not null primary key AUTO_INCREMENT,
    nome varchar(45) not null,
    preco int not null,
    duracao_min int not null
);

create table agendamento (
	id int not null primary key AUTO_INCREMENT,
    pet_id int not null,
    servico_id int not null,
    data_hora date not null,
    status varchar(15) not null,
    observacoes varchar(45) not null,
    CONSTRAINT fk_id_pet FOREIGN key (pet_id) REFERENCES pet(id),
    CONSTRAINT fk_id_servico FOREIGN key (servico_id) REFERENCES servico(id)
)