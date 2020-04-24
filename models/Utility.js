const knex=require('../db/connectDB');
const jwt = require('jsonwebtoken')
require('dotenv').config({ path: './.env' });

const DB_NAME = 'images';

function storeImages(imageData){
    return knex(DB_NAME).insert(imageData);
}
function findImages(faculty_id){
    return knex(DB_NAME).where({faculty_id});
}
module.exports={
    storeImages,
    findImages
}