const R = require("ramda");
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
    var units = await Unit.findUnits(searchData);
    if (units) {
        return units.map((unit) => {
            unit.k_level = R.split(",", unit.k_level);
            unit.k_level = unit.k_level.map((level) => {
                return parseInt(level);
            });
            return unit;
        });
    } else {
        return null;
    }
}
module.exports = {
    createUnit,
    findUnits,
    update: Unit.update,
};