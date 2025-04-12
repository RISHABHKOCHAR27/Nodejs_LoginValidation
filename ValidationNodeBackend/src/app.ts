import express, { Application, Request, Response, Router, NextFunction} from "express";

const app = express();
const cookieParser = require("cookie-parser");

app.use(express.json());
app.use(cookieParser());


app.get("/", async (req: Request, res: Response) => {
    res.status(200).json({success: 'Yooooooo Server'});
})

/// to check SQL is working:
// const connection = require("./helpers/mysql_pools");
//
// app.get("/getData", async (req: Request, res: Response) => {
//     const query = 'SELECT * FROM Data';
//     connection.query(query, (err: any, results: any) => {
//         if (err) {
//             res.status(500).json({success: false, error: err}); return
//         } else if (results) {
//             res.status(200).json({success: results}); return
//         }
//     });
// })

module.exports = app;
