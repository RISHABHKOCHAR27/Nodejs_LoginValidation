//
//  AlertManager.swift
//  LoginValidation
//
//  Created by nuclei on 16/03/25.
//

import UIKit

class AlertManager {
    private static func showBasicAlert(on vc: UIViewController, title: String, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            vc.present(alert, animated: true)
        }
    }
}

//MARK: - Validation alerts
extension AlertManager {
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Email", message: "Please enter a valid Email.")
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Password", message: "Please enter a valid Password.")
    }
    
    public static func showInvalidUsernameAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Username", message: "Please enter a valid Username.")
    }
}

//MARK: - Registration alerts
extension AlertManager {
    public static func showRegistrationErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown registration error", message: nil)
    }
    
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Registration error", message: "\(error.localizedDescription)")
    }
}

//MARK: - SignIn alerts
extension AlertManager {
    public static func showSigninErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown error Signing in", message: nil)
    }
    
    public static func showSigninErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error Signing in", message: "\(error.localizedDescription)")
    }
}

//MARK: - Logout alerts
extension AlertManager {
    public static func showLogoutErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown error Loging out", message: nil)
    }
    
    public static func showLogoutErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error Loging out", message: "\(error.localizedDescription)")
    }
}

//MARK: - forgot password alerts
extension AlertManager {
    public static func showPasswordResetSent(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Password Reset sent", message: nil)
    }
    
    public static func showForgotPasswordErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error reset password", message: "\(error.localizedDescription)")
    }
}

//MARK: - Fetching data alerts
extension AlertManager {
    public static func showUnknownFetchingDataAlerts(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Fetching Error", message: nil)
    }
    
    public static func showFetchingDataAlerts(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error Fetching Data", message: "\(error.localizedDescription)")
    }
}
