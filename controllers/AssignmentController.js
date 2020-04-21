const AssignmentManager = require('../modelManagers/AssignmentManager')
const SubjectManager = require('../modelManagers/SubjectManager');
const R= require('ramda')
const path=require('path');
const docs = require('../utils/generateDocs');
async function create(req,res){
    try{
        var data=req.body;
        data.created_by=req.faculty.id;
        var assignment=await AssignmentManager.createAssignment(data)
        if(assignment){
            res.send(assignment)
        }
        else{
            res.status(400).send({message:"Failed"})
        }
    }
    catch(e){
        console.log(e)
        res.sendStatus(500);
    }
}
async function addQuestions(req,res){
    try{
        var data=req.body.questions;
        var assignment=await AssignmentManager.findAssignments({id:req.query.id});
        if(!assignment || assignment.length==0){
            return res.status(400).send({message:"Invalid Assignment Id"});
        }
        assignment=assignment[0];
        var questions=await AssignmentManager.addQuestionsToAssignment(req.query.id,data);
        console.log(questions)
        if(questions){
            await AssignmentManager.update(assignment.id,{question_count:assignment.question_count+questions.length})
            res.send({message:"Questions Added Successfully"})
        }
        else{
            res.status(400).send({message:"Failed"})
        }
    }
    catch(e){
        console.log(e)
        res.sendStatus(500);
    }
}
async function removeQuestions(req,res){
    try{
        var data=req.body.questions;
        var assignment=await AssignmentManager.findAssignments({id:req.query.id});
        if(!assignment || assignment.length==0){
            return res.status(400).send({message:"Invalid Assignment Id"});
        }
        assignment=assignment[0];
        var questions=await AssignmentManager.removeQuestionsFromAssignment(req.query.id,data);
        if(questions){
            await AssignmentManager.update(assignment.id,{question_count:assignment.question_count-questions})
            res.send({message:"Questions Removed Successfully"})
        }
        else{
            res.status(400).send({message:"Failed"})
        }
    }
    catch(e){
        console.log(e)
        res.sendStatus(500);
    }
}
async function getQuestions(req,res){
    try{
        var questions=await AssignmentManager.getQuestionsOfAssignment(req.query.id)
        if(questions){
            res.send(questions)
        }
        else{
            res.status(400).send({message:"Failed"})
        }
    }
    catch(e){
        console.log(e)
        res.sendStatus(500);
    }
}
async function get(req,res){
    try{
        var assignment=await AssignmentManager.findAssignments(R.pick(['id','subject_code','subject_id','unit_id','unit_no','assignment_no'],req.query))
        if(assignment){
            res.send(assignment)
        }
        else{
            res.status(400).send({message:"Assignment Not Found"})
        }
    }
    catch(e){
        console.log(e);
        res.sendStatus(500);
    }
}
async function update(req,res){
    var data=R.pick(['assignment_no','unit_id','branch','year','section','last_date_of_submission'],req.body);
    try{
        var result=await AssignmentManager.update(req.query.id,data);
        if(result==1){
            res.send(await AssignmentManager.findAssignments({'id':req.query.id}));
        }
        else{
            res.status(400).send({message:"Update Failed"})
        }
    }
    catch(e){
        console.log(e)
        res.sendStatus(500);
    }
}
async function generateAssignment(req,res){
    try{
        if(!req.query.id){
            return res.status(400).send({message:"Please provide an assignment id"});
        }
        var assignment=await AssignmentManager.findAssignments({id:req.query.id});
        if(!assignment || assignment.length==0){
            return res.status(400).send("Invalid Assignment Id");
        }
        assignment=assignment[0];
        course_outcomes=SubjectManager.getCourseOutcomes(assignment.subject_id);
        assignment.course_outcomes=course_outcomes;
        await docs.generateAssignment(assignment);
        var filePath= path.resolve(__dirname, `../outputAssignments/${assignment.subject_name}_Assignment ${assignment.assignment_no}.docx`)
        // res.send({message:"successfull"});
        res.download(filePath);
    }
    catch(e){
        console.log(e);
        res.sendStatus(500);
    }
}
module.exports={
    create,
    get,
    update,
    addQuestions,
    getQuestions,
    removeQuestions,
    generateAssignment,
}