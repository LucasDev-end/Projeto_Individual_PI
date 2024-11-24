var database = require("../database/config");

function buscarAquariosPorEmpresa(empresaId) {

  var instrucaoSql = `SELECT * FROM aquario a WHERE fk_empresa = ${empresaId}`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(nomeReceita, tempoReceita, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, ingrediente6, ingrediente7, ingrediente8, ingrediente9, ingrediente10, fkCategoria ) {

  var instrucaoSql = `INSERT INTO receitas (nome, tempoPreparo, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, ingrediente6, ingrediente7, ingrediente8, ingrediente9, ingrediente10, fkCategoria)  VALUES ('${nomeReceita}', '${tempoReceita}', '${ingrediente1}', '${ingrediente2}', '${ingrediente3}', '${ingrediente4}', '${ingrediente5}', '${ingrediente6}', '${ingrediente7}', '${ingrediente8}', '${ingrediente9}', '${ingrediente10}', ${fkCategoria})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  buscarAquariosPorEmpresa,
  cadastrar
}
