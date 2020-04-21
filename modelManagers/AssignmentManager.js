const Assignment = require('../models/Assignment')
const Question = require('../models/Question')

async function createAssignment(data){
    console.log(data);
    var assignment=await Assignment.createAssignment(data);
    if(assignment && assignment.length>0){
        assignment=assignment[0];
        if(assignment.type==="automatic"){
            var questions = await Question.pickRandomQuestions({unit_id:assignment.unit_id},assignment.question_count);
            console.log(questions);
            questions=questions.map(q=>{
                let question={};
                question.assignment_id=assignment.id
                question.type='assignment'
                question.question_id=q.id
                return question;
            })
            await Assignment.addQuestionsToAssignment(questions)
            if(questions.length<assignment.question_count){
                await Assignment.update(assignment.id,{question_count:questions.length})
            }
            assignment.questions=questions;
            assignment.question_count=questions.length;
        }
        return assignment;
    }
    return null;
}
async function findAssignments(searchData){
    var assignment = await Assignment.findAssignments(searchData);
    if(assignment){
        // console.log(assignment)
        assignment=assignment.map(async as=>{
            as.questions=await Assignment.getQuestionsOfAssignment(as.id);
            return as;
        })
        assignment=await Promise.all(assignment);
        console.log(assignment);
        return assignment;
    }
    else{
        return null;
    }
}
async function addQuestionsToAssignment(assignmentId,questions){
    questions=questions.map(q=>{
        let question={};
        question.assignment_id=assignmentId
        question.type='assignment'
        question.question_id=q
        return question;
    })
    return Assignment.addQuestionsToAssignment(questions)
}
module.exports={
    createAssignment,
    findAssignments,
    update:Assignment.update,
    addQuestionsToAssignment,
    getQuestionsOfAssignment:Assignment.getQuestionsOfAssignment
}