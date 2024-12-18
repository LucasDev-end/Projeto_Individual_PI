var database = require("../database/config");


function cadastrar(nomeReceita, tempoReceita, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, ingrediente6, ingrediente7, ingrediente8, ingrediente9, ingrediente10, fkCategoria, descricao) {

  var instrucaoSql = `INSERT INTO receitas (nomeReceitas, tempoPreparo, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, ingrediente6, ingrediente7, ingrediente8, ingrediente9, ingrediente10, fkCategoria, descricao)  VALUES ('${nomeReceita}', '${tempoReceita}', '${ingrediente1}', '${ingrediente2}', '${ingrediente3}', '${ingrediente4}', '${ingrediente5}', '${ingrediente6}', '${ingrediente7}', '${ingrediente8}', '${ingrediente9}', '${ingrediente10}', ${fkCategoria}, '${descricao}');`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function listar(categoria,ingrediente1,ingrediente2,ingrediente3) {
  console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
  var instrucaoSql = `
  SELECT *
  FROM receitas r
  JOIN categoria c ON r.fkCategoria = c.idCategoria
  WHERE r.fkCategoria = ${categoria}
    AND (
        ingrediente1 IN ('${ingrediente1}', '${ingrediente2}', '${ingrediente3}') OR
        ingrediente2 IN ('${ingrediente1}', '${ingrediente2}', '${ingrediente3}') OR
        ingrediente3 IN ('${ingrediente1}', '${ingrediente2}', '${ingrediente3}') OR
        ingrediente4 IN ('${ingrediente1}', '${ingrediente2}', '${ingrediente3}') OR
        ingrediente5 IN ('${ingrediente1}', '${ingrediente2}', '${ingrediente3}') OR
        ingrediente6 IN ('${ingrediente1}', '${ingrediente2}', '${ingrediente3}') OR
        ingrediente7 IN ('${ingrediente1}', '${ingrediente2}', '${ingrediente3}') OR
        ingrediente8 IN ('${ingrediente1}', '${ingrediente2}', '${ingrediente3}') OR
        ingrediente9 IN ('${ingrediente1}', '${ingrediente2}', '${ingrediente3}') OR
        ingrediente10 IN ('${ingrediente1}', '${ingrediente2}', '${ingrediente3}')
        ) limit 1;`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


function plotarkpi1() {
  console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
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
  console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
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
  console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
  var instrucaoSql = `
                      select count(idreceitas) as quantidadereceitas
                      from receitas;
                      `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}
function plotarDadosDoGrafico() {
  console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
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
  plotarkpi1,
  plotarkpi2,
  plotarkpi3,
  plotarDadosDoGrafico
}
