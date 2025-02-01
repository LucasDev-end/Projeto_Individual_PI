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

-- criando tabela de dificuldade (alteração feita em 24/01/25)
create table dificuldade(
idDificuldade int primary key auto_increment,
nome varchar(45)
);

create table receitas(
idReceitas int primary key auto_increment,
nomeReceitas varchar(60),
dificuldade int, -- Adicionando campo dificuldade (alteração feita em 21/12/2024) --editando dificuldade para int (alteração feita em 24/01/25)
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
descricao varchar(1100), -- allterando tamanho do varchar (alteração feita em 01/01/25)
constraint fkCategoriaReceitas foreign key (fkCategoria)
							references categoria(idCategoria),
-- adicionando fk para Dificuldade (alteração feita em 24/01/25)
constraint fkDificuldadeReceitas foreign key (fkCategoria)
							references categoria(idCategoria)
);

-- alterando nome da tabela e os atributos para classificacao (alterado 25/01/25)
-- crianto tabela de curtidas (alterado 29/12/24)
create table classificacao (
idClassificacao int primary key auto_increment,
classificacao int,
fkReceita int,
fkCadastro int,
constraint fkReceitaClassificacao foreign key (fkReceita)
							references receitas(idReceitas),
-- alterando fkCategoria para fkCadastro
constraint fkCadastroClassificacao foreign key (fkCadastro)
							references cadastro(idcadastro)
);

