//
//  LoginView.swift
//  TestTaskMobileUp
//
//  Created by Кирилл Демьянцев on 26.04.2023.
//

import UIKit

class LoginView: UIView {
    
    private var authService: AuthService!
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Mobile Up Gallery"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        return label
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Вход через VK", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        button.layer.cornerRadius = 8
        return button
    }()
    
    @objc func logIn() {
        authService.wakeUpSession()
    }
    init(){
        super.init(frame: .zero)
        authService = SceneDelegate.shared().authService
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        self.addSubview(titleLabel)
        self.addSubview(logInButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -48),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 164),
            
            logInButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logInButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -48),
            logInButton.heightAnchor.constraint(equalToConstant: 56),
            logInButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50)
        ])
    }
}
