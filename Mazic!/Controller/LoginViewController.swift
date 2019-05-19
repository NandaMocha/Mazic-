//
//  LoginViewController.swift
//  Mazic!
//
//  Created by Nanda Mochammad on 18/05/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: CustomClassSetting, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTF.layer.cornerRadius = (usernameTF.frame.height)/2
        usernameTF.layer.borderColor = UIColor.white.cgColor
        usernameTF.layer.borderWidth = 2
        
        emailTF.layer.cornerRadius = (emailTF.frame.height)/2
        emailTF.layer.borderColor = UIColor.white.cgColor
        emailTF.layer.borderWidth = 2
        
        passwordTF.layer.cornerRadius = (passwordTF.frame.height)/2
        passwordTF.layer.borderColor = UIColor.white.cgColor
        passwordTF.layer.borderWidth = 2
        
        loginButton.layer.cornerRadius = (passwordTF.frame.height)/2
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.borderWidth = 2
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTF{
            if textField.text == ""{
                animateWhenNil(textField: usernameTF)
            }else{
                emailTF.becomeFirstResponder()
            }
        }else if textField == emailTF{
            if textField.text == ""{
                animateWhenNil(textField: emailTF)
            }else{
                passwordTF.becomeFirstResponder()
            }
        }else{
            if textField.text == ""{
                animateWhenNil(textField: passwordTF)
            }
            else{
                passwordTF.resignFirstResponder()
            }
        }
        return true
    }
    
    func animateWhenNil(textField: UITextField){
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.center.x += 5

        }) { (done) in
            textField.center.x -= 5
            if self.count < 2{
                self.animateWhenNil(textField: textField)
                self.count += 1
            } else{
                self.count = 0
                textField.layer.borderColor = UIColor.white.cgColor
            }
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        //Cek Kondisi apakah ada field yang kosong
        if emailTF.text == "" || passwordTF.text == "" || usernameTF.text == ""{
            let alert = UIAlertController(title: "Peringatan", message: "Mohon Lengkapi Data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            animateWhenNil(textField: usernameTF)
            animateWhenNil(textField: emailTF)
            animateWhenNil(textField: passwordTF)
            
        }else{
            //Jika tidak ada field yang kosong maka akan menyimpan nilai email n apssword
            DataManager.shared.email = emailTF.text!
            DataManager.shared.password = passwordTF.text!
            
            //Jika register sukses lansgung menjalankan fingsi login
            if DataManager.shared.userBeginRegister() == false{
                
                if DataManager.shared.userBeginLogin() == false{
                    
                    //Menyimpan nilai init dan username
                    DataManager.shared.initialized = true
                    DataManager.shared.userName = usernameTF.text!
                    
                    //Menyimpan data k User Defaults
                    DataManager.shared.saveToUserDefaults()
                }
            //Jika gagal register berarti kemungkinan email sudah terdaftar, dan akan diarahkan langsung ke Login
            }else{
                if DataManager.shared.userBeginLogin() == false{
                    //menyimpan nilai init dan username
                    DataManager.shared.initialized = true
                    DataManager.shared.userName = usernameTF.text!
                    
                    //Menyimpan data k User Defaults
                    DataManager.shared.saveToUserDefaults()
                    
                //Jika gagal login kemungkinan password salah
                }else{
                    let alert = UIAlertController(title: "Peringatan", message: "Login gagal, periksa password anda", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
            
        }
        
    }
    

}
