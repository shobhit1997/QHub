const QuestionController = require("../controllers/QuestionController");
const express = require("express");
const router = express.Router();
const authenticate = require("../middlewares/authenticate");

router.route("/").post(authenticate, QuestionController.create);
router.route("/").get(authenticate, QuestionController.get);
router.route("/").patch(authenticate, QuestionController.update);
module.exports = router;