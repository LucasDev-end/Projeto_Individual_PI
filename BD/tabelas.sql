drop database culinaria;
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
dificuldade varchar(7), -- Adicionando campo dificuldade (alteração feita em 21/12/2024)
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
descricao varchar (500),
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

-- adicionando dado de dificuldade em cada receita (alteração feita em 21/12/2024)
insert into receitas (nomeReceitas, dificuldade, tempoPreparo, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, fkCategoria, descricao) values
('Bolo de Chocolate', 'Fácil', '60 minutos', '2 xícaras de farinha de trigo', '2 xícaras de açúcar', '1 xícara de chocolate em pó', '4 ovos', '1 xícara de leite', 1, 
'Preaqueça o forno a 180°C e unte uma forma com manteiga e farinha. Em uma tigela, misture 2 xícaras de farinha de trigo, 2 xícaras de açúcar e 1 xícara de chocolate em pó. Adicione 4 ovos e 1 xícara de leite e misture até a massa ficar homogênea. Despeje a massa na forma e asse por aproximadamente 40 minutos, ou até que o bolo esteja firme ao toque e um palito saia limpo. Deixe esfriar antes de desenformar e servir.'),

('Pizza de Calabresa', 'Média', '45 minutos', '1 massa de pizza', '1/2 xícara de molho de tomate', '200 g de calabresa fatiada', '1 xícara de queijo muçarela', '1 cebola fatiada', 2, 
'Preaqueça o forno a 200°C. Abra a massa de pizza em uma superfície lisa e coloque em uma assadeira. Espalhe 1/2 xícara de molho de tomate sobre a massa e adicione 200 g de calabresa fatiada, 1 xícara de queijo muçarela e 1 cebola fatiada. Leve ao forno por cerca de 20 minutos, ou até que o queijo esteja derretido e a borda da massa esteja dourada. Sirva imediatamente.'),

('Brigadeiro', 'Fácil', '15 minutos', '1 lata de leite condensado', '3 colheres de sopa de chocolate em pó', '2 colheres de sopa de manteiga', 'Chocolate granulado', '1 colher de sopa de leite', 3, 
'Em uma panela, misture 1 lata de leite condensado, 3 colheres de sopa de chocolate em pó, 2 colheres de sopa de manteiga e 1 colher de sopa de leite. Cozinhe em fogo baixo, mexendo constantemente até que a mistura solte do fundo da panela e atinja o ponto de enrolar. Retire do fogo, espere esfriar um pouco e enrole em pequenas bolinhas. Passe as bolinhas no chocolate granulado e sirva.'),

('Salada de Frutas', 'Fácil', '10 minutos', '2 bananas', '1 maçã', '1 laranja', '1 xícara de uva', '5 morangos', 7, 
'Corte 2 bananas, 1 maçã e 1 laranja em cubos pequenos e coloque em uma tigela. Adicione 1 xícara de uva cortada ao meio e 5 morangos picados. Misture bem as frutas e sirva gelada. Você pode adicionar um pouco de suco de laranja para dar mais sabor.'),

('Coxinha', 'Difícil', '60 minutos', '500 g de frango cozido', '1 pacote de massa de coxinha', '100 g de queijo muçarela', 'Óleo para fritar', 'Tempero a gosto', 2, 
'Primeiro, cozinhe 500 g de frango até que fique bem macio e depois desfie-o. Misture o frango desfiado com temperos a gosto. Modele a massa de coxinha em pequenas bolinhas, recheie com o frango e 100 g de queijo muçarela. Feche as coxinhas, passe-as em uma camada de farinha de rosca e frite-as em óleo quente até que fiquem douradas. Sirva quente.'),

('Sopa de Abóbora', 'Fácil', '30 minutos', '300 g de abóbora', '1 cebola', '2 dentes de alho', '1 cenoura', '1 cubo de caldo de galinha', 6, 
'Refogue 1 cebola e 2 dentes de alho picados em um pouco de óleo até ficarem dourados. Adicione 300 g de abóbora e 1 cenoura cortadas em pedaços pequenos. Acrescente 1 cubo de caldo de galinha e água suficiente para cobrir os legumes. Cozinhe por cerca de 20 minutos ou até que os legumes fiquem bem macios. Bata a sopa no liquidificador até obter um creme homogêneo. Sirva quente.'),

('Hambúrguer Caseiro', 'Fácil', '30 minutos', '500 g de carne moída', '2 fatias de queijo muçarela', '4 pães de hambúrguer', 'Alface', '1 tomate', 5, 
'Tempere 500 g de carne moída com sal, pimenta e outros temperos de sua preferência. Modele a carne em 4 hambúrgueres e grelhe em uma frigideira ou churrasqueira até o ponto desejado. Abra os pães de hambúrguer e coloque os hambúrgueres. Adicione 2 fatias de queijo muçarela, folhas de alface e fatias de tomate. Sirva imediatamente.'),

