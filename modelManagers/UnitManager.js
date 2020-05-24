const Unit = require("../models/Unit");
async function createUnit(data) {
    console.log(data);
    var unit = await Unit.createUnit(data);
    if (unit) {
        return unit;
    }
    return null;
}
async function findUnits(searchData) {
    var unit = await Unit.findUnits(searchData);
    if (unit) {
        return unit;
    } else {
        return null;
    }
}
module.exports = {
    createUnit,
    findUnits,
    update: Unit.update,
};