-- criando tabela comentario (alterado 29/01/25)
create table comentario(
idComentario int primary key auto_increment,
fkCadastro int,
fkReceita int,
comentario varchar(250),
constraint fkReceitaComentario foreign key (fkReceita)
							references receitas(idReceitas),
-- alterando fkCategoria para fkCadastro
constraint fkCadastroComentario foreign key (fkCadastro)
							references cadastro(idcadastro)
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

insert into dificuldade values
(default, "Fácil"),
(default, "Média"),
(default, "Difícil");

-- adicionando dados para tabela de cadastro (alterado em 31/01/25)
insert into cadastro (nome, email, cidade, estado, senha, fkCategoria) values
('Jairo', 'jairo@email.com', 'Campinas', 'SP', 'Password1!', 4),
('antonio', 'antonio@email.com', 'São Bernardo do Campo', 'SP', 'BlueSky2@', 7),
('guilherme', 'guilherme@email.com', 'Santo André', 'SP', 'GreenLeaf3#', 1),
('alana', 'alana@email.com', 'Guarulhos', 'SP', 'RedRose4$', 10),
('vilma', 'vilma@email.com', 'Osasco', 'SP', 'YellowSun5%', 3),
('Eduardo', 'eduardo@email.com', 'São José dos Campos', 'SP', 'PurpleMoon6^', 6),
('jose', 'jose@email.com', 'Ribeirão Preto', 'SP', 'OrangeStar7&', 8),
('Lucas', 'email@email.com', 'Diadema', 'SP', 'Senha123!', 5),
('Taiga', 'taiga@email.com', 'Sorocaba', 'SP', 'WhiteSnow9$', 2),
('arthur', 'arthur@email.com', 'Mogi das Cruzes', 'SP', 'BlackNight0*', 9),
('Fernanda', 'fernanda@email.com', 'Jundiaí', 'SP', 'SilverTree1!', 6),
('david', 'david@email.com', 'São Paulo', 'SP', 'GoldenFish2@', 4),
('aline', 'aline@email.com', 'São Paulo', 'SP', 'BrightLight3#', 1),
('carlos', 'carlos@email.com', 'Rio de Janeiro', 'RJ', 'ShinyGem4$', 7),
('Marcos', 'Marcos@email.com', 'Belo Horizonte', 'MG', 'DarkForest5%', 10),
('Emely', 'Emely@email.com', 'Salvador', 'BA', 'HappyDay6^', 3),
('Mariana', 'Mariana@email.com', 'Curitiba', 'PR', 'LovelyBird7&', 5),
('Maria', 'Maria@email.com', 'Fortaleza', 'CE', 'BraveHeart8*', 8),
('Patrícia', 'patricia.@email.com', 'Recife', 'PE', 'CoolBreeze9&', 2),
('Rafael', 'rafael.@email.com', 'Porto Alegre', 'RS', 'LuckyCharm0%', 9),
('Tatiane', 'tatiane.@email.com', 'Manaus', 'AM', 'MagicDream1!', 10),
('Rodrigo', 'rodrigo.@email.com', 'Brasília', 'DF', 'SweetHome2@', 3),
('Juliana', 'juliana.@email.com', 'Goiânia', 'GO', 'TrueFriend3#', 7),
('Leandro', 'leandro.@email.com', 'Florianópolis', 'SC', 'FastRunner4$', 1);

-- adicionando dado de dificuldade em cada receita (alteração feita em 21/12/2024)
insert into receitas (nomeReceitas, dificuldade, tempoPreparo, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, fkCategoria, descricao) values
('Bolo de Chocolate', 1, '60 minutos', '2 xícaras de farinha de trigo', '2 xícaras de açúcar', '1 xícara de chocolate em pó', '4 ovos', '1 xícara de leite', 1, 
'Preaqueça o forno a 180°C e unte uma forma com manteiga e farinha. Em uma tigela, misture 2 xícaras de farinha de trigo, 2 xícaras de açúcar e 1 xícara de chocolate em pó. Adicione 4 ovos e 1 xícara de leite e misture até a massa ficar homogênea. Despeje a massa na forma e asse por aproximadamente 40 minutos, ou até que o bolo esteja firme ao toque e um palito saia limpo. Deixe esfriar antes de desenformar e servir.'),

('Pizza de Calabresa', 2, '45 minutos', '1 massa de pizza', '1/2 xícara de molho de tomate', '200 g de calabresa fatiada', '1 xícara de queijo muçarela', '1 cebola fatiada', 2, 
'Preaqueça o forno a 200°C. Abra a massa de pizza em uma superfície lisa e coloque em uma assadeira. Espalhe 1/2 xícara de molho de tomate sobre a massa e adicione 200 g de calabresa fatiada, 1 xícara de queijo muçarela e 1 cebola fatiada. Leve ao forno por cerca de 20 minutos, ou até que o queijo esteja derretido e a borda da massa esteja dourada. Sirva imediatamente.'),

('Brigadeiro', 1, '15 minutos', '1 lata de leite condensado', '3 colheres de sopa de chocolate em pó', '2 colheres de sopa de manteiga', 'Chocolate granulado', '1 colher de sopa de leite', 3, 
'Em uma panela, misture 1 lata de leite condensado, 3 colheres de sopa de chocolate em pó, 2 colheres de sopa de manteiga e 1 colher de sopa de leite. Cozinhe em fogo baixo, mexendo constantemente até que a mistura solte do fundo da panela e atinja o ponto de enrolar. Retire do fogo, espere esfriar um pouco e enrole em pequenas bolinhas. Passe as bolinhas no chocolate granulado e sirva.'),

('Salada de Frutas', 1, '10 minutos', '2 bananas', '1 maçã', '1 laranja', '1 xícara de uva', '5 morangos', 7, 
'Corte 2 bananas, 1 maçã e 1 laranja em cubos pequenos e coloque em uma tigela. Adicione 1 xícara de uva cortada ao meio e 5 morangos picados. Misture bem as frutas e sirva gelada. Você pode adicionar um pouco de suco de laranja para dar mais sabor.'),

('Coxinha', 3, '60 minutos', '500 g de frango cozido', '1 pacote de massa de coxinha', '100 g de queijo muçarela', 'Óleo para fritar', 'Tempero a gosto', 2, 
'Primeiro, cozinhe 500 g de frango até que fique bem macio e depois desfie-o. Misture o frango desfiado com temperos a gosto. Modele a massa de coxinha em pequenas bolinhas, recheie com o frango e 100 g de queijo muçarela. Feche as coxinhas, passe-as em uma camada de farinha de rosca e frite-as em óleo quente até que fiquem douradas. Sirva quente.'),

('Sopa de Abóbora', 1, '30 minutos', '300 g de abóbora', '1 cebola', '2 dentes de alho', '1 cenoura', '1 cubo de caldo de galinha', 6, 
'Refogue 1 cebola e 2 dentes de alho picados em um pouco de óleo até ficarem dourados. Adicione 300 g de abóbora e 1 cenoura cortadas em pedaços pequenos. Acrescente 1 cubo de caldo de galinha e água suficiente para cobrir os legumes. Cozinhe por cerca de 20 minutos ou até que os legumes fiquem bem macios. Bata a sopa no liquidificador até obter um creme homogêneo. Sirva quente.'),

('Hambúrguer Caseiro', 1, '30 minutos', '500 g de carne moída', '2 fatias de queijo muçarela', '4 pães de hambúrguer', 'Alface', '1 tomate', 5, 
'Tempere 500 g de carne moída com sal, pimenta e outros temperos de sua preferência. Modele a carne em 4 hambúrgueres e grelhe em uma frigideira ou churrasqueira até o ponto desejado. Abra os pães de hambúrguer e coloque os hambúrgueres. Adicione 2 fatias de queijo muçarela, folhas de alface e fatias de tomate. Sirva imediatamente.'),

('Feijoada', 3, '180 minutos', '500 g de feijão preto', '300 g de carne de porco', '200 g de linguiça', '4 dentes de alho', '1 cebola', 8, 
'Cozinhe 500 g de feijão preto com 300 g de carne de porco, 200 g de linguiça, 4 dentes de alho e 1 cebola picados. Cozinhe por 2-3 horas até que os ingredientes fiquem bem macios. Ajuste o sal e sirva com arroz branco e fatias de laranja. Sirva quente.'),

('Frango ao Curry', 2, '45 minutos', '500 g de frango', '2 colheres de sopa de curry', '1 cebola', '2 dentes de alho', '1 xícara de creme de leite', 9, 
'Tempere 500 g de frango com sal, pimenta e 2 colheres de sopa de curry. Refogue 1 cebola e 2 dentes de alho picados até dourar, adicione o frango e cozinhe até que esteja bem dourado. Acrescente 1 xícara de creme de leite, misture bem e cozinhe por mais alguns minutos. Sirva com arroz e salada.'),

('Salada Caesar', 1, '15 minutos', '1 cabeça de alface', '1 xícara de croutons', '100 g de queijo parmesão', '1/2 xícara de molho Caesar', '150 g de frango grelhado', 7, 
'Em uma tigela grande, misture 1 cabeça de alface cortada, 1 xícara de croutons, 100 g de queijo parmesão ralado e 150 g de frango grelhado cortado em tiras. Regue com 1/2 xícara de molho Caesar e misture bem. Sirva imediatamente.'),

('Arroz de Carne', 1, '45 minutos', '2 xícaras de arroz', '300 g de carne', '1 cebola', '2 dentes de alho', '2 tomates', 8, 
'Refogue 300 g de carne cortada em cubos com 1 cebola e 2 dentes de alho picados. Adicione 2 xícaras de arroz e 2 tomates picados, misture bem e adicione água suficiente para cozinhar o arroz. Cozinhe até o arroz ficar macio. Sirva com salada ou legumes.'),

('Torta de Maçã', 2, '90 minutos', '4 maçãs', '1 xícara de açúcar', '2 xícaras de farinha de trigo', '100 g de manteiga', '2 ovos', 3, 
'Prepare a massa misturando 2 xícaras de farinha de trigo, 1 xícara de açúcar e 100 g de manteiga até formar uma massa homogênea. Em uma tigela separada, adicione 4 maçãs cortadas em fatias finas e 2 ovos batidos. Coloque a massa em uma forma, adicione as maçãs por cima e leve ao forno preaquecido a 180°C por cerca de 40 minutos, ou até que a torta esteja dourada. Deixe esfriar antes de servir.'),

('Lasanha de Carne', 3, '90 minutos', '500 g de massa de lasanha', '500 g de carne moída', '2 xícaras de queijo muçarela', '1 xícara de molho de tomate', '2 dentes de alho', 2, 
'Preaqueça o forno a 180°C. Em uma panela, refogue 500 g de carne moída com 2 dentes de alho picados até dourar. Adicione 1 xícara de molho de tomate e cozinhe por 10 minutos. Em uma forma, monte camadas alternadas de massa de lasanha, carne moída e queijo muçarela. Repita até que todos os ingredientes sejam usados. Cubra com queijo muçarela e leve ao forno por 40 minutos. Sirva quente.'),

('Bolo de Coco', 1, '50 minutos', '2 xícaras de farinha de trigo', '2 xícaras de açúcar', '1 xícara de coco ralado', '4 ovos', '1 xícara de leite', 3, 
'Preaqueça o forno a 180°C e unte uma forma. Em uma tigela, misture 2 xícaras de farinha de trigo, 2 xícaras de açúcar e 1 xícara de coco ralado. Adicione 4 ovos e 1 xícara de leite, misturando até obter uma massa homogênea. Despeje a massa na forma e asse por cerca de 40 minutos ou até que o bolo esteja dourado. Deixe esfriar antes de desenformar e sirva.'),

('Sopa de Lentilha', 1, '40 minutos', '2 xícaras de lentilha', '2 cenouras', '1 cebola', '2 dentes de alho', '1 cubo de caldo de legumes', 6, 
'Em uma panela, refogue 1 cebola e 2 dentes de alho picados até dourar. Adicione 2 xícaras de lentilha, 2 cenouras cortadas em rodelas e 1 cubo de caldo de legumes. Cubra com água e cozinhe por 30 minutos, ou até que a lentilha esteja macia. Bata a sopa no liquidificador e sirva quente.'),

('Quiche de Alho Poró', 2, '60 minutos', '1 alho poró', '1 xícara de queijo ralado', '1 massa de torta', '3 ovos', '1 xícara de creme de leite', 5, 
'Preaqueça o forno a 180°C. Refogue 1 alho poró cortado em rodelas até murchar. Em uma tigela, misture 3 ovos, 1 xícara de creme de leite e 1 xícara de queijo ralado. Forre uma forma com 1 massa de torta e adicione o alho poró refogado. Despeje a mistura de ovos e creme de leite por cima. Leve ao forno por cerca de 40 minutos, ou até que a quiche esteja dourada. Sirva quente ou fria.'),

('Salada Grega', 1, '15 minutos', '1 pepino', '2 tomates', '100 g de queijo feta', '1/2 xícara de azeitonas', '1/4 de xícara de azeite', 7, 
'Corte 1 pepino e 2 tomates em cubos. Em uma tigela, adicione 100 g de queijo feta desintegrado e 1/2 xícara de azeitonas. Regue com 1/4 de xícara de azeite e misture bem. Sirva imediatamente, gelado, como acompanhamento.'),

('Churrasco de Frango', 2, '120 minutos', '1 kg de frango', '2 dentes de alho', '1 limão', 'Sal', 'Óleo', 9, 
'Tempere 1 kg de frango com 2 dentes de alho picados, suco de 1 limão, sal e um pouco de óleo. Deixe marinar por 1 hora. Aqueça a churrasqueira e asse o frango por aproximadamente 40 minutos, virando para dourar de todos os lados. Sirva com farofa e salada.'),

('Sanduíche de Atum', 1, '10 minutos', '4 fatias de pão', '1 lata de atum', '1 colher de sopa de maionese', 'Alface', 'Tomate', 5, 
'Abra 4 fatias de pão e passe 1 colher de sopa de maionese em cada uma. Em uma tigela, misture 1 lata de atum escorrido com um pouco de maionese. Coloque o atum sobre o pão e adicione folhas de alface e fatias de tomate. Monte o sanduíche e sirva imediatamente.'),

('Pão de Alho', 1, '30 minutos', '2 xícaras de farinha de trigo', '3 dentes de alho', '100 g de manteiga', 'Salsinha', '1 xícara de leite', 2, 
'Misture 2 xícaras de farinha de trigo, 100 g de manteiga, 3 dentes de alho picados e 1 xícara de leite até formar uma massa homogênea. Modele pequenos pães e coloque em uma assadeira untada. Polvilhe salsinha por cima e asse a 180°C por cerca de 20 minutos ou até que fiquem dourados. Sirva quente como acompanhamento.'),

('Strogonoff de Carne', 2, '45 minutos', '500 g de carne', '1 xícara de creme de leite', '1 cebola', '2 dentes de alho', '1 xícara de molho de tomate', 8, 
'Refogue 1 cebola e 2 dentes de alho picados em um pouco de óleo. Adicione 500 g de carne cortada em tiras e cozinhe até dourar. Acrescente 1 xícara de molho de tomate e 1 xícara de creme de leite, mexa bem e cozinhe por mais alguns minutos. Sirva com arroz branco e batata palha.'),

('Omelete de Espinafre', 1, '15 minutos', '3 ovos', '1 xícara de espinafre', '1 colher de sopa de azeite', 'Sal', 'Pimenta', 10, 
'Em uma tigela, bata 3 ovos com sal e pimenta. Aqueça 1 colher de sopa de azeite em uma frigideira, adicione 1 xícara de espinafre picado e refogue por 2 minutos. Despeje os ovos batidos e cozinhe até firmar. Sirva quente.'),

('Canapés de Queijo', 1, '15 minutos', '1 baguete', '200 g de queijo cremoso', 'Tomate cereja', 'Manjericão', 'Azeite', 4, 
'Corte a baguete em fatias e espalhe 200 g de queijo cremoso sobre cada uma. Decore com tomate cereja cortado ao meio e folhas de manjericão. Regue com azeite e sirva.');

insert into receitas (nomeReceitas, dificuldade, tempoPreparo, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, fkCategoria, descricao) values
('Frango Cremoso com Cogumelos', 2, '45 minutos', 
 'peito de frango 500g', 'creme de leite 200ml', 'cogumelos 150g', 'alho 2 dentes', 'cebola 1 unidade', 2, 
 'Tempere os peitos de frango com sal e pimenta a gosto. Em uma frigideira grande, aqueça um fio de azeite e sele os peitos de frango até dourarem, retirando-os em seguida. Na mesma frigideira, refogue a cebola picada e o alho até ficarem macios. Adicione os cogumelos fatiados e cozinhe até que estejam dourados. Retorne os peitos de frango à frigideira, adicione o creme de leite e misture bem. Cozinhe em fogo baixo por cerca de 20 minutos, ou até que o frango esteja completamente cozido e o molho tenha engrossado. Sirva acompanhado de arroz branco ou purê de batatas.'),
 
('Mousse de Maracujá', 2, '30 minutos', 
 'maracujá 200ml', 'leite condensado 395g', 'creme de leite 200ml', 'gelatina incolor 1 pacote', 'água 100ml', 3, 
 'Comece hidratando a gelatina incolor em água conforme as instruções da embalagem. Enquanto isso, no liquidificador, bata o suco de maracujá concentrado com o leite condensado e o creme de leite até obter um creme homogêneo. Derreta a gelatina hidratada em banho-maria ou no micro-ondas e adicione à mistura do liquidificador, batendo rapidamente para incorporar. Despeje o mousse em taças ou uma travessa e leve à geladeira por pelo menos 4 horas, ou até que esteja firme. Decore com sementes de maracujá antes de servir.'),
 
('Mil-folhas de Creme e Morango', 3, '2 horas', 
 'massa folhada 500g', 'creme de confeiteiro 300g', 'morango 250g', 'açúcar de confeiteiro 50g', 'leite 500ml', 3, 
 'Preaqueça o forno a 180°C. Abra a massa folhada sobre uma superfície enfarinhada e corte-a em retângulos iguais. Coloque-os em uma assadeira forrada com papel manteiga, cubra com outra folha de papel manteiga e pressione com uma assadeira pesada para evitar que cresçam. Asse por 15-20 minutos ou até dourarem. Para o creme, aqueça o leite em uma panela e misture gemas, açúcar e amido de milho em uma tigela até formar uma pasta. Adicione o leite quente aos poucos, mexendo sempre, e leve de volta ao fogo até engrossar. Deixe esfriar. Monte o mil-folhas intercalando camadas de massa folhada, creme de confeiteiro e morangos fatiados. Finalize com uma camada de massa folhada, polvilhe açúcar de confeiteiro e leve à geladeira por 1 hora antes de servir.'),
 
('Soufflé de Chocolate', 3, '1 hora', 
 'chocolate meio amargo 200g', 'manteiga 100g', 'açúcar 100g', 'ovos 4 unidades', 'creme de leite 100ml', 3, 
 'Preaqueça o forno a 190°C e unte ramequins com manteiga, polvilhando açúcar nas laterais. Derreta o chocolate meio amargo com a manteiga em banho-maria, mexendo até ficar homogêneo. Separe as gemas das claras e bata as claras em neve com uma pitada de sal até formarem picos firmes. Na mistura de chocolate derretido, adicione as gemas uma a uma, mexendo bem, e depois incorpore delicadamente o creme de leite. Por último, incorpore as claras em neve aos poucos, utilizando uma espátula para não perder a aeração. Distribua a massa nos ramequins, enchendo até 3/4 da altura. Asse por 15-20 minutos, sem abrir o forno durante o processo, até que os soufflés cresçam e fiquem dourados. Sirva imediatamente para aproveitar sua textura leve e cremosa.'),
 
('Tartare de Salmão com Avocado', 3, '50 minutos', 
 'salmão fresco 300g', 'avocado 1 unidade', 'limão siciliano 1 unidade', 'cebola roxa 1 unidade', 'molho de soja 50ml', 2, 
 'Corte o salmão fresco em cubos pequenos, garantindo que esteja completamente limpo e livre de espinhas. Em uma tigela, misture o suco de limão siciliano, o molho de soja e um fio de azeite, criando uma marinada. Adicione o salmão à marinada e deixe descansar na geladeira por 20 minutos. Enquanto isso, pique o avocado em cubos pequenos e regue com limão para evitar a oxidação. Pique finamente a cebola roxa e misture com o avocado. Para montar, utilize um aro de metal: comece com uma camada de avocado e finalize com o tartare de salmão por cima. Decore com raspas de limão siciliano e sirva acompanhado de torradas ou chips de batata doce.'),

('Caprese no Palito', 2, '20 minutos', 
 'tomate cereja 250g', 'muçarela de búfala 200g', 'manjericão fresco 1 maço', 'azeite 50ml', 'vinagre balsâmico 20ml', 2, 
 'Lave e seque os tomates cereja e as folhas de manjericão fresco. Corte as bolinhas de muçarela de búfala ao meio, se forem muito grandes. Em palitos de petisco, espete um tomate cereja, uma folha de manjericão e um pedaço de muçarela, repetindo a sequência até preencher o palito. Disponha os palitos em um prato e regue com azeite e algumas gotas de vinagre balsâmico. Finalize com uma pitada de sal e sirva como entrada leve e sofisticada.'),

('Croissant Recheado com Queijo Brie e Presunto de Parma', 3, '3 horas', 
 'farinha de trigo 500g', 'manteiga 300g', 'fermento biológico 10g', 'queijo brie 150g', 'presunto de parma 150g', 5, 
 'Prepare a massa do croissant começando por misturar a farinha de trigo, o fermento biológico, uma pitada de sal e água fria em uma tigela grande. Sove até obter uma massa homogênea e elástica. Cubra a massa com um pano úmido e deixe descansar por 1 hora ou até dobrar de tamanho. Enquanto isso, prepare a manteiga laminada, moldando-a em um retângulo fino entre folhas de papel manteiga. Abra a massa em formato retangular, coloque a manteiga no centro e dobre a massa em três partes, cobrindo completamente a manteiga. Leve à geladeira por 30 minutos. Repita o processo de abrir e dobrar a massa por mais 3 vezes, sempre refrigerando entre as dobras. Abra a massa pela última vez em um retângulo grande e corte em triângulos. Recheie cada triângulo com uma fatia de queijo brie e uma de presunto de parma, enrolando a partir da base até a ponta para formar o croissant. Disponha os croissants em uma assadeira, pincele com gema de ovo e deixe descansar por mais 30 minutos. Asse em forno preaquecido a 200°C por 20-25 minutos ou até dourar. Sirva quente e desfrute de uma experiência gourmet.'),

('Sopa de Abóbora com Gengibre', 2, '45 minutos', 
 'abóbora 1kg', 'cebola 1 unidade', 'gengibre 20g', 'caldo de legumes 1L', 'creme de leite 200ml', 6, 
 'Comece descascando e cortando a abóbora em cubos médios. Em uma panela grande, aqueça um fio de azeite e refogue a cebola picada até que fique transparente. Adicione o gengibre ralado e refogue por mais 1 minuto para liberar o aroma. Acrescente os cubos de abóbora e o caldo de legumes quente, cobrindo os ingredientes. Deixe cozinhar em fogo médio por cerca de 20 minutos, ou até que a abóbora esteja macia. Use um liquidificador ou mixer para bater a sopa até obter uma textura cremosa. Retorne à panela, adicione o creme de leite e misture bem. Tempere com sal e pimenta a gosto. Sirva quente, decorada com um fio de azeite e folhas de coentro ou salsinha fresca.'),

('Bisque de Lagosta', 3, '2 horas', 
 'lagosta 1kg', 'cenoura 2 unidades', 'cebola 1 unidade', 'conhaque 50ml', 'creme de leite 200ml', 6, 
 'Comece cozinhando a lagosta em água fervente com sal por 5-7 minutos, até que esteja parcialmente cozida. Retire a carne da casca, reservando as cascas para o caldo. Em uma panela grande, refogue as cascas da lagosta com um pouco de azeite, cenoura e cebola picadas. Flambe com conhaque para realçar o sabor, tomando cuidado ao acender a chama. Adicione água suficiente para cobrir as cascas e deixe cozinhar por cerca de 40 minutos para obter um caldo concentrado. Coe o caldo, descartando os sólidos, e retorne o líquido à panela. Acrescente creme de leite e reduza o fogo, mexendo até que o bisque esteja levemente espesso. Adicione pedaços da carne da lagosta, temperando com sal, pimenta e uma pitada de páprica. Sirva em pratos fundos, decorado com ervas frescas e um fio de azeite de oliva.');

insert into receitas (nomeReceitas, dificuldade, tempoPreparo, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, fkCategoria, descricao) values
('teste de receita', 1, '1 minuto',
 'cenoura 2 unidades', 'cebola 1 unidade', 'conhaque 50ml', 'creme de leite 200ml', 'Alegria', 3,'teste');
 
 insert into receitas (nomeReceitas, dificuldade, tempoPreparo, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, fkCategoria, descricao) values
('teste de receita', 2, '8 Horas',
 'caqui 1 unidade', 'perulito', 'conhaque 50ml', 'creme de jaca 200ml', 'Alegria 5ml', 1,'teste');

-- inserindo algumas informacoes para teste (alterado 30/01/25)
insert into comentario (fkCadastro, fkReceita, comentario) values
(1, 14,"excelente receita"),(3, 14,"excelente receita"),(3, 14,"excelente receita"),
(3, 14,"faria mais vezes"),(3, 14,"faria mais vezes"),(3, 14,"faria mais vezes"),
(8, 14,"melhor bolo que ja comi"),(3, 14,"melhor bolo que ja comi"),(8, 14,"melhor bolo que ja comi"),
(1, 14,"todos adoraram"),(3, 14,"todos adoraram"),(8, 14,"todos adoraram"),
(8, 3,"exelente receita"),(3, 3,"exelente receita"),(3, 3,"exelente receita"),
(1, 3,"faria mais vezes"),(3, 3,"faria mais vezes"),(8, 3,"faria mais vezes"),
(3, 3,"melhor bolo que ja comi"),(3, 3,"melhor bolo que ja comi"),(8, 3,"melhor bolo que ja comi"),
(1, 3,"todos adoraram"),(3, 3,"todos adoraram"),(8, 3,"todos adoraram"),
(1, 33,"Que delicia"),(3, 33,"Que delicia"),(3, 33,"Que delicia"),
(3, 33,"Adorei, ficou bom"),(3, 33,"Adorei, ficou bom"),(8, 33,"Adorei, ficou bom"),
(3, 33,"Muito Bom"),(3, 33,"Muito Bom"),(3, 33,"Muito Bom"),
(1, 33,"Incrivel"),(3, 33,"Incrivel"),(8, 33,"Incrivel"),
(8, 33,"Maravilhoso"),(3, 33,"Maravilhoso"),(3, 33,"Maravilhoso");

-- inserindo algumas informacoes para tabela de classificacao (alterado 31/01/25)
insert into classificacao(classificacao, fkReceita, fkCadastro) values
(3, 12, 1), (1, 23, 5), (5, 17, 4), (3, 6, 8),
(3, 12, 1), (1, 23, 5), (5, 17, 4), (3, 6, 8),
(2, 30, 2), (5, 14, 6), (3, 12, 3), (2, 5, 7),
(2, 25, 4), (5, 17, 8), (1, 31, 5), (2, 20, 9),
(5, 12, 6), (1, 30, 8), (1, 15, 7), (5, 17, 1),
(4, 12, 8), (4, 14, 2), (2, 32, 9), (4, 14, 3),
(1, 6, 3), (5, 17, 4), (5, 21, 1), (4, 14, 5),
(2, 30, 2), (5, 14, 6), (3, 12, 3), (2, 5, 7),
(2, 25, 4), (5, 17, 8), (1, 31, 5), (2, 20, 9),
(5, 12, 6), (1, 30, 8), (1, 15, 7), (5, 17, 1),
(4, 12, 8), (4, 14, 2), (2, 32, 9), (4, 14, 3),
(1, 6, 3), (5, 17, 4), (5, 21, 1), (4, 14, 5),
(2, 12, 2), (2, 15, 1), (3, 30, 3), (4, 31, 7),
(1, 12, 5), (5, 21, 9), (1, 25, 8), (5, 14, 8),
(1, 12, 8), (1, 32, 1), (5, 21, 3), (3, 25, 2),
(4, 14, 9), (3, 23, 3), (1, 12, 10), (5, 21, 4),
(5, 14, 1), (5, 14, 5), (2, 6, 2), (5, 17, 6),
(3, 30, 3), (3, 15, 4), (2, 32, 4), (3, 12, 8),
(1, 6, 5), (4, 14, 8), (3, 5, 6), (4, 31, 10),
(4, 25, 7), (5, 21, 1), (3, 23, 8), (2, 12, 2),
(2, 30, 9), (3, 30, 3), (1, 23, 8), (2, 25, 4),
(5, 14, 1), (5, 14, 5), (2, 30, 2), (3, 6, 9),
(5, 21, 3), (3, 15, 7), (4, 17, 4), (4, 12, 8),
(3, 12, 8), (4, 21, 3), (4, 14, 1), (3, 30, 8),
(3, 12, 8), (2, 15, 3), (5, 21, 1), (3, 25, 7),
(3, 12, 3), (4, 17, 7), (2, 30, 2), (3, 6, 3),
(3, 23, 8), (4, 12, 3), (2, 31, 4), (3, 6, 8),
(4, 14, 2), (1, 23, 1), (3, 5, 3), (1, 30, 7),
(1, 30, 5), (2, 15, 9), (2, 31, 8), (1, 25, 8),
(4, 12, 4), (4, 14, 3), (2, 25, 1), (3, 15, 7);

select * from receitas;
select * from cadastro;
select * from categoria;
select * from Classificacao;
select * from comentario;
select * from comentario
where fkReceita = 14
limit 4;

select * from comentario as c
join cadastro as ca on c.fkCadastro = ca.idcadastro;

-- novos selects (Alterado 27/12/24)

select * from receitas as r
join categoria as c on r.fkCategoria = c.idCategoria
where r.fkCategoria = 3 and r.dificuldade = 1
order by rand(); -- ordena a consulta de forma aleatoria, para aparecer diferentes receitas (Alterado 29/12/24)

-- novos inserts (Alterado 29/12/24)
  insert into curtida (fkReceita, fkCategoria) values
  ( 1, 2);
  
  -- select para kpi de percentual (alteração feita em 31/01/25)
select avg(Classificacao) * 20 as class from Classificacao;
-- --------------------------------------------------------------------------------------------------------
-- select para usuario mais ativo (alteração feita em 31/01/25)
select cl.classificacao, cl.fkReceita, cl.fkCadastro  from Classificacao as cl
join cadastro as ca on cl.fkCadastro = ca.idcadastro;
-- ---------------------------------------------------------------------------------------------------------
select * from comentario as c
join cadastro as cad on c.fkCadastro = cad.idcadastro;
-- ----------------------------------------------------------------------------------------------------------
select cl.classificacao, cl.fkreceita, cl.fkcadastro,
    (
        select c.comentario  -- ou o campo desejado de comentario
        from comentario c
        join cadastro cad on c.fkcadastro = cad.idcadastro
        where cad.idcadastro = cl.fkcadastro  -- relaciona com o cadastro da classificacao
        limit 1
    ) as comentario
from classificacao cl
join cadastro ca on cl.fkcadastro = ca.idcadastro;
-- ----------------------------------------------------------------------------------------------------------
select c.nome, c.email, count(*) as total_atividade
from cadastro as c
left join classificacao as cl on c.idcadastro = cl.fkcadastro
left join comentario as com on c.idcadastro = com.fkcadastro
group by c.idcadastro
order by total_atividade desc
limit 1;



-- ---------------------- select para usuario mais ativo (alteração feita em 31/01/25) ---------------------------------------------
-- Usuários que mais fizeram avaliações:
-- por nome
select cad.nome, COUNT(cla.idClassificacao) as total
from classificacao as cla
join cadastro as cad on cla.fkCadastro = cad.idcadastro
group by cad.nome
order by total desc;


-- Percentual Geral de aprovação de receitas -- metrica1
select avg(Classificacao) * 20 as media from Classificacao;
select fkReceita, classificacao from classificacao;

-- usuario que mais fez comentarios -- metrica2
select cad.nome, count(com.idcomentario) as total_comentarios
from comentario as com
join cadastro as cad on com.fkcadastro = cad.idcadastro
group by cad.nome
order by total_comentarios desc;

-- Receitas que mais tiveram avaliações altas: metrica 3
select re.nomeReceitas, count(cla.classificacao) as total
from classificacao as cla
join receitas as re on cla.fkreceita = re.idReceitas
where cla.classificacao >= 4
group by re.nomeReceitas
order by total desc;
