var express = require("express");
var router = express.Router();

var aquarioController = require("../controllers/aquarioController");

router.post("/cadastrar", function (req, res) {
  aquarioController.cadastrar(req, res);
})
router.post("/listar", function (req, res) {
  aquarioController.listar(req, res);
});

// alterando o nome da rota para listar_categorias (Alterado 24/01/2025)
// Adicionando end-point para listar categorias (alterado 24/01/2025)
router.post("/listar_categorias", function (req, res) {
  aquarioController.listar_categorias(req, res);
});

// Adicionando end-point para listar_dificuldades (alterado 24/01/2025)
router.post("/listar_dificuldades", function (req, res) {
  aquarioController.listar_dificuldades(req, res);
});

//criando rota para função curtir do controller alterado (29/12/24)
router.post("/curtir", function (req, res){
  aquarioController.curtir(req, res);
});

router.get("/plotarkpi1", function (req, res) {
  aquarioController.plotarkpi1(req, res);
});
router.get("/plotarkpi2", function (req, res) {
  aquarioController.plotarkpi2(req, res);
});
router.get("/plotarkpi3", function (req, res) {
  aquarioController.plotarkpi3(req, res);
});
router.get("/plotarDadosDoGrafico", function (req, res) {
  aquarioController.plotarDadosDoGrafico(req, res);
});

module.exports = router;