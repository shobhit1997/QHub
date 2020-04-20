const knex=require('../db/connectDB');
const jwt = require('jsonwebtoken')
require('dotenv').config({ path: './.env' });

const DB_NAME = 'subjects';

async function createSubject(subjectData){
    await knex(DB_NAME).insert(subjectData);
    return findSubject({subject_code:subjectData.subject_code})
}
function findSubject(searchData){
    console.log(searchData);
    return knex(DB_NAME).select('id','name','subject_code').where(searchData);
}
async function update(subjectId,data){
    return await knex(DB_NAME).where({id:subjectId}).update(data);
}
module.exports={
    createSubject,
    findSubject,
    update
}