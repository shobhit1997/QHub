const axios = require("axios");
var fs = require('fs');
var request = require('request-promise');
var path=require('path');
async function getLoginUrl() {
	try {
		const response = await axios.get(
			`http://oauthv2.shobhitagarwal.me/oauth/loginURL?projectID=${process.env.INFOCONNECT_PROJECT_ID}&redirectURL=${process.env.INFOCONNECT_REDIRECT_URL}`
		);
		console.log(response.data);
		return response.data;
	} catch (error) {
		console.error(error);
		return Promise.reject(error);
	}
}

async function getUserDetails(code) {
	try {
		const response = await axios.get(
			`http://oauthv2.shobhitagarwal.me/oauth/userinfo?projectID=${process.env.INFOCONNECT_PROJECT_ID}&projectSecret=${process.env.INFOCONNECT_PROJECT_SECRET}&code=${code}`
		);
		return response.data;
	} catch (error) {
		console.error(error);
		return Promise.reject(error);
	}
}
async function uploadAssignmment(data){
	var options = {
		'method': 'POST',
		'url': 'http://210.212.85.155:8082/api/notices/notice_create/',
		'headers': {
		  'Authorization': `token ${data.info_token}`,
		  'username': data.faculty_username
		},
		formData: {
		  'faculty': data.info_profile_id,
		  'title': data.title,
		  'description': data.description,
		  'category': 'academics',
		  'visible_for_students': 'true',
		  'visible_for_hod': 'true',
		  'visible_for_faculty': 'true',
		  'visible_for_management': 'true',
		  'visible_for_others': 'true',
		  'course_branch_year': 'All Courses-All Branches-All years-All Sections',
		  'file_attached': {
			'value': fs.createReadStream(path.resolve(__dirname, `../outputAssignments/${data.fileName}`)),
			'options': {
			  'filename': data.fileName,
			  'contentType': null
			}
		  }
		}
	  };
	try{
		var res=await request(options);
		console.log(res);
		return true
	}
	catch(e){
		console.log(e);
		return false;
	}
}

module.exports = { getLoginUrl, getUserDetails, uploadAssignmment };
