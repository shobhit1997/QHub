const Faculty = require("../models/Faculty");
const infoconnectUtil = require("../utils/infoconnectUtil");
const jwt = require("jsonwebtoken");
require("dotenv").config({ path: "./.env" });
async function login(data) {
    let code = data.code;
    try {
        var body = await infoconnectUtil.getUserDetails(code);
        var faculty = await Faculty.findByUsername(body.username);
        if (faculty && faculty.length == 0) {
            faculty = await Faculty.createUser({
                username: body.username,
                name: body.name,
                info_token: body.token,
                department: "club",
            });
        }
        faculty = faculty[0];
        return faculty;
    } catch (e) {
        console.log(e);
        return e;
    }
}

function generateAuthToken(faculty) {
    return Faculty.generateAuthToken(faculty);
}
async function findByUsername(username) {
    var faculty = await Faculty.findByUsername(username);
    if (faculty && faculty.length > 0) {
        return faculty[0];
    } else {
        return null;
    }
}
async function findByToken(token) {
    var decodedToken;
    try {
        decodedToken = jwt.verify(token, process.env.JWT_SECRET);
    } catch (e) {
        return new Promise(function(resolve, reject) {
            reject();
        });
    }
    try {
        var faculty = await Faculty.findByToken(decodedToken, token);
        if (faculty && faculty.length > 0) {
            return faculty[0];
        }
        return null;
    } catch (e) {
        console.log(e);
        return null;
    }
}
module.exports = {
    login,
    generateAuthToken,
    findByToken,
    findByUsername,
    update: Faculty.update,
    logout: Faculty.logout,
};