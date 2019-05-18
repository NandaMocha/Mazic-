//
//  LoginViewController.swift
//  Mazic!
//
//  Created by Nanda Mochammad on 18/05/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class LoginViewController: CustomClassSetting {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTF.layer.cornerRadius = (emailTF.frame.height)/2
        emailTF.layer.borderColor = UIColor.white.cgColor
        emailTF.layer.borderWidth = 2
        
        passwordTF.layer.cornerRadius = (passwordTF.frame.height)/2
        passwordTF.layer.borderColor = UIColor.white.cgColor
        passwordTF.layer.borderWidth = 2
    }

}
