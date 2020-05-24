const knex = require("../db/connectDB");
const jwt = require("jsonwebtoken");
require("dotenv").config({ path: "./.env" });
const R = require("ramda");
const DB_NAME = "subjects";

async function createSubject(subjectData) {
    await knex(DB_NAME).insert(subjectData);
    return findSubject({ subject_code: subjectData.subject_code });
}

function findSubject(searchData) {
    console.log(searchData);
    return knex(DB_NAME).select("id", "name", "subject_code").where(searchData);
}
async function update(subjectId, data) {
    return await knex(DB_NAME).where({ id: subjectId }).update(data);
}
async function addCourseOutcomes(data, k_levels) {
    console.log(k_levels);
    let ids = await knex("course_outcomes").insert(data);
    for (i = 1; i < data.length; i++) {
        ids.push(ids[0] + i);
    }
    let k_mapping = ids.reduce((arr, val, i) => {
        console.log(i);
        arr1 = k_levels[i].map((val1) => {
            return {
                outcome_id: val,
                k_id: val1,
            };
        });
        return [...arr, ...arr1];
    }, []);
    console.log(k_mapping);
    return knex("c_outcome_k_level_mapping").insert(k_mapping);
}

function getCourseOutcomes(subjectId) {
    return knex("course_outcomes as c")
        .join(
            knex("c_outcome_k_level_mapping as m")
            .join("knowledge_levels as k", "m.k_id", "=", "k.id")
            .select("m.outcome_id")
            .select(knex.raw("group_concat(k.name) as k_level"))
            .groupBy("m.outcome_id")
            .as("x"),
            "c.id",
            "=",
            "x.outcome_id"
        )
        .where({ subject_id: subjectId });
}
module.exports = {
    createSubject,
    findSubject,
    update,
    addCourseOutcomes,
    getCourseOutcomes,
};