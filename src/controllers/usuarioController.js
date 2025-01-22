var usuarioModel = require("../models/usuarioModel");

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                    if (resultadoAutenticar.length == 1) {
                        console.log(`email: ${email} senha:${senha}`);
                        console.log(resultadoAutenticar);
                         res.json({
                             id: resultadoAutenticar[0].idcadastro,
                             email: resultadoAutenticar[0].email,
                             nome: resultadoAutenticar[0].nome,
                             senha: resultadoAutenticar[0].senha
                         });

                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

    function cadastrar(req, res) { 
        var nome = req.body.nomeServer;
        var email = req.body.emailServer;
        var cidade = req.body.cidadeServer;
        var estados = req.body.estadosServer;
        var senha = req.body.senhaServer;
        var categoria = req.body.categoriaServer;

        // Mostrando os dados recebidos pelo front-end (alteração feita em 21/12/2024)
        console.log("Dados recebidos:", nome, email, cidade, estados, senha, categoria);
        if (nome == undefined) {
            res.status(400).send("Seu nome está undefined!");
        } else if (email == undefined) {
            res.status(400).send("Seu email está undefined!");
        } else if (senha == undefined) {
            res.status(400).send("Sua senha está undefined!");
        }else if (estados == undefined) {
            res.status(400).send("Sua estados está undefined!");
        } else if (cidade == undefined) {
            res.status(400).send("Sua cidade está undefined!");
        }else {
            // Consultando a categoria no banco de dados para verificar se existe
            usuarioModel.consultarCategoria(categoria
            ).then((resultadoAutenticar) => {
                // Caso a categoria exista, realizamos o cadastro
                if (resultadoAutenticar.length > 0) {
                    // Pegando o ID da categoria para usar no cadastro
                    var id = resultadoAutenticar[0].idCategoria;
                    //retornando que a categoria foi encontrada (alteração feita em 21/12/2024)
                    console.log("Categoria encontrada:", id);
                    // Realizando o cadastro do usuário com os dados recebidos (alteração feita em 21/12/2024)
                    usuarioModel.cadastrar(nome, email, cidade, estados, senha, id)
                    .then((resultado) => {
                            // Retornando que o cadastro foi realizado, e em seguida mostrando o resultado (alteração feita em 21/12/2024)
                            console.log("Cadastro realizado com sucesso:", resultado);
                            res.json(resultado);
                        })
                        .catch((erro) => {
                            // Caso de erro ao cadastrar, sera retornado a resposta com o código de erro (alteração feita em 21/12/2024)
                            console.log("Erro ao cadastrar:", erro);
                            res.status(500).json(erro.sqlMessage);
                        });
                } else {
                    // Caso a categoria não seja encontrada, retorna que a categoria não foi encontrada e o erro 404 (alteração feita em 21/12/2024)
                    console.log("Categoria não foi encontrada");
                    res.status(404).json("Categoria não encontrada!");
                }
            })
            .catch((erro) => {
                // Caso haja erro na consulta da categoria, retorna o erro na consulta da categoria (alteração feita em 21/12/2024)
                console.log("Erro ao consultar categoria:", erro);
                res.status(500).json(erro.sqlMessage);
            });
        }
    }

module.exports = {
    autenticar,
    cadastrar
}