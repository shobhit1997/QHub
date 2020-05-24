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
    var subjects = await Subject.findSubject(searchData);
    if (subjects && subjects.length > 0) {
        subjects = await Promise.all(
            subjects.map((subject) => {
                return Subject.getCourseOutcomes(subject.id).then((outcomes) => {
                    if (outcomes && outcomes.length > 0) {
                        subject.outcomes_added = true;
                    } else {
                        subject.outcomes_added = false;
                    }
                    return subject;
                });
            })
        );
        return subjects;
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