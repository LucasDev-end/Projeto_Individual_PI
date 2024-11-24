var aquarioModel = require("../models/aquarioModel");

function buscarAquariosPorEmpresa(req, res) {
  var idUsuario = req.params.idUsuario;

  aquarioModel.buscarAquariosPorEmpresa(idUsuario).then((resultado) => {
    if (resultado.length > 0) {
      res.status(200).json(resultado);
    } else {
      res.status(204).json([]);
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar os aquarios: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}


function cadastrar(req, res) {
  var nomeReceita = req.body.nomeReceita;
  var tempoReceita = req.body.tempoReceita;
  var ingrediente1 = req.body.ingrediente1;
  var ingrediente2 = req.body.ingrediente2;
  var ingrediente3 = req.body.ingrediente3;
  var ingrediente4 = req.body.ingrediente4;
  var ingrediente5 = req.body.ingrediente5;
  var ingrediente6 = req.body.ingrediente6;
  var ingrediente7 = req.body.ingrediente7;
  var ingrediente8 = req.body.ingrediente8;
  var ingrediente9 = req.body.ingrediente9;
  var ingrediente10 = req.body.ingrediente10;

  if (descricao == undefined) {
    res.status(400).send("descricao está undefined!");
  } else if (idUsuario == undefined) {
    res.status(400).send("idUsuario está undefined!");
  } else {


    aquarioModel.cadastrar(nomeReceita, tempoReceita, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, ingrediente6, ingrediente7, ingrediente8, ingrediente9, ingrediente10)
      .then((resultado) => {
        res.status(201).json(resultado);
      }
      ).catch((erro) => {
        console.log(erro);
        console.log(
          "\nHouve um erro ao realizar o cadastro! Erro: ",
          erro.sqlMessage
        );
        res.status(500).json(erro.sqlMessage);
      });
  }
}

module.exports = {
  buscarAquariosPorEmpresa,
cadastrar
}