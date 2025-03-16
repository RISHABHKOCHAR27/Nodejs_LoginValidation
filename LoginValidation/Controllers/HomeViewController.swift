//
//  HomeViewController.swift
//  LoginValidation
//
//  Created by nuclei on 15/03/25.
//

import UIKit

class HomeViewController: UIViewController {

    private let label: UILabel = {
       let label = UILabel()
        label.text = "Welcome"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.label.text = "Rishabh Kochar\nrishabhkochar27@gmail.com"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(label)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutBtnTapped))

        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc private func logoutBtnTapped() {
        print("Logout button on Home Screen clicked")
        self.navigationController?.popViewController(animated: true)
    }
}
