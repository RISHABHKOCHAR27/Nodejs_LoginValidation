import express, { Application, Request, Response, Router, NextFunction} from "express";

const router = express.Router();
const validateUserFields = require("../helpers/validate_helpers").validateUserFields


router.post('/create-account', validateUserFields, (req: Request, res: Response, next) => {
    const { email, username, password }: { email: string; username: string, password: string } = req.body;

    res.status(200).json({ email, username, password });
})

module.exports = router;