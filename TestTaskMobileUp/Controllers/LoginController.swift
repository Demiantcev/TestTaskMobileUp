//
//  LoginController.swift
//  TestTaskMobileUp
//
//  Created by Кирилл Демьянцев on 24.04.2023.
//

import UIKit
import VK_ios_sdk

class LoginController: UIViewController {
    
    override func loadView() {
        view = LoginView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
    }
}
