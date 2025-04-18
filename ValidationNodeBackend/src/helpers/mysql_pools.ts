import mysql from "mysql";
require("dotenv").config();

const db_config = {
    host: process.env.SQL_HOST,
    user: process.env.SQL_USER,
    password: process.env.SQL_PASSWORD,
    database: process.env.SQL_DATABASE,
    socketPath: process.env.SQL_SOCKET_PATH,
}

const pool = mysql.createPool(db_config);

module.exports = pool;