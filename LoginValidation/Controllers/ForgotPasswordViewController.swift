//
//  ForgotPasswordViewController.swift
//  LoginValidation
//
//  Created by nuclei on 15/03/25.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    private let headerView = AuthHeaderView(title: "Forgot Password?", subTitle: "Reset your password.")
    private let emailField = CustomTextField(authFieldType: .email)
    private let resetPasswordBtn = CustomButton(title: "Sign Up", hasBackground: true, fontSize: .big)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.resetPasswordBtn.addTarget(self, action: #selector(resetPasswordBtnTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(headerView)
        self.view.addSubview(emailField)
        self.view.addSubview(resetPasswordBtn)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            self.emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            self.resetPasswordBtn.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            self.resetPasswordBtn.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.resetPasswordBtn.heightAnchor.constraint(equalToConstant: 44),
            self.resetPasswordBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        ])
    }
    
    @objc private func resetPasswordBtnTapped() {
        print("Reset password CTA clicked")
        guard let email = self.emailField.text, !email.isEmpty else { return } //todo: - email validation
    }

}
