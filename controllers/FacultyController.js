const FacultyManager = require('../modelManagers/FacultyManager')
const R= require('ramda')
async function login(req,res){
    var code=req.body.code;
    var faculty=await FacultyManager.login({code})
    var token = await FacultyManager.generateAuthToken(faculty);
    res.header("token", token).send(faculty);
}
async function getByUsername(req,res){
    res.send(req.faculty);
}
async function update(req,res){
    var data=R.pick(['name','email','department'],req.body);
    try{
        var result=await FacultyManager.update(req.faculty,data);
        if(result==1){
            res.send(await FacultyManager.findByUsername(req.faculty.username))
        }
        else{
            res.status(400).send({message:"Update Failed"})
        }
    }
    catch(e){
        console.log(e)
        res.sendStatus(400);
    }
}
async function logout(req,res){
    try{
        var result=await FacultyManager.logout(req.faculty,req.header('token'));
        if(result==1){
            res.send({message:"Successful"})
        }
        else{
            res.status(400).send({message:"Update Failed"})
        }
    }
    catch(e){
        console.log(e)
        res.sendStatus(400);
    }
}
module.exports={
    login,
    getByUsername,
    update,
    logout,
}