//
//  LoginViewController.swift
//  LoginValidation
//
//  Created by nuclei on 15/03/25.
//

import UIKit

class LoginViewController: UIViewController {

    private let headerView = AuthHeaderView(title: "Sign In", subTitle: "Sign in to your account.")
    private let emailField = CustomTextField(authFieldType: .email)
    private let passwordField = CustomTextField(authFieldType: .password)
    private let signinButton = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
    private let newUserButton = CustomButton(title: "New User? Create an Account", hasBackground: false, fontSize: .mid)
    private let forgotPasswordButton = CustomButton(title: "Forgot Password", hasBackground: false, fontSize: .small)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.signinButton.addTarget(self, action: #selector(signinButtonTapped), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector(newUserButtonTapped), for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(headerView)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signinButton)
        self.view.addSubview(newUserButton)
        self.view.addSubview(forgotPasswordButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            self.emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            self.passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            self.signinButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            self.signinButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signinButton.heightAnchor.constraint(equalToConstant: 50),
            self.signinButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            self.newUserButton.topAnchor.constraint(equalTo: signinButton.bottomAnchor, constant: 12),
            self.newUserButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.newUserButton.heightAnchor.constraint(equalToConstant: 44),
            self.newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: newUserButton.bottomAnchor, constant: 6),
            self.forgotPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 44),
            self.forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        ])
    }
    
    @objc private func signinButtonTapped() {
        print("sign in clicked")
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func newUserButtonTapped() {
        print("new user clicked")
        let vc = RegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func forgotPasswordButtonTapped() {
        print("forgot pass clicked")
        let vc = ForgotPasswordViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
