const knex=require('../db/connectDB');

const DB_NAME = 'assignments';

async function createAssignment(assignmentData){
    var id=await knex(DB_NAME).insert(assignmentData);
    return findAssignments({id});
}
function findAssignments(searchData){
    console.log(searchData);
    if(searchData.id){
        searchData['assignments.id']=searchData.id;
        delete searchData.id;
    }
    return knex(DB_NAME)
            .join("units","assignments.unit_id",'=','units.id')
            .join("subjects","units.subject_id",'=',"subjects.id")
            .join("faculties","assignments.created_by","=","faculties.id")
            .select("assignments.id","assignment_no","type","branch","year","section","question_count","unit_id")
            .select('units.name as unit_name',"units.cognitive_level","units.subject_id","unit_no")
            .select("subjects.subject_code","subjects.name as subject_name")
            .select("faculties.name as fuculty_name","faculties.username as faculty_username")
            .select(knex.raw("DATE_FORMAT(last_date_of_submission,'%D %M %Y') as last_date_of_submission"))
            .where(searchData);
}
async function update(assignmentId,data){
    return await knex(DB_NAME).where({id:assignmentId}).update(data);
}
function addQuestionsToAssignment(data){
    return knex('question_mapping').insert(data);
}
function getQuestionsOfAssignment(assignmentId){
    return knex('question_mapping')
            .join('questions',"question_mapping.question_id",'=','questions.id')
            .where({'assignment_id':assignmentId})
}
function removeQuestionsFromAssignment(assignmentId,questions){
    return knex('question_mapping')
            .where({assignment_id:assignmentId})
            .whereIn('question_id',questions)
            .del();
}
module.exports={
    createAssignment,
    findAssignments,
    update,
    addQuestionsToAssignment,
    getQuestionsOfAssignment,
    removeQuestionsFromAssignment
}