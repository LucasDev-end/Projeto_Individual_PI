var express = require("express");
var router = express.Router();

var aquarioController = require("../controllers/aquarioController");

router.get("/:empresaId", function (req, res) {
  aquarioController.buscarAquariosPorEmpresa(req, res);
});

router.post("/cadastrar", function (req, res) {
  aquarioController.cadastrar(req, res);
})
router.post("/listar", function (req, res) {
  aquarioController.listar(req, res);
});

router.post("/plotarkpi1", function (req, res) {
  aquarioController.plotarkpi1(req, res);
});
router.post("/plotarkpi2", function (req, res) {
  aquarioController.plotarkpi2(req, res);
});
router.post("/plotarkpi3", function (req, res) {
  aquarioController.plotarkpi3(req, res);
});
router.post("/plotarDadosDoGrafico", function (req, res) {
  aquarioController.plotarDadosDoGrafico(req, res);
});

module.exports = router;