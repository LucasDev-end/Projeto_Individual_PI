create database culinaria;

use culinaria;

create table categoria(
idCategoria int primary key auto_increment,
nome varchar(45)
);

insert into categoria values
( default, 'doce'),
( default, 'salgado');

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
ingrediente1 varchar(45),
ingrediente2 varchar(45),
ingrediente3 varchar(45),
ingrediente4 varchar(45),
ingrediente5 varchar(45),
ingrediente6 varchar(45),
ingrediente7 varchar(45),
ingrediente8 varchar(45),
ingrediente9 varchar(45),
ingrediente10 varchar(45),
fkCategoria int,
constraint fkCategoriaReceitas foreign key (fkcategoria)
							references categoria(idCategoria)
);