('Feijoada', 'Difícil', '180 minutos', '500 g de feijão preto', '300 g de carne de porco', '200 g de linguiça', '4 dentes de alho', '1 cebola', 8, 
'Cozinhe 500 g de feijão preto com 300 g de carne de porco, 200 g de linguiça, 4 dentes de alho e 1 cebola picados. Cozinhe por 2-3 horas até que os ingredientes fiquem bem macios. Ajuste o sal e sirva com arroz branco e fatias de laranja. Sirva quente.'),

('Frango ao Curry', 'Média', '45 minutos', '500 g de frango', '2 colheres de sopa de curry', '1 cebola', '2 dentes de alho', '1 xícara de creme de leite', 9, 
'Tempere 500 g de frango com sal, pimenta e 2 colheres de sopa de curry. Refogue 1 cebola e 2 dentes de alho picados até dourar, adicione o frango e cozinhe até que esteja bem dourado. Acrescente 1 xícara de creme de leite, misture bem e cozinhe por mais alguns minutos. Sirva com arroz e salada.'),

('Salada Caesar', 'Fácil', '15 minutos', '1 cabeça de alface', '1 xícara de croutons', '100 g de queijo parmesão', '1/2 xícara de molho Caesar', '150 g de frango grelhado', 7, 
'Em uma tigela grande, misture 1 cabeça de alface cortada, 1 xícara de croutons, 100 g de queijo parmesão ralado e 150 g de frango grelhado cortado em tiras. Regue com 1/2 xícara de molho Caesar e misture bem. Sirva imediatamente.'),

('Arroz de Carne', 'Fácil', '45 minutos', '2 xícaras de arroz', '300 g de carne', '1 cebola', '2 dentes de alho', '2 tomates', 8, 
'Refogue 300 g de carne cortada em cubos com 1 cebola e 2 dentes de alho picados. Adicione 2 xícaras de arroz e 2 tomates picados, misture bem e adicione água suficiente para cozinhar o arroz. Cozinhe até o arroz ficar macio. Sirva com salada ou legumes.'),

('Torta de Maçã', 'Média', '90 minutos', '4 maçãs', '1 xícara de açúcar', '2 xícaras de farinha de trigo', '100 g de manteiga', '2 ovos', 3, 
'Prepare a massa misturando 2 xícaras de farinha de trigo, 1 xícara de açúcar e 100 g de manteiga até formar uma massa homogênea. Em uma tigela separada, adicione 4 maçãs cortadas em fatias finas e 2 ovos batidos. Coloque a massa em uma forma, adicione as maçãs por cima e leve ao forno preaquecido a 180°C por cerca de 40 minutos, ou até que a torta esteja dourada. Deixe esfriar antes de servir.'),

('Lasanha de Carne', 'Difícil', '90 minutos', '500 g de massa de lasanha', '500 g de carne moída', '2 xícaras de queijo muçarela', '1 xícara de molho de tomate', '2 dentes de alho', 2, 
'Preaqueça o forno a 180°C. Em uma panela, refogue 500 g de carne moída com 2 dentes de alho picados até dourar. Adicione 1 xícara de molho de tomate e cozinhe por 10 minutos. Em uma forma, monte camadas alternadas de massa de lasanha, carne moída e queijo muçarela. Repita até que todos os ingredientes sejam usados. Cubra com queijo muçarela e leve ao forno por 40 minutos. Sirva quente.'),

('Bolo de Coco', 'Fácil', '50 minutos', '2 xícaras de farinha de trigo', '2 xícaras de açúcar', '1 xícara de coco ralado', '4 ovos', '1 xícara de leite', 3, 
'Preaqueça o forno a 180°C e unte uma forma. Em uma tigela, misture 2 xícaras de farinha de trigo, 2 xícaras de açúcar e 1 xícara de coco ralado. Adicione 4 ovos e 1 xícara de leite, misturando até obter uma massa homogênea. Despeje a massa na forma e asse por cerca de 40 minutos ou até que o bolo esteja dourado. Deixe esfriar antes de desenformar e sirva.'),

('Sopa de Lentilha', 'Fácil', '40 minutos', '2 xícaras de lentilha', '2 cenouras', '1 cebola', '2 dentes de alho', '1 cubo de caldo de legumes', 6, 
'Em uma panela, refogue 1 cebola e 2 dentes de alho picados até dourar. Adicione 2 xícaras de lentilha, 2 cenouras cortadas em rodelas e 1 cubo de caldo de legumes. Cubra com água e cozinhe por 30 minutos, ou até que a lentilha esteja macia. Bata a sopa no liquidificador e sirva quente.'),

