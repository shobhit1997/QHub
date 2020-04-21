const AssignmentController = require('../controllers/AssignmentController');
const express = require("express");
const router = express.Router();
const authenticate = require('../middlewares/authenticate');

router.route('/').post(authenticate,AssignmentController.create);
router.route('/').get(authenticate,AssignmentController.get);
router.route('/').patch(authenticate,AssignmentController.update);
router.route('/question').post(authenticate,AssignmentController.addQuestions);
router.route('/question').get(authenticate,AssignmentController.getQuestions);
module.exports=router;