//
//  RegisterViewController.swift
//  LoginValidation
//
//  Created by nuclei on 15/03/25.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let headerView = AuthHeaderView(title: "Sign Up", subTitle: "Create your account.")
    private let usernameField = CustomTextField(authFieldType: .name)
    private let emailField = CustomTextField(authFieldType: .email)
    private let passwordField = CustomTextField(authFieldType: .password)
    
    
    private let signinButton = CustomButton(title: "Already have an account? Sign In.", hasBackground: false, fontSize: .mid)
    private let signupButton = CustomButton(title: "Sign Up", hasBackground: true, fontSize: .big)
    
    private let termsTextView: UITextView = {
        let attributedString = NSMutableAttributedString(string: "By creating an account, you agree to our Terms & Conditions and acknowledge our Privacy Policy.")
        attributedString.addAttribute(.link, value: "terms://term", range: (attributedString.string as NSString).range(of: "Terms & Conditions"))
        attributedString.addAttribute(.link, value: "privacy://privacyPolicy", range: (attributedString.string as NSString).range(of: "Privacy Policy"))
        let tv = UITextView()
        tv.linkTextAttributes = [.foregroundColor : UIColor.systemBlue]
        tv.backgroundColor = .clear
        tv.attributedText = attributedString
        tv.textColor = .label
        tv.isSelectable = true
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.delaysContentTouches = false
        tv.textAlignment = .center
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.termsTextView.delegate = self
        self.signinButton.addTarget(self, action: #selector(signinButtonTapped), for: .touchUpInside)
        self.signupButton.addTarget(self, action: #selector(signupButtontapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signupButton)
        self.view.addSubview(termsTextView)
        self.view.addSubview(signinButton)
        
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        termsTextView.translatesAutoresizingMaskIntoConstraints = false
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            self.emailField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 16),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            self.passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            self.signupButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            self.signupButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signupButton.heightAnchor.constraint(equalToConstant: 55),
            self.signupButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            self.termsTextView.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: 6),
            self.termsTextView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.termsTextView.heightAnchor.constraint(equalToConstant: 44),
            self.termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            
            self.signinButton.topAnchor.constraint(equalTo: termsTextView.bottomAnchor, constant: 12),
            self.signinButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signinButton.heightAnchor.constraint(equalToConstant: 44),
            self.signinButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        ])
    }
    
    @objc private func signinButtonTapped() {
        print("sign in clicked register c")
        self.navigationController?.popToRootViewController(animated: true)
        if let navController = self.navigationController {
                print("Navigation controller exists")
                navController.popToRootViewController(animated: true)
            } else {
                print("No navigation controller found")
            }
    }
    
    @objc private func signupButtontapped() {
        print("Signup clicked")
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

extension RegisterViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        if URL.scheme == "terms" {
            print("Terms of Service tapped")
            self.showWebViewController(with: "https://policies.google.com/terms?hl=en-US")
            return false
        } else if URL.scheme == "privacy" {
            print("Privacy Policy tapped")
            self.showWebViewController(with: "https://policies.google.com/privacy?hl=en-US")
            return false
        }
        return true
    }
    
    private func showWebViewController(with urlString: String) {
        let vc = WebViewController(from: urlString)
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
}
