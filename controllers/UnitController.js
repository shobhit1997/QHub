const UnitManager = require("../modelManagers/UnitManager");
const R = require("ramda");
async function create(req, res) {
    try {
        var unit = await UnitManager.createUnit(req.body);
        if (unit) {
            res.send(unit);
        } else {
            res.status(400).send({ message: "Failed" });
        }
    } catch (e) {
        console.log(e);
        res.sendStatus(500);
    }
}
async function get(req, res) {
    try {
        var unit = await UnitManager.findUnits(
            R.pick(["id", "subject_code", "subject_id"], req.query)
        );
        if (unit) {
            res.send(unit);
        } else {
            res.status(400).send({ message: "Unit Not Found" });
        }
    } catch (e) {
        console.log(e);
        res.sendStatus(500);
    }
}
async function update(req, res) {
    var data = R.pick(["name", "unit_no", "subject_id", "outcome_id"], req.body);
    try {
        var result = await UnitManager.update(req.query.id, data);
        if (result == 1) {
            res.send(await UnitManager.findUnits({ id: req.query.id }));
        } else {
            res.status(400).send({ message: "Update Failed" });
        }
    } catch (e) {
        console.log(e);
        res.sendStatus(500);
    }
}
module.exports = {
    create,
    get,
    update,
};