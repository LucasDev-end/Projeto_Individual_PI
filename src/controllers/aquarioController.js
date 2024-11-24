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
  var nomeReceita = req.body.nomeReceitaServer;
  var tempoReceita = req.body.tempoReceitaServer;
  var categoria = req.body.categoriaServer;
  var ingrediente1 = req.body.ingrediente1Server;
  var ingrediente2 = req.body.ingrediente2Server;
  var ingrediente3 = req.body.ingrediente3Server;
  var ingrediente4 = req.body.ingrediente4Server;
  var ingrediente5 = req.body.ingrediente5Server;
  var ingrediente6 = req.body.ingrediente6Server;
  var ingrediente7 = req.body.ingrediente7Server;
  var ingrediente8 = req.body.ingrediente8Server;
  var ingrediente9 = req.body.ingrediente9Server;
  var ingrediente10 = req.body.ingrediente10Server;

  usuarioModel.consultarCategoria(categoria)
  .then((resultadoAutenticar) => {
      if (resultadoAutenticar.length > 0) {
          var id =  resultadoAutenticar[0].Categoria;
          console.log(id)
          aquarioModel.cadastrar(nomeReceita, tempoReceita, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, ingrediente6, ingrediente7, ingrediente8, ingrediente9, ingrediente10, id)
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

      } else {
          res.status(204).json("Deu Erro AQUI!");
      }
  })  
  }

  function listar(req, res) {
    var categoria = req.query.categoriaServer;
    var ingrediente1 = req.query.ingrediende1Server;
    var ingrediente2 = req.query.ingrediende2Server;
    var ingrediente3 = req.query.ingrediende3Server;

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

module.exports = {
  buscarAquariosPorEmpresa,
  cadastrar,
  listar
}