const mysql = require("mysql2/promise");

const mySqlPool = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "Global@123",
    database: "mess_management_system",
});

module.exports = mySqlPool;

