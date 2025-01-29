var aquarioModel = require("../models/aquarioModel");
var usuarioModel = require("../models/usuarioModel");

// adicionando variavel dificuldade (alterado 23/01/2025)
function cadastrar(req, res) {
  var nomeReceita = req.body.nomeReceitaServer;
  var dificuldade = req.body.dificuldadeServer;
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
          aquarioModel.cadastrar(nomeReceita, dificuldade, tempoReceita, ingrediente1, ingrediente2, ingrediente3, ingrediente4, ingrediente5, ingrediente6, ingrediente7, ingrediente8, ingrediente9, ingrediente10, id, descricao)
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

  //removendo variaveis de ingredientes e adicionando variavel de dificuldade (alterado 27/12/24)
 function listar(req, res) {
    var categoria = req.body.categoriaServer;
    var dificuldade = req.body.dificuldadeServer;

    aquarioModel.listar(categoria, dificuldade)
    .then(function (resultado) {
        // console.log("Resultado da consulta ao banco:", resultado); // Verificando os dados (alterado em 01/01/25)
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!");
        }
    })
    .catch(function (erro) {
        console.log("Erro ao buscar receitas:", erro.sqlMessage || erro);
        if (!res.headersSent) {
            res.status(500).json({ erro: "Erro interno ao buscar receitas." });
        }
    });
}

// Adicionando função para listar_categorias (alterado 24/01/2025)
function listar_categorias(req, res) {
  aquarioModel.listar_categorias()
  .then(function (resultado) {
    if (resultado.length > 0) {
      console.log(`Passei pelo retorno do controller`);
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

// Adicionando função para listar_dificuldades (alterado 24/01/2025)
function listar_dificuldades(req, res) {
  aquarioModel.listar_dificuldades()
  .then(function (resultado) {
    if (resultado.length > 0) {
      console.log(`Passei pelo retorno do controller`);
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

// criando função curtir (alterado 29/12/24)
// alterando nome da função curtir para classificar, adicionando variavel avaliacao (alterado 25/01/25)
// alterando id categoria para id cadastro (alterdo 29/01/25)
function classificar(req, res) {
  var idReceita = req.body.idReceitas;
  var idCadastro = req.body.idCadastro;
  var avaliacao = req.body.avaliacao;

  // adicionando validação para avaliacao (alterado 25/01/25)
  if (idReceita == undefined) {
      res.status(400).send("Nenhuma receita esta definida");
  } else if (idCadastro == undefined) {
      res.status(400).send("Nenhuma categoria esta definida");
  } else if (avaliacao == undefined) {
      res.status(400).send("Nenhuma avaliação foi definida");
  } else {
    // adicionando variavel avaliacao para a model (alterado 25/01/25)
      aquarioModel.classificar(avaliacao, idReceita, idCadastro)
          .then(
              function (resultado) {
                  res.json(resultado);
              }
          )
          .catch(
              function (erro) {
                  console.log(erro);
                  console.log("Houve um erro ao realizar a curtida: ", erro.sqlMessage);
                  res.status(500).json(erro.sqlMessage);
              }
          );
  }
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
  listar_categorias,
  listar_dificuldades,
  classificar,
  plotarkpi1,
  plotarkpi2,
  plotarkpi3,
  plotarDadosDoGrafico
}