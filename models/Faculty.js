const knex=require('../db/connectDB');
const jwt = require('jsonwebtoken')
require('dotenv').config({ path: './.env' });

const DB_NAME = 'faculties';

async function createUser(userData){
    await knex(DB_NAME).insert(userData);
    return findByUsername(userData.username)
}
function findByUsername(username){
    return knex(DB_NAME).select('id','username','name','department','email').where({username});
}

async function generateAuthToken(faculty){
    var token = jwt.sign({username:faculty.username,id:faculty.id},process.env.JWT_SECRET).toString();
    console.log(token);
    await knex('auth_tokens').insert({username:faculty.username,token,faculty_id:faculty.id})
    return token;
}

async function findByToken(decodedToken,token){
    return await knex('auth_tokens')
    .join(DB_NAME, 'auth_tokens.faculty_id', '=', 'faculties.id')
    .select('faculty_id as id', 'faculties.username','name','email','department')
    .where({'faculty_id':decodedToken.id,'auth_tokens.username':decodedToken.username,'token':token});
}

async function update(faculty,data){
    console.log(faculty);
    return await knex(DB_NAME).where({id:faculty.id}).update(data);
}

async function logout(faculty,token){
    console.log(faculty);
    return await knex('auth_tokens').where({faculty_id:faculty.id,token}).del();
}
module.exports={
    createUser,
    findByUsername,
    generateAuthToken,
    findByToken,
    update,
    logout
}