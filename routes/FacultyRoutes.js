const FacultyController = require("../controllers/FacultyController");
const express = require("express");
const router = express.Router();
const authenticate = require("../middlewares/authenticate");

router.route("/login").post(FacultyController.login);
router.route("/").get(authenticate, FacultyController.getByUsername);
router.route("/").patch(authenticate, FacultyController.update);
router.route("/logout").delete(authenticate, FacultyController.logout);
module.exports = router;