('Quiche de Alho Poró', 'Média', '60 minutos', '1 alho poró', '1 xícara de queijo ralado', '1 massa de torta', '3 ovos', '1 xícara de creme de leite', 5, 
'Preaqueça o forno a 180°C. Refogue 1 alho poró cortado em rodelas até murchar. Em uma tigela, misture 3 ovos, 1 xícara de creme de leite e 1 xícara de queijo ralado. Forre uma forma com 1 massa de torta e adicione o alho poró refogado. Despeje a mistura de ovos e creme de leite por cima. Leve ao forno por cerca de 40 minutos, ou até que a quiche esteja dourada. Sirva quente ou fria.'),

('Salada Grega', 'Fácil', '15 minutos', '1 pepino', '2 tomates', '100 g de queijo feta', '1/2 xícara de azeitonas', '1/4 de xícara de azeite', 7, 
'Corte 1 pepino e 2 tomates em cubos. Em uma tigela, adicione 100 g de queijo feta desintegrado e 1/2 xícara de azeitonas. Regue com 1/4 de xícara de azeite e misture bem. Sirva imediatamente, gelado, como acompanhamento.'),

('Churrasco de Frango', 'Média', '120 minutos', '1 kg de frango', '2 dentes de alho', '1 limão', 'Sal', 'Óleo', 9, 
'Tempere 1 kg de frango com 2 dentes de alho picados, suco de 1 limão, sal e um pouco de óleo. Deixe marinar por 1 hora. Aqueça a churrasqueira e asse o frango por aproximadamente 40 minutos, virando para dourar de todos os lados. Sirva com farofa e salada.'),

('Sanduíche de Atum', 'Fácil', '10 minutos', '4 fatias de pão', '1 lata de atum', '1 colher de sopa de maionese', 'Alface', 'Tomate', 5, 
'Abra 4 fatias de pão e passe 1 colher de sopa de maionese em cada uma. Em uma tigela, misture 1 lata de atum escorrido com um pouco de maionese. Coloque o atum sobre o pão e adicione folhas de alface e fatias de tomate. Monte o sanduíche e sirva imediatamente.'),

('Pão de Alho', 'Fácil', '30 minutos', '2 xícaras de farinha de trigo', '3 dentes de alho', '100 g de manteiga', 'Salsinha', '1 xícara de leite', 2, 
'Misture 2 xícaras de farinha de trigo, 100 g de manteiga, 3 dentes de alho picados e 1 xícara de leite até formar uma massa homogênea. Modele pequenos pães e coloque em uma assadeira untada. Polvilhe salsinha por cima e asse a 180°C por cerca de 20 minutos ou até que fiquem dourados. Sirva quente como acompanhamento.'),

('Strogonoff de Carne', 'Média', '45 minutos', '500 g de carne', '1 xícara de creme de leite', '1 cebola', '2 dentes de alho', '1 xícara de molho de tomate', 8, 
'Refogue 1 cebola e 2 dentes de alho picados em um pouco de óleo. Adicione 500 g de carne cortada em tiras e cozinhe até dourar. Acrescente 1 xícara de molho de tomate e 1 xícara de creme de leite, mexa bem e cozinhe por mais alguns minutos. Sirva com arroz branco e batata palha.'),

('Omelete de Espinafre', 'Fácil', '15 minutos', '3 ovos', '1 xícara de espinafre', '1 colher de sopa de azeite', 'Sal', 'Pimenta', 10, 
'Em uma tigela, bata 3 ovos com sal e pimenta. Aqueça 1 colher de sopa de azeite em uma frigideira, adicione 1 xícara de espinafre picado e refogue por 2 minutos. Despeje os ovos batidos e cozinhe até firmar. Sirva quente.'),

('Canapés de Queijo', 'Fácil', '15 minutos', '1 baguete', '200 g de queijo cremoso', 'Tomate cereja', 'Manjericão', 'Azeite', 4, 
'Corte a baguete em fatias e espalhe 200 g de queijo cremoso sobre cada uma. Decore com tomate cereja cortado ao meio e folhas de manjericão. Regue com azeite e sirva.');



select * from receitas;
SELECT 
    fkCategoria, 
    GROUP_CONCAT(DISTINCT dificuldade ORDER BY dificuldade ASC) AS dificuldades 
FROM 
    receitas 
GROUP BY 
    fkCategoria;
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
from cadastro as ca
join categoria as c on ca.fkcategoria = c.idcategoria
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
from receitas as r
join categoria as c on r.fkcategoria = c.idcategoria
group by c.idcategoria
order by quantidade desc
limit 5;










-- novos selects (Alterado 27/12/24)

select * from receitas as r
join categoria as c on r.fkCategoria = c.idCategoria
where r.categoria = 2 and r.dificuldade = 'Fácil';




