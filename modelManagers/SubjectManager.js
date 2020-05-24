const Subject = require("../models/Subject");
async function createSubject(data) {
    console.log(data);
    var subject = await Subject.createSubject(data);
    if (subject && subject.length > 0) {
        return subject[0];
    }
    return null;
}
async function findSubject(searchData) {
    var subject = await Subject.findSubject(searchData);
    if (subject && subject.length > 0) {
        return subject;
    } else {
        return null;
    }
}
module.exports = {
    createSubject,
    findSubject,
    update: Subject.update,
    getCourseOutcomes: Subject.getCourseOutcomes,
    addCourseOutcomes: Subject.addCourseOutcomes,
};