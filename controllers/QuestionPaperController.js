const QuestionPaperManager = require("../modelManagers/QuestionPaperManager");
const SubjectManager = require("../modelManagers/SubjectManager");
const R = require("ramda");
const path = require("path");
const fs = require("fs");
const docs = require("../utils/generateDocs");
const infoconnectUtils = require("../utils/infoconnectUtil");
async function create(req, res) {
    try {
        var data = req.body;
        data.created_by = req.faculty.id;
        var question_paper = await QuestionPaperManager.createQuestionPaper(data);
        if (question_paper) {
            res.send(question_paper);
        } else {
            res.status(400).send({ message: "Failed" });
        }
    } catch (e) {
        console.log(e);
        res.sendStatus(500);
    }
}
async function addQuestions(req, res) {
    try {
        var data = req.body.questions;
        var section_id = req.query.section_id;
        var question_paper = await QuestionPaperManager.findQuestionPaperSections({
            id: section_id,
            question_paper_id: req.query.id,
        });
        if (!question_paper || question_paper.length == 0) {
            return res
                .status(400)
                .send({ message: "Invalid QuestionPaper/Section Id" });
        }
        question_paper = question_paper[0];
        var questions = await QuestionPaperManager.addQuestionsToQuestionPaper(
            section_id,
            data
        );
        if (questions) {
            res.send({ message: "Questions Added Successfully" });
        } else {
            res.status(400).send({ message: "Failed" });
        }
    } catch (e) {
        console.log(e);
        res.sendStatus(500);
    }
}
async function removeQuestions(req, res) {
    try {
        var data = req.body.questions;
        var section_id = req.query.section_id;
        var question_paper = await QuestionPaperManager.findQuestionPaperSections({
            id: section_id,
            question_paper_id: req.query.id,
        });
        if (!question_paper || question_paper.length == 0) {
            return res
                .status(400)
                .send({ message: "Invalid QuestionPaper/Section Id" });
        }
        question_paper = question_paper[0];
        var questions = await QuestionPaperManager.removeQuestionsFromQuestionPaper(
            section_id,
            data
        );
        if (questions) {
            res.send({ message: "Questions Removed Successfully" });
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
        var question_paper = await QuestionPaperManager.findQuestionPapers(
            R.pick(
                [
                    "id",
                    "subject_code",
                    "subject_id",
                    "unit_id",
                    "unit_no",
                    "question_paper_no",
                ],
                req.query
            )
        );
        if (question_paper) {
            res.send(question_paper);
        } else {
            res.status(400).send({ message: "QuestionPaper Not Found" });
        }
    } catch (e) {
        console.log(e);
        res.sendStatus(500);
    }
}
async function generateQuestionPaper(req, res) {
    try {
        if (!req.query.id) {
            return res
                .status(400)
                .send({ message: "Please provide an question_paper id" });
        }
        var question_paper = await QuestionPaperManager.findQuestionPapers({
            id: req.query.id,
        });
        if (!question_paper || question_paper.length == 0) {
            return res.status(400).send("Invalid QuestionPaper Id");
        }
        question_paper = question_paper[0];
        var section_name = 65;
        question_paper.sections = question_paper.sections.map((s) => {
            s.section_name = "Section " + String.fromCharCode(section_name);
            section_name++;
            let question_no = 1;
            s.questions = s.questions.map((q) => {
                q.question_no = question_no++;
                return q;
            });
            return s;
        });
        course_outcomes = SubjectManager.getCourseOutcomes(
            question_paper.subject_id
        );
        question_paper.course_outcomes = course_outcomes;
        await docs.generateQuestionPaper(question_paper);
        var filePath = path.resolve(
            __dirname,
            `../outputQuestionPapers/${question_paper.subject_name}_Exam ${question_paper.exam}.docx`
        );
        res.download(filePath);
    } catch (e) {
        console.log(e);
        res.sendStatus(500);
    }
}

module.exports = {
    create,
    get,
    addQuestions,
    removeQuestions,
    generateQuestionPaper,
};