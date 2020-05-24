const QuestionManager = require("../modelManagers/QuestionManager");
const R = require("ramda");
async function create(req, res) {
    try {
        var question = await QuestionManager.createQuestion(req.body);
        if (question) {
            res.send(question);
        } else {
            res.status(400).send({ message: "Failed" });
        }
    } catch (e) {
        console.log(e);
        res.sendStatus(500);
    }
}
async function get(req, res) {
    try {
        var question = await QuestionManager.findQuestions(
            R.pick(
                ["id", "subject_code", "subject_id", "unit_id", "unit_no"],
                req.query
            )
        );
        if (question) {
            res.send(question);
        } else {
            res.status(400).send({ message: "Question Not Found" });
        }
    } catch (e) {
        console.log(e);
        res.sendStatus(500);
    }
}
async function update(req, res) {
    var data = R.pick(
        [
            "question",
            "unit_id",
            "image",
            "knowledge_level",
            "min_marks",
            "max_marks",
        ],
        req.body
    );
    try {
        var result = await QuestionManager.update(req.query.id, data);
        if (result == 1) {
            res.send(await QuestionManager.findQuestions({ id: req.query.id }));
        } else {
            res.status(400).send({ message: "Update Failed" });
        }
    } catch (e) {
        console.log(e);
        res.sendStatus(500);
    }
}
module.exports = {
    create,
    get,
    update,
};