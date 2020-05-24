const knex = require("../db/connectDB");

const DB_NAME = "question_papers";

function createQuestionPaper(question_paperData) {
    return knex(DB_NAME).insert(question_paperData);
}
async function createQuestionPaperSections(section_data) {
    return knex("question_paper_sections").insert(section_data);
}
async function createQuestionPaperUnits(units_data) {
    return knex("question_paper_units").insert(units_data);
}

function findQuestionPapers(searchData) {
    if (searchData.id) {
        searchData["question_papers.id"] = searchData.id;
        delete searchData.id;
    }
    return knex(DB_NAME)
        .join("faculties", "question_papers.created_by", "=", "faculties.id")
        .join("subjects", "question_papers.subject_id", "=", "subjects.id")
        .select("question_papers.id", "exam", "type", "branch", "year")
        .select(
            "faculties.name as fuculty_name",
            "faculties.username as faculty_username"
        )
        .select("subjects.name as subject_name", "subject_code", "subject_id")
        .select(knex.raw("DATE_FORMAT(date_of_exam,'%D %M %Y') as date_of_exam"))
        .where(searchData);
}

function getQuestionPaperSections(searchData) {
    return knex("question_paper_sections")
        .select(
            "id",
            "questions_count",
            "max_marks",
            "type",
            "compulsary_questions"
        )
        .where(searchData);
}

function getSectionQuestions(section_id) {
    return knex("question_mapping")
        .join("questions", "questions.id", "=", "question_mapping.question_id")
        .select("question_id", "question", "image", "unit_id")
        .where({ section_id });
}

function getPaperUnits(searchData) {
    return knex("question_paper_units")
        .join("units", "units.id", "=", "question_paper_units.unit_id")
        .select("units.id", "name", "unit_no")
        .where(searchData);
}

function addQuestionsToQuestionPaper(data) {
    return knex("question_mapping").insert(data);
}

function removeQuestionsFromQuestionPaper(section_id, questions) {
    return knex("question_mapping")
        .where({ section_id })
        .whereIn("question_id", questions)
        .del();
}
module.exports = {
    createQuestionPaper,
    findQuestionPapers,
    addQuestionsToQuestionPaper,
    removeQuestionsFromQuestionPaper,
    createQuestionPaperSections,
    createQuestionPaperUnits,
    getPaperUnits,
    getQuestionPaperSections,
    getSectionQuestions,
};