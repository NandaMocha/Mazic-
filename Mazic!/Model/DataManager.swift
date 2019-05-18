//
//  DataManager.swift
//  Mazic!
//
//  Created by Nanda Mochammad on 18/05/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit
import Firebase

class DataManager{
    
    //Buat Singleton yang akan dipanggi di kelas lain
    static let shared = DataManager()
    
    var initialized: Bool = false
    var userName : String = ""
    var email : String = ""
    var password : String = ""
    var userHighScore : Int = 0
    var allUserPoint : [String] = []
    var authResults : String = ""
    var userHistory : [[String]] = [["qOne", "0"], ["qTwo", "0"], ["qThree", "0"], ["qFour", "0"], ["qFive","0"], ["qSix", "0"], ["qSeven", "0"], ["qEight", "0"], ["qNine", "0"], ["qTen", "0"]]
    
    private init(){}
    
    func saveToUserDefaults() {
        let defaults = UserDefaults.standard
        defaults.set(initialized, forKey:"initialized")
        defaults.set(userName, forKey: "userName")
        defaults.set(email, forKey: "email")
        defaults.set(password, forKey: "password")
        defaults.set(userHighScore, forKey: "userHighScore")
        defaults.set(allUserPoint, forKey: "allUserPoint")
        defaults.synchronize()
    }
    
    func loadFromUserDefaults() {
        let defaults = UserDefaults.standard
        initialized = defaults.bool(forKey: "initialized")
        userName = defaults.string(forKey: "userName") ?? "Me"
        email = defaults.string(forKey: "email") ?? "Me"
        password = defaults.string(forKey: "password") ?? "Me"
        userHighScore = defaults.integer(forKey: "userHighScore")
        if let arrays = defaults.array(forKey: "allUserPoint") {
            allUserPoint = arrays as! [String]
        }
    }
    
    func userBeginRegister() -> Bool{
        var errors = false
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil{
                print("Register Error ",error!)
                errors = true
            }else{
                print(authResult)
                errors = false
                print("Registration Success")
            }
        }
        return errors
    }
    
    func userBeginLogin() -> Bool{
        var errors = false
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error != nil{
                print("Login Error, ",error!)
                errors = true
            }else{
                print(authResult)
                print("Login Success")
                errors = false
            }
        }
        return errors
    }
    
    func updateToFireBase() {
        
    }
    
    func loadFromFirebase() {
        
    }
    
}
