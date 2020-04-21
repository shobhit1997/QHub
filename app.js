const path= require('path');
const express=require('express');
const  app=express();
const bodyParser=require('body-parser');
const facultyRoutes=require('./routes/FacultyRoutes');
const subjectRoutes=require('./routes/SubjectRoutes');
const unitRoutes=require('./routes/UnitRoutes');
const questionRoutes=require('./routes/QuestionRoutes');
const assignmentRoutes = require('./routes/AssignmentRoutes');
app.use(bodyParser.urlencoded({extended : true}));
app.use(bodyParser.json());
app.use(function(req,res,next){
	res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Expose-Headers', 'token');
    res.header("Access-Control-Allow-Methods", "GET, PUT, POST, DELETE");
    res.setHeader('Access-Control-Allow-Headers','Origin, X-Requested-With,content-type, Accept , token');
  
	next();
});
app.get("/", function(req, res) {
	// body...
	res.send({ message: "Welcome" });
});
app.use('/api/faculty',facultyRoutes);
app.use('/api/subject',subjectRoutes);
app.use('/api/unit',unitRoutes);
app.use('/api/question',questionRoutes);
app.use('/api/assignment',assignmentRoutes);
module.exports=app;