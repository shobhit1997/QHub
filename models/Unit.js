const knex = require("../db/connectDB");

const DB_NAME = "units";

async function createUnit(unitData) {
    await knex(DB_NAME).insert(unitData);
    return findUnits({ subject_id: unitData.subject_id });
}

function findUnits(searchData) {
    console.log(searchData);
    if (searchData.id) {
        searchData["units.id"] = searchData.id;
        delete searchData.id;
    }
    if (searchData.subject_id) {
        searchData["units.subject_id"] = searchData.subject_id;
        delete searchData.subject_id;
    }
    return knex(DB_NAME)
        .join("subjects", "units.subject_id", "=", "subjects.id")
        .join("course_outcomes as c", "c.id", "=", "units.outcome_id")
        .join(
            knex("c_outcome_k_level_mapping as m")
            .join("knowledge_levels as k", "m.k_id", "=", "k.id")
            .select("m.outcome_id")
            .select(knex.raw("Group_Concat(k.id) as k_level"))
            .groupBy("m.outcome_id")
            .as("x"),
            "c.id",
            "=",
            "x.outcome_id"
        )
        .select(
            "units.id",
            "units.name",
            "subject_code",
            "subjects.name as subject_name",
            "units.outcome_id",
            "unit_no",
            "k_level"
        )
        .where(searchData);
}
async function update(unitId, data) {
    return await knex(DB_NAME).where({ id: unitId }).update(data);
}
module.exports = {
    createUnit,
    findUnits,
    update,
};