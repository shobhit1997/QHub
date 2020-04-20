const Question = require('../models/Question')
async function createQuestion(data){
    console.log(data);
    var question=await Question.createQuestion(data);
    if(question){
        return question;
    }
    return null;
}
async function findQuestions(searchData){
    var question = await Question.findQuestions(searchData);
    if(question){
        return question;
    }
    else{
        return null;
    }
}
module.exports={
    createQuestion,
    findQuestions,
    update:Question.update,
}