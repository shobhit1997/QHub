const knex=require('../db/connectDB');

const DB_NAME = 'units';

async function createUnit(unitData){
    await knex(DB_NAME).insert(unitData);
    return findUnits({subject_id:unitData.subject_id});
}
function findUnits(searchData){
    console.log(searchData);
    if(searchData.id){
        searchData['units.id']=searchData.id;
        delete searchData.id;
    }
    return knex(DB_NAME)
            .join("subjects","units.subject_id",'=',"subjects.id")
            .select('units.id','units.name','subject_code','subjects.name as subject_name','outcome_id','unit_no')
            .where(searchData);
}
async function update(unitId,data){
    return await knex(DB_NAME).where({id:unitId}).update(data);
}
module.exports={
    createUnit,
    findUnits,
    update
}