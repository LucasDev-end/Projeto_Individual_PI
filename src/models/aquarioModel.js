var database = require("../database/config");

// Adicionando variavel dificuldade (alterado 23/01/2025)
function cadastrar(nomeReceita, dificuldade, tempoReceita, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, ingrediente6, ingrediente7, ingrediente8, ingrediente9, ingrediente10, fkCategoria, descricao) {

  var instrucaoSql = `
  INSERT INTO receitas (nomeReceitas, dificuldade, tempoPreparo, ingrediente1, ingrediente2, ingrediente3,
     ingrediente4, ingrediente5, ingrediente6, ingrediente7, ingrediente8, ingrediente9, ingrediente10,
      fkCategoria, descricao)  
      VALUES ('${nomeReceita}', '${dificuldade}', '${tempoReceita}', '${ingrediente1}', '${ingrediente2}',
       '${ingrediente3}', '${ingrediente4}', '${ingrediente5}', '${ingrediente6}', '${ingrediente7}',
        '${ingrediente8}', '${ingrediente9}', '${ingrediente10}', ${fkCategoria}, '${descricao}');`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

// alterando o insert para mostar de a cordo com a categoria e dificuldade da receita (alterado 27/12/24)
function listar(categoria,dificuldade) {
  console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
  var instrucaoSql = `
  select * from receitas as r
  join categoria as c on r.fkCategoria = c.idCategoria
  where r.fkCategoria = ${categoria} and r.dificuldade = '${dificuldade}';`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

// Criando função para consultar as categorias do banco de dados (alterado 27/12/24)
function listar_categorias(){
  console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar_categorias()");
  console.log("Passei aqui")
  var instrucaoSql = `select * from categoria;`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

// Criando função para consultar as dificuldades do banco de dados (alterado 27/12/24)
function listar_dificuldades(){
  console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar_categorias()");
  console.log("Passei aqui")
  var instrucaoSql = `select * from dificuldade;`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

// Adicionando função curtir (alterado 29/12/24)
// removendo limit (alterado 01/12/24)
// alterando nome da função curtir para classificar, e complementando o parametro da avaliacao (alterado 25/01/25)
function classificar(avaliacao, idReceita, idCategoria) {
  var instrucaoSql = `
  insert into classificacao (classificacao, fkReceita, fkCategoria) values
  (${avaliacao},${idReceita}, ${idCategoria});
  `;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function plotarkpi1() {
  console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function plotarkpi1()");
  console.log("Passei aqui")
  var instrucaoSql = `
                      select c.nome as categoria, count(ca.idcadastro) as quantidade
                      from cadastro as ca
                      join categoria as c on ca.fkcategoria = c.idcategoria
                      group by c.idcategoria
                      order by quantidade desc
                      limit 1;
                      `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}
function plotarkpi2() {
  console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function plotarkpi2()");
  var instrucaoSql = `
                      select concat(cidade, ', ', estado) as regiao
                      from cadastro
                      group by cidade, estado
                      order by count(idcadastro) desc
                      limit 1;
                      `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}
function plotarkpi3() {
  console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function plotarkpi3()");
  var instrucaoSql = `
                      select count(idreceitas) as quantidadereceitas
                      from receitas;
                      `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}
function plotarDadosDoGrafico() {
  console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function plotarDadosDoGrafico()");
  var instrucaoSql = `
                      select c.nome as categoria, count(r.idreceitas) as quantidade
                      from receitas as r
                      join categoria as c on r.fkcategoria = c.idcategoria
                      group by c.idcategoria
                      order by quantidade desc
                      limit 5;
                    `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
  cadastrar,
  listar,
  listar_categorias,
  listar_dificuldades,
  classificar,
  plotarkpi1,
  plotarkpi2,
  plotarkpi3,
  plotarDadosDoGrafico
}
