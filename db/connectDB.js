require("dotenv").config({ path: "./.env" });
console.log(process.env.MYSQL_USER);
var knex = require("knex")({
    client: "mysql",
    connection: {
        host: "127.0.0.1",
        user: process.env.MYSQL_USER,
        password: process.env.MYSQL_PASSWORD,
        database: process.env.MYSQL_DB,
        multiStatements: true,
    },
});
module.exports = knex;