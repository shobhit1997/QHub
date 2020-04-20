const SubjectManager = require('../modelManagers/SubjectManager')
const R= require('ramda')
async function create(req,res){
    try{
        var subject=await SubjectManager.createSubject(req.body)
        if(subject){
            res.send(subject)
        }
        else{
            res.status(400).send({message:"Failed"})
        }
    }
    catch(e){
        console.log(e)
        if(e.code=='ER_DUP_ENTRY'){
            res.status(400).send({message:`Duplicate Subject Code(${req.body.subject_code})`});
        }
        res.sendStatus(500);
    }
}
async function get(req,res){
    try{
        var subject=await SubjectManager.findSubject(R.pick(['id','subject_code'],req.query))
        if(subject){
            res.send(subject)
        }
        else{
            res.status(400).send({message:"Subject Not Found"})
        }
    }
    catch(e){
        res.sendStatus(500);
    }
}
async function update(req,res){
    var data=R.pick(['name','subject_code'],req.body);
    try{
        var result=await SubjectManager.update(req.query.id,data);
        if(result==1){
            res.send(await SubjectManager.findSubject({id:req.query.id}));
        }
        else{
            res.status(400).send({message:"Update Failed"})
        }
    }
    catch(e){
        console.log(e)
        if(e.code=='ER_DUP_ENTRY'){
            res.status(400).send({message:`Duplicate Subject Code(${req.body.subject_code})`});
        }
        res.sendStatus(500);
    }
}
module.exports={
    create,
    get,
    update,
}