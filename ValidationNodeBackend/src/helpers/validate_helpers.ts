import { Request, Response, NextFunction } from "express";
import { body, validationResult , ValidationChain } from "express-validator";

const emailValidation = (): ValidationChain => {
    return body("email")
        .exists()
        .withMessage("You must provide a valid email")
        .isEmail()
        .normalizeEmail()
        .withMessage("You must provide a valid email address")
};

const usernameValidation = (): ValidationChain => {
    return body("username")
        .exists()
        .withMessage("You must provide a valid username.")
        .isLength({min: 4})
        .withMessage("Username must be at least 4 characters")
        .trim()
        .escape()
};

const passwordValidation = (): ValidationChain => {
    return body("password")
        .exists()
        .withMessage("You must provide a password")
        .isLength({min: 6})
        .withMessage("Password must be at least 6 characters")
        .isLength({max: 15})
        .withMessage("Password must be at most 15 characters")
        .trim()
        .escape()
};

const validateUserFields = async (req: Request, res: Response, next: NextFunction) => {
    const validations: ValidationChain[] = [
        emailValidation(),
        usernameValidation(),
        passwordValidation(),
    ]

    for (let validation of validations) {
        const result = await validation.run(req);
        // @ts-ignore
        if (result.errors.length) break;
    }

    const errors = validationResult(req);
    if (errors.isEmpty()) {
        return next()
    }
    res.status(500).json({errors: errors.array()[0].msg})
}

module.exports = {
    validateUserFields: validateUserFields
}