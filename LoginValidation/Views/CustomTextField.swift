//
//  CustomTextField.swift
//  LoginValidation
//
//  Created by nuclei on 15/03/25.
//

import UIKit

class CustomTextField: UITextField {

    enum CustomTextFieldType {
        case name
        case email
        case password
    }
    
    private let authFieldType: CustomTextFieldType
    
    init(authFieldType: CustomTextFieldType) {
        self.authFieldType = authFieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        switch authFieldType {
        case .name:
            self.placeholder = "Enter your user name."
        case .email:
            self.placeholder = "Enter your email address."
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password:
            self.placeholder = "Enter your password."
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
