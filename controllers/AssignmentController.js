const AssignmentManager = require('../modelManagers/AssignmentManager')
const R= require('ramda')
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
        var questions=await AssignmentManager.addQuestionsToAssignment(req.query.id,data);
        if(questions){
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
    var data=R.pick(['assignment_no','unit_id','branch','year','section','question_count','last_date_of_submission'],req.body);
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
module.exports={
    create,
    get,
    update,
    addQuestions,
    getQuestions,
}