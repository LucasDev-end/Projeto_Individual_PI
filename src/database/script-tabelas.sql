-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE aquatech;

USE aquatech;

CREATE TABLE empresa (
	id INT PRIMARY KEY AUTO_INCREMENT,
	razao_social VARCHAR(50),
	cnpj CHAR(14),
	codigo_ativacao VARCHAR(50)
);

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT,
	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
);

insert into empresa (razao_social, codigo_ativacao) values ('Empresa 1', 'ED145B');
insert into empresa (razao_social, codigo_ativacao) values ('Empresa 2', 'A1B2C3');
insert into aquario (descricao, fk_empresa) values ('Aquário de Estrela-do-mar', 1);
insert into aquario (descricao, fk_empresa) values ('Aquário de Peixe-dourado', 2);

---------------------------------------------------------------------------------------------------------------------
select * from usuario;

alter table usuario
add column cpf varchar(15);

desc usuario;

select * from aquario;
select * from medida;

insert into medida values
(default,45.3, 26.5, 300.0, 25.8, 1, '2024-11-06 10:30:00', 1),
(default,48.7, 27.2, 310.5, 26.1, 0, '2024-11-06 11:00:00', 1),
(default,50.1, 28.0, 290.0, 27.0, 1, '2024-11-06 12:15:00', 2),
(default,42.0, 25.0, 320.2, 24.5, 0, '2024-11-06 13:45:00', 2),
(default,55.6, 29.4, 295.8, 28.3, 1, '2024-11-06 14:20:00', 2);

insert into medida values
(default,51.3, 28.5, 300.0, 28.8, 0, '2024-12-15 11:30:00', 1);

