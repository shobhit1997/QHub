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
            // .select('questions.id','questions.name','subject_code','subjects.name as subject_name','questions.cognitive_level','questions')
            .select('*')
            .where(searchData);
}
async function update(questionId,data){
    return await knex(DB_NAME).where({id:questionId}).update(data);
}
module.exports={
    createQuestion,
    findQuestions,
    update
}