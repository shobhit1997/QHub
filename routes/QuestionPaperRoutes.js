const QuestionPaperController = require("../controllers/QuestionPaperController");
const express = require("express");
const router = express.Router();
const authenticate = require("../middlewares/authenticate");

router.route("/").post(authenticate, QuestionPaperController.create);
router.route("/").get(authenticate, QuestionPaperController.get);
router
    .route("/question")
    .post(authenticate, QuestionPaperController.addQuestions);
// router.route('/question').get(authenticate,QuestionPaperController.getQuestions);
router
    .route("/question")
    .delete(authenticate, QuestionPaperController.removeQuestions);
router
    .route("/generateQuestionPaper")
    .get(authenticate, QuestionPaperController.generateQuestionPaper);
module.exports = router;