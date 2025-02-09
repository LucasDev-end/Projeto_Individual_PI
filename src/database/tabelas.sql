create database culinaria;

use culinaria;

create table categoria(
idCategoria int primary key auto_increment,
nomeCategoria varchar(45)
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

delete from categoria 
where idCategoria >2 ;

create table receitas(
idReceitas int primary key auto_increment,
nomeReceita varchar(45),
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

INSERT INTO receitas 
(nome, tempoPreparo, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, fkCategoria)
VALUES
('Bolo de Chocolate', '60 minutos', 'Farinha', 'Açúcar', 'Chocolate em pó', 'Ovos', 'Leite', 1);

INSERT INTO receitas 
(nome, tempoPreparo, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, fkCategoria)
VALUES
('Pizza de Calabresa', '45 minutos', 'Massa de pizza', 'Molho de tomate', 'Calabresa', 'Queijo', 'Cebola', 2);

INSERT INTO receitas 
(nome, tempoPreparo, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, fkCategoria)
VALUES
('Salada Caesar', '15 minutos', 'Alface', 'Croutons', 'Parmesão', 'Molho Caesar', 'Frango grelhado', 1);

select * from receitas;

SELECT *
FROM receitas r
JOIN categoria c ON r.fkCategoria = c.idCategoria
WHERE r.fkCategoria = 2
  AND (
      ingrediente1 IN ('Tomate', 'Queijo', 'Presunto') OR
      ingrediente2 IN ('Tomate', 'Queijo', 'Presunto') OR
      ingrediente3 IN ('Tomate', 'Queijo', 'Presunto') OR
      ingrediente4 IN ('Tomate', 'Queijo', 'Presunto') OR
      ingrediente5 IN ('Tomate', 'Queijo', 'Presunto') OR
      ingrediente6 IN ('Tomate', 'Queijo', 'Presunto') OR
      ingrediente7 IN ('Tomate', 'Queijo', 'Presunto') OR
      ingrediente8 IN ('Tomate', 'Queijo', 'Presunto') OR
      ingrediente9 IN ('Tomate', 'Queijo', 'Presunto') OR
      ingrediente10 IN ('Tomate', 'Queijo', 'Presunto')
      )
      limit 1;