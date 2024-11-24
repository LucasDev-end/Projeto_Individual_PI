create database culinaria;

use culinaria;

create table categoria(
idCategoria int primary key auto_increment,
nome varchar(45)
);


create table cadastro(
idcadastro int primary key auto_increment,
nome varchar(45),
email varchar(45),
cidade varchar(45),
estado char(2),
senha varchar(45),
fkCategoria int,
constraint fkCategoriaCadastro foreign key (fkcategoria)
							references categoria(idCategoria)
);

select * from cadastro;

create table receitas(
idReceitas int primary key auto_increment,
nome varchar(45),
tempoPreparo varchar(20),
fkCategoria int,
constraint fkCategoriaReceitas foreign key (fkcategoria)
							references categoria(idCategoria)
);

create table ingredientes(
idIngredientes int primary key auto_increment,
nome varchar(45)
);

insert into ingredientes values
( default, 'doce'),
( default, 'salgado');

select * from ingredientes;



create table item(
fkReceita int,
fkIngrediente int,
qtdIngrediente varchar(45)
);























