const QuestionPaper = require("../models/QuestionPaper");
const Question = require("../models/Question");
const R = require("ramda");

async function createQuestionPaper(data) {
    console.log(data);
    question_paper_data = R.pick(
        [
            "exam",
            "type",
            "branch",
            "year",
            "created_by",
            "subject_id",
            "date_of_exam",
        ],
        data
    );
    sections_data = data.sections;
    units_data = data.units;
    var question_paper_id = await QuestionPaper.createQuestionPaper(
        question_paper_data
    );
    if (question_paper_id && question_paper_id.length > 0) {
        question_paper_id = question_paper_id[0];
        console.log(question_paper_id);
        sections_data = sections_data.map((d) => {
            d.question_paper_id = question_paper_id;
            return d;
        });
        units_data = units_data.map((d) => {
            return {
                question_paper_id,
                unit_id: d,
            };
        });
        section_id = await QuestionPaper.createQuestionPaperSections(sections_data);
        unit_id = await QuestionPaper.createQuestionPaperUnits(units_data);
        if (data.type === "automatic") {
            section_id = section_id[0];
            sections_data = sections_data.map((sd) => {
                let marks_per_question = sd.max_marks / sd.compulsary_questions;
                sd["marks_per_question"] = marks_per_question;
                sd["section_id"] = section_id++;
                return sd;
            });
            var questions = await Question.pickRandomQuestionsForQuestionPaper(
                sections_data,
                units_data
            );
            console.log(questions);
            await QuestionPaper.addQuestionsToQuestionPaper(questions);
        }
        return await findQuestionPapers({ id: question_paper_id });
    }
    return null;
}
async function findQuestionPapers(searchData) {
    var question_paper = await QuestionPaper.findQuestionPapers(searchData);
    if (question_paper) {
        console.log(question_paper);
        question_paper = question_paper.map(async(as) => {
            console.log(as);
            as.sections = await QuestionPaper.getQuestionPaperSections({
                question_paper_id: as.id,
            });
            as.sections = await Promise.all(
                as.sections.map(async(s) => {
                    console.log(s);
                    s.questions = await QuestionPaper.getSectionQuestions(s.id);
                    return s;
                })
            );
            as.units = await QuestionPaper.getPaperUnits({
                question_paper_id: as.id,
            });
            return as;
        });
        question_paper = await Promise.all(question_paper);
        console.log(question_paper);
        return question_paper;
    } else {
        return null;
    }
}
async function addQuestionsToQuestionPaper(section_id, questions) {
    questions = questions.map((q) => {
        let question = {};
        question.section_id = section_id;
        question.type = "question-paper";
        question.question_id = q;
        return question;
    });
    return QuestionPaper.addQuestionsToQuestionPaper(questions);
}
module.exports = {
    createQuestionPaper,
    findQuestionPapers,
    addQuestionsToQuestionPaper,
    removeQuestionsFromQuestionPaper: QuestionPaper.removeQuestionsFromQuestionPaper,
    findQuestionPaperSections: QuestionPaper.getQuestionPaperSections,
    findPaperUnits: QuestionPaper.getPaperUnits,
};