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
select * from categoria;

create table receitas(
idReceitas int primary key auto_increment,
nome varchar(45),
tempoPreparo varchar(20),
ingrediente1 varchar(100),
ingrediente2 varchar(100),
ingrediente3 varchar(100),
ingrediente4 varchar(100),
ingrediente5 varchar(100),
ingrediente6 varchar(100),
ingrediente7 varchar(100),
ingrediente8 varchar(100),
ingrediente9 varchar(100),
ingrediente10 varchar(100),
fkCategoria int,
constraint fkCategoriaReceitas foreign key (fkcategoria)
							references categoria(idCategoria)
);

select * from receita;























