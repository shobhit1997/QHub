const SubjectController = require('../controllers/SubjectController');
const express = require("express");
const router = express.Router();
const authenticate = require('../middlewares/authenticate');

router.route('/').post(authenticate,SubjectController.create);
router.route('/').get(authenticate,SubjectController.get);
router.route('/').patch(authenticate,SubjectController.update);
module.exports=router;