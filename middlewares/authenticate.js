const FacultyManager= require('../modelManagers/FacultyManager');
var authenticate = function(req,res,next){
    var token = req.header('token');
    console.log(token);
	FacultyManager.findByToken(token).then(function(faculty){
		if(!faculty){
			return Promise.reject();	
		}
		req.faculty=faculty;
		next();
	}).catch(function(e){
		res.status(401).send(e);
	});

};

module.exports=authenticate;