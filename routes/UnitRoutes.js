const UnitController = require('../controllers/UnitController');
const express = require("express");
const router = express.Router();
const authenticate = require('../middlewares/authenticate');

router.route('/').post(authenticate,UnitController.create);
router.route('/').get(authenticate,UnitController.get);
router.route('/').patch(authenticate,UnitController.update);
module.exports=router;