var aquarioModel = require("../models/aquarioModel");
var usuarioModel = require("../models/usuarioModel");


function cadastrar(req, res) {
  var nomeReceita = req.body.nomeReceitaServer;
  var tempoReceita = req.body.tempoReceitaServer;
  var categoria = req.body.categoriaServer;
  var ingrediente1 = req.body.Ingrediente1Server;
  var ingrediente2 = req.body.Ingrediente2Server;
  var ingrediente3 = req.body.Ingrediente3Server;
  var ingrediente4 = req.body.Ingrediente4Server;
  var ingrediente5 = req.body.Ingrediente5Server;
  var ingrediente6 = req.body.Ingrediente6Server;
  var ingrediente7 = req.body.Ingrediente7Server;
  var ingrediente8 = req.body.Ingrediente8Server;
  var ingrediente9 = req.body.Ingrediente9Server;
  var ingrediente10 = req.body.Ingrediente10Server;
  var descricao = req.body.descricaoServer;

  usuarioModel.consultarCategoria(categoria)
  .then((resultadoAutenticar) => {
      if (resultadoAutenticar.length > 0) {
          var id =  resultadoAutenticar[0].idCategoria;
          console.log(id)
          aquarioModel.cadastrar(nomeReceita, tempoReceita, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, ingrediente6, ingrediente7, ingrediente8, ingrediente9, ingrediente10, id, descricao)
            .then((resultado) => {
              console.log("Passei aqui dento")
              return res.json(resultado);
            }
            ).catch((erro) => {
              console.log(erro);
              console.log(
                "\nHouve um erro ao realizar o cadastro! Erro: ",
                erro.sqlMessage
              );
              res.status(500).json(erro.sqlMessage);
            });

      } else {
          res.status(204).json("Deu Erro AQUI!");
      }
  })  
  }

 function listar(req, res) {
    var categoria = req.body.categoriaderver;
    var ingrediente1 = req.body.ingrediende1Server;
    var ingrediente2 = req.body.ingrediende2Server;
    var ingrediente3 = req.body.ingrediende3Server;

    aquarioModel.listar(categoria, ingrediente1, ingrediente2, ingrediente3).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar por receitas: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function plotarkpi1(req, res) {
  aquarioModel.plotarkpi1()
    .then(function (resultado) {
      if (resultado.length > 0) {
        res.status(200).json(resultado);
      } else {
        res.status(204).send("Nenhum resultado encontrado!");
      }
    })
    .catch(function (erro) {
      console.log(erro);
      console.log("Houve um erro ao buscar os dados: ", erro.sqlMessage);
      res.status(500).json(erro.sqlMessage);
    });
}
function plotarkpi2(req, res) {
  aquarioModel.plotarkpi2()
    .then(function (resultado) {
      if (resultado.length > 0) {
        res.status(200).json(resultado);
      } else {
        res.status(204).send("Nenhum resultado encontrado!");
      }
    })
    .catch(function (erro) {
      console.log(erro);
      console.log("Houve um erro ao buscar os dados: ", erro.sqlMessage);
      res.status(500).json(erro.sqlMessage);
    });
}
function plotarkpi3(req, res) {
  aquarioModel.plotarkpi3()
    .then(function (resultado) {
      if (resultado.length > 0) {
        res.status(200).json(resultado);
      } else {
        res.status(204).send("Nenhum resultado encontrado!");
      }
    })
    .catch(function (erro) {
      console.log(erro);
      console.log("Houve um erro ao buscar os dados: ", erro.sqlMessage);
      res.status(500).json(erro.sqlMessage);
    });
}
function plotarDadosDoGrafico(req, res) {
  aquarioModel.plotarDadosDoGrafico()
    .then(function (resultado) {
      if (resultado.length > 0) {
        res.status(200).json(resultado);
      } else {
        res.status(204).send("Nenhum resultado encontrado!");
      }
    })
    .catch(function (erro) {
      console.log(erro);
      console.log("Houve um erro ao buscar os dados: ", erro.sqlMessage);
      res.status(500).json(erro.sqlMessage);
    });
}


module.exports = {
  cadastrar,
  listar,
  plotarkpi1,
  plotarkpi2,
  plotarkpi3,
  plotarDadosDoGrafico
}