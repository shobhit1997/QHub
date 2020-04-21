const knex=require('../db/connectDB');

const DB_NAME = 'questions';

async function createQuestion(questionData){
    await knex(DB_NAME).insert(questionData);
    return findQuestions({unit_id:questionData.unit_id});
}
function findQuestions(searchData){
    console.log(searchData);
    if(searchData.id){
        searchData['questions.id']=searchData.id;
        delete searchData.id;
    }
    return knex(DB_NAME)
            .join("units","questions.unit_id",'=','units.id')
            .join("subjects","units.subject_id",'=',"subjects.id")
            .select('question','questions.id', "units.cognitive_level","min_marks","max_marks", "image", 'unit_id','subject_code','subject_id','subjects.name as subject_name','units.name as unit_name','units.cognitive_level as unit_cognitive_level')
            .where(searchData);
}
async function update(questionId,data){
    return await knex(DB_NAME).where({id:questionId}).update(data);
}
function pickRandomQuestions(searchData,questionCount){
    console.log(searchData);
    return knex(DB_NAME)
            .join("units","questions.unit_id",'=','units.id')
            .join("subjects","units.subject_id",'=',"subjects.id")
            .select('questions.id')
            .where(searchData)
            .orderByRaw('RAND()')
            .limit(questionCount);
}
module.exports={
    createQuestion,
    findQuestions,
    update,
    pickRandomQuestions
}