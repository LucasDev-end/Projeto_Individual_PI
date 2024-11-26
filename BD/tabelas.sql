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

create table receitas(
idReceitas int primary key auto_increment,
nomeReceitas varchar(45),
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
descricao varchar (300),
constraint fkCategoriaReceitas foreign key (fkcategoria)
							references categoria(idCategoria)
);

insert into categoria values
(default,'Doce'),
(default,'Salgado'),
(default,'Sobremesa'),
(default,'Entradas'),
(default,'Lanches'),
(default,'Sopas'),
(default,'Salada'),
(default,'Carne'),
(default,'Frango'),
(default,'Fitness');

insert into receitas (nomeReceitas, tempoPreparo, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, fkCategoria, descricao) values
('Bolo de Chocolate', '60 minutos', 'Farinha', 'Açúcar', 'Chocolate em pó', 'Ovos', 'Leite', 1, 'Misture todos os ingredientes e asse em forno preaquecido a 180°C por 40 minutos.'),
('Pizza de Calabresa', '45 minutos', 'Massa de pizza', 'Molho de tomate', 'Calabresa', 'Queijo', 'Cebola', 2, 'Abra a massa, adicione molho e os ingredientes, e asse por 20 minutos a 200°C.'),
('Brigadeiro', '15 minutos', 'Leite condensado', 'Chocolate em pó', 'Manteiga', 'Chocolate granulado', 'Leite', 3, 'Misture o leite condensado, manteiga e chocolate. Cozinhe até dar ponto de enrolar e cubra com granulado.'),
('Salada de Frutas', '10 minutos', 'Banana', 'Maçã', 'Laranja', 'Uva', 'Morango', 7, 'Corte as frutas em cubos e misture em uma tigela. Sirva gelada.'),
('Coxinha', '60 minutos', 'Frango', 'Massa de coxinha', 'Queijo', 'Óleo', 'Tempero', 2, 'Desfie o frango e recheie a massa. Modele e frite até dourar.'),
('Sopa de Abóbora', '30 minutos', 'Abóbora', 'Cebola', 'Alho', 'Cenoura', 'Caldo de galinha', 6, 'Refogue os legumes e cozinhe com caldo até amolecer. Bata no liquidificador.'),
('Hambúrguer Caseiro', '30 minutos', 'Carne moída', 'Queijo', 'Pão de hambúrguer', 'Alface', 'Tomate', 5, 'Modele os hambúrgueres e grelhe até o ponto desejado. Monte o hambúrguer no pão.'),
('Feijoada', '180 minutos', 'Feijão preto', 'Carne de porco', 'Linguiça', 'Alho', 'Cebola', 8, 'Cozinhe todos os ingredientes por 2-3 horas até ficarem macios. Sirva com arroz.'),
('Frango ao Curry', '45 minutos', 'Frango', 'Curry', 'Cebola', 'Alho', 'Creme de leite', 9, 'Tempere o frango e cozinhe com cebola e alho. Adicione o curry e o creme de leite.'),
('Salada Caesar', '15 minutos', 'Alface', 'Croutons', 'Parmesão', 'Molho Caesar', 'Frango grelhado', 7, 'Misture todos os ingredientes e adicione o molho Caesar. Sirva imediatamente.'),
('Arroz de Carne', '45 minutos', 'Arroz', 'Carne', 'Cebola', 'Alho', 'Tomate', 8, 'Refogue a carne com os temperos, adicione arroz e cozinhe com água até secar.'),
('Torta de Maçã', '90 minutos', 'Maçã', 'Açúcar', 'Farinha', 'Manteiga', 'Ovos', 3, 'Prepare a massa, coloque as maçãs picadas e asse até dourar.'),
('Lasanha de Carne', '90 minutos', 'Massa de lasanha', 'Carne moída', 'Queijo', 'Molho de tomate', 'Alho', 2, 'Monte a lasanha em camadas e asse por 40 minutos.'),
('Bolo de Coco', '50 minutos', 'Farinha', 'Açúcar', 'Coco ralado', 'Ovos', 'Leite', 3, 'Misture os ingredientes, asse e decore com coco ralado.'),
('Sopa de Lentilha', '40 minutos', 'Lentilha', 'Cenoura', 'Cebola', 'Alho', 'Caldo de legumes', 6, 'Cozinhe os ingredientes até amolecerem. Bata no liquidificador e sirva.'),
('Quiche de Alho Poró', '60 minutos', 'Alho poró', 'Queijo', 'Massa', 'Ovos', 'Creme de leite', 5, 'Misture os ingredientes e asse a quiche até dourar.'),
('Salada Grega', '15 minutos', 'Pepino', 'Tomate', 'Queijo feta', 'Azeitona', 'Azeite', 7, 'Misture todos os ingredientes e sirva gelado.'),
('Churrasco de Frango', '120 minutos', 'Frango', 'Alho', 'Limão', 'Sal', 'Óleo', 9, 'Tempere o frango e asse na churrasqueira até dourar.'),
('Sanduíche de Atum', '10 minutos', 'Pão', 'Atum', 'Maionese', 'Alface', 'Tomate', 5, 'Misture o atum com maionese e monte o sanduíche no pão.'),
('Pão de Alho', '30 minutos', 'Farinha', 'Alho', 'Manteiga', 'Salsinha', 'Leite', 2, 'Misture os ingredientes, modelem os pães e asse até dourar.'),
('Strogonoff de Carne', '45 minutos', 'Carne', 'Creme de leite', 'Cebola', 'Alho', 'Molho de tomate', 8, 'Cozinhe a carne, adicione o molho e o creme de leite. Sirva com arroz e batata palha.');


INSERT INTO cadastro (nome, email, cidade, estado, senha, fkCategoria)
VALUES
('joão silva', 'joao.silva@email.com', 'são paulo', 'SP', 'Senha@123', 1),
('maria oliveira', 'maria.oliveira@email.com', 'rio de janeiro', 'RJ', 'Segura@456', 2),
('pedro santos', 'pedro.santos@email.com', 'belo horizonte', 'MG', 'Forte#789', 3),
('ana souza', 'ana.souza@email.com', 'curitiba', 'PR', 'Senha$101', 1),
('lucas mendes', 'lucas.mendes@email.com', 'porto alegre', 'RS', 'Senha@202', 2),
('beatriz lima', 'beatriz.lima@email.com', 'salvador', 'BA', 'Senha#303', 3),
('carlos andrade', 'carlos.andrade@email.com', 'fortaleza', 'CE', 'Senha$404', 1),
('fernanda costa', 'fernanda.costa@email.com', 'manaus', 'AM', 'Senha@505', 2),
('rafael martins', 'rafael.martins@email.com', 'recife', 'PE', 'Senha#606', 3),
('juliana alves', 'juliana.alves@email.com', 'goiânia', 'GO', 'Senha$707', 1),
('gabriel rocha', 'gabriel.rocha@email.com', 'belém', 'PA', 'Senha@808', 2),
('carla torres', 'carla.torres@email.com', 'são luís', 'MA', 'Senha#909', 3),
('ricardo pereira', 'ricardo.pereira@email.com', 'florianópolis', 'SC', 'Senha$010', 1),
('letícia freitas', 'leticia.freitas@email.com', 'vitória', 'ES', 'Senha@121', 2),
('eduardo azevedo', 'eduardo.azevedo@email.com', 'campo grande', 'MS', 'Senha#232', 3),
('patrícia fernandes', 'patricia.fernandes@email.com', 'aracaju', 'SE', 'Senha$343', 1),
('diego moraes', 'diego.moraes@email.com', 'teresina', 'PI', 'Senha@454', 2),
('tatiane ribeiro', 'tatiane.ribeiro@email.com', 'natal', 'RN', 'Senha#565', 3),
('andré neves', 'andre.neves@email.com', 'joão pessoa', 'PB', 'Senha$676', 1),
('mônica nogueira', 'monica.nogueira@email.com', 'maceió', 'AL', 'Senha@787', 2);


select * from receitas;
select * from cadastro;
select * from categoria;

select *
from receitas as r
join categoria as c on r.fkCategoria = c.idCategoria
where r.fkCategoria = 2
and (
  ingrediente1 in ('Tomate', 'Queijo', 'Presunto') or
  ingrediente2 in ('Tomate', 'Queijo', 'Presunto') OR
  ingrediente3 in ('Tomate', 'Queijo', 'Presunto') or
  ingrediente4 in ('Tomate', 'Queijo', 'Presunto') or
  ingrediente5 in ('Tomate', 'Queijo', 'Presunto') or
  ingrediente6 in ('Tomate', 'Queijo', 'Presunto') or
  ingrediente7 in ('Tomate', 'Queijo', 'Presunto') or
  ingrediente8 in ('Tomate', 'Queijo', 'Presunto') or
  ingrediente9 in ('Tomate', 'Queijo', 'Presunto') or
  ingrediente10 in ('Tomate', 'Queijo', 'Presunto')
  )
  limit 1;


select c.nome as categoria, count(ca.idcadastro) as quantidade
from cadastro ca
join categoria c on ca.fkcategoria = c.idcategoria
group by c.idcategoria
order by quantidade desc
limit 1;

select concat(cidade, ', ', estado) as regiao
from cadastro
group by cidade, estado
order by count(idcadastro) desc
limit 1;

select count(idreceitas) as quantidadereceitas
from receitas;

select c.nome as categoria, count(r.idreceitas) as quantidade
from receitas r
join categoria c on r.fkcategoria = c.idcategoria
group by c.idcategoria
order by quantidade desc
limit 5;
