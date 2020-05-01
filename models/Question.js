const knex=require('../db/connectDB');
const R=require('ramda');
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
            .select('question','questions.id', "units.outcome_id","min_marks","max_marks", "image", 'unit_id','subject_code','subject_id','subjects.name as subject_name','units.name as unit_name','units.outcome_id as unit_outcome_id')
            .where(searchData)
            .orderBy("id");
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
async function pickRandomQuestionsForQuestionPaper(sections_data,units_data){

    var query = require('../utils/queryUtils').getQueryString(sections_data,units_data);
    res=await knex.from(knex.raw(query))
                .select("id","marks","unit_id")
    res=res.reduce((arr,e)=>{
        if(arr[`${e.marks}-${e.unit_id}`]){
            arr[`${e.marks}-${e.unit_id}`].push(e.id)
        }
        else{
            arr[`${e.marks}-${e.unit_id}`]=[e.id]
        }
        return arr
    },{})
    units=R.pluck("unit_id",units_data);
    marks_questions_map={}
    questions=[]
    sections_data.forEach(ele => {
        per_unit=ele.questions_count/units.length;
        per_mod=ele.questions_count%units.length;
        units.forEach(u=>{
            if(res[`${ele.marks_per_question}-${u}`]){
                count=per_unit
                if(per_mod>0){
                    count+=1;
                    per_mod-=1;
                }
                que=res[`${ele.marks_per_question}-${u}`].splice(0,count);
                que.forEach(ques_id=>{
                    questions.push({
                        question_id:ques_id,
                        section_id:ele.section_id,
                        type:"question-paper"
                    })
                })
            }
        })
    });
    return questions;
}
module.exports={
    createQuestion,
    findQuestions,
    update,
    pickRandomQuestions,
    pickRandomQuestionsForQuestionPaper
}