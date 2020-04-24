const knex=require('../db/connectDB');

const DB_NAME = 'question_papers';

async function createQuestionPaper(question_paperData){
    var id=await knex(DB_NAME).insert(question_paperData);
    return findQuestionPapers({id});
}
function findQuestionPapers(searchData){
    console.log(searchData);
    if(searchData.id){
        searchData['question_papers.id']=searchData.id;
        delete searchData.id;
    }
    return knex(DB_NAME)
            .join("units","question_papers.unit_id",'=','units.id')
            .join("subjects","units.subject_id",'=',"subjects.id")
            .join("faculties","question_papers.created_by","=","faculties.id")
            .select("question_papers.id","question_paper_no","type","branch","year","section","question_count","unit_id")
            .select('units.name as unit_name',"units.cognitive_level","units.subject_id","unit_no")
            .select("subjects.subject_code","subjects.name as subject_name")
            .select("faculties.name as fuculty_name","faculties.username as faculty_username")
            .select(knex.raw("DATE_FORMAT(last_date_of_submission,'%D %M %Y') as last_date_of_submission"))
            .where(searchData);
}
async function update(question_paperId,data){
    return await knex(DB_NAME).where({id:question_paperId}).update(data);
}
function addQuestionsToQuestionPaper(data){
    return knex('question_mapping').insert(data);
}
function getQuestionsOfQuestionPaper(question_paperId){
    return knex('question_mapping')
            .join('questions',"question_mapping.question_id",'=','questions.id')
            .where({'question_paper_id':question_paperId})
}
function removeQuestionsFromQuestionPaper(question_paperId,questions){
    return knex('question_mapping')
            .where({question_paper_id:question_paperId})
            .whereIn('question_id',questions)
            .del();
}
module.exports={
    createQuestionPaper,
    findQuestionPapers,
    update,
    addQuestionsToQuestionPaper,
    getQuestionsOfQuestionPaper,
    removeQuestionsFromQuestionPaper
}