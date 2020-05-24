const express = require("express");
const router = express.Router();
const authenticate = require("../middlewares/authenticate");
const imageUploadUtils = require("../utils/imageUploadUtils");
const UtilityManager = require("../modelManagers/UtilityManager");
router
    .route("/images")
    .post(
        authenticate,
        imageUploadUtils.multer.single("image"),
        imageUploadUtils.sendUploadToGCS,
        async function(req, res) {
            if (req.file && req.file.cloudStoragePublicUrl) {
                await UtilityManager.storeImage({
                    url: req.file.cloudStoragePublicUrl,
                    faculty_id: req.faculty.id,
                });
                return res.send({ imageUrl: req.file.cloudStoragePublicUrl });
            }
            return res.status(400).send({ message: "Invalid Image" });
        }
    )
    .get(authenticate, async function(req, res) {
        try {
            let images = await UtilityManager.findImages(req.faculty.id);
            if (images) {
                res.send(images);
            } else {
                res.status(400).send({ message: "Some Error" });
            }
        } catch (e) {
            res.sendStatus(500);
        }
    });
module.exports = router;