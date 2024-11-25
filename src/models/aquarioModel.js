var database = require("../database/config");

function buscarAquariosPorEmpresa(empresaId) {

  var instrucaoSql = `SELECT * FROM aquario a WHERE fk_empresa = ${empresaId}`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(nomeReceita, tempoReceita, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, ingrediente6, ingrediente7, ingrediente8, ingrediente9, ingrediente10, fkCategoria, descricao) {

  var instrucaoSql = `INSERT INTO receitas (nomeReceitas, tempoPreparo, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, ingrediente6, ingrediente7, ingrediente8, ingrediente9, ingrediente10, fkCategoria, descricao)  VALUES ('${nomeReceita}', '${tempoReceita}', '${ingrediente1}', '${ingrediente2}', '${ingrediente3}', '${ingrediente4}', '${ingrediente5}', '${ingrediente6}', '${ingrediente7}', '${ingrediente8}', '${ingrediente9}', '${ingrediente10}', ${fkCategoria}), '${descricao}'`;

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


module.exports = {
  buscarAquariosPorEmpresa,
  cadastrar,
  listar
}
