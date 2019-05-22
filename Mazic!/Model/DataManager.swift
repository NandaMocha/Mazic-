//
//  DataManager.swift
//  Mazic!
//
//  Created by Nanda Mochammad on 18/05/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class DataManager{
    
    //Buat Singleton yang akan dipanggi di kelas lain
    static let shared = DataManager()
    
    var initialized: Bool = false
    var userName : String = ""
    var email : String = ""
    var password : String = ""
    var userHighScore : Int = 0
    var authResults : String = ""
    var userHistory : [[String]] = [["qOne", "0"], ["qTwo", "0"], ["qThree", "0"], ["qFour", "0"], ["qFive","0"], ["qSix", "0"], ["qSeven", "0"], ["qEight", "0"], ["qNine", "0"], ["qTen", "0"]]
    var arrayOfPlayer = ["",""]
    var arrayOfScore = ["",""]
    var data:[Ranking] = []
    
    
    private init(){}
    
    func saveToUserDefaults() {
        let defaults = UserDefaults.standard
        defaults.set(initialized, forKey:"initialized")
        defaults.set(userName, forKey: "userName")
        defaults.set(email, forKey: "email")
        defaults.set(password, forKey: "password")
        defaults.set(userHighScore, forKey: "userHighScore")
        defaults.set(userHistory, forKey: "userHistory")
        defaults.set(arrayOfPlayer, forKey: "arrayOfPlayer")
        defaults.set(arrayOfScore, forKey: "arrayOfScore")
        defaults.synchronize()
        print("saveToUserDefault Did It!")
    }
    
    func loadFromUserDefaults() {
        let defaults = UserDefaults.standard
        initialized = defaults.bool(forKey: "initialized")
        userName = defaults.string(forKey: "userName") ?? "Me"
        email = defaults.string(forKey: "email") ?? "Me"
        password = defaults.string(forKey: "password") ?? "Me"
        userHighScore = defaults.integer(forKey: "userHighScore")
        if let arrays = defaults.array(forKey: "userHistory") {
            userHistory = arrays as! [[String]]
        }
        if let arrays = defaults.array(forKey: "arrayOfScore"){
            arrayOfScore = arrays as! [String]
        }
        if let arrays = defaults.array(forKey: "arrayOfPlayer"){
            arrayOfPlayer = arrays as! [String]
        }
        print("loadFromUserDefault Did It!")
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
                print("userBeginRegister Did It! -> Registration Success")
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
                print("userBeginLogin Did It! -> Login Success")
                errors = false
            }
        }
        return errors
    }
    
    func userBeginLogout(){
        initialized = false
        userName = ""
        email = ""
        password = ""
        userHighScore = 0
        authResults = ""
        userHistory = [["qOne", "0"], ["qTwo", "0"], ["qThree", "0"], ["qFour", "0"], ["qFive","0"], ["qSix", "0"], ["qSeven", "0"], ["qEight", "0"], ["qNine", "0"], ["qTen", "0"]]
        arrayOfPlayer = [String]()
        arrayOfScore = [String]()
        saveToUserDefaults()
        print("userBeginLogout Did It!")
    }
    
    func updateToFireBase(){
        var totalScore = 0
        
        //Method to count totalScore
        for i in 0 ... 9{
            totalScore += Int(userHistory[i][1]) ?? 0
        }
        
        //Define DB in Firebase
        let LeaderboardDB = Database.database().reference().child("Leaderboard")
        //Set the data
        print(userName, " - ", totalScore)
        let LeaderboardData = ["Username": userName, "TotalScore": String(totalScore)]
            
        //Add Condition if already logged in will run "update" method
        if initialized{
            LeaderboardDB.child(userName).updateChildValues(LeaderboardData)
            print("updateToFirebase Did It!")
                
            //if didn't logged in will run create data
        }else{
            LeaderboardDB.childByAutoId().setValue(LeaderboardData){
                (error, reference) in
                if let errorGet = error{
                    print(errorGet)
                }else{
                    print("updateToFirebase Did It!")
                }
            }
        }
        
        

    }
    
//    func retrieveFromFirebase() {
//        let LeaderboardDB = Database.database().reference().child("Leaderboard")
//        var username = ""
//        var totalscore = ""
////        print("Cek retrieve")
//        //Closure
//        LeaderboardDB.observe(.value) { (snapshot) in
//            if let snapshot = snapshot.children.allObjects as? [DataSnapshot]{
//                self.arrayOfPlayer.removeAll()
//                self.arrayOfScore.removeAll()
//                for snap in snapshot{
//                    if let userData = snap.value as? Dictionary<String, String>{
//                        totalscore = userData["TotalScore"] ?? ""
//                        username = userData["Username"] ?? ""
//
//                        self.arrayOfPlayer.append(username)
//                        self.arrayOfScore.append((totalscore))
//
////                        print("ArrayOfPlayer, ",self.arrayOfPlayer)
//                        self.saveToUserDefaults()
//                    }
//                }
//            }
//        }
//    }
    
    func retrieveDataFromFirebase(completion: @escaping ([Ranking]) -> Void) {
        let LeaderboardDB = Database.database().reference().child("Leaderboard")
        var username = ""
        var totalscore = ""
        print("Cek retrieve")
        //Closure
        LeaderboardDB.observe(.value) { (snapshot) in
            //            print("Data Snapshot, ", snapshot)
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot]{
                self.arrayOfPlayer.removeAll()
                self.arrayOfScore.removeAll()
                for snap in snapshot{
                    if let userData = snap.value as? Dictionary<String, String>{
                        totalscore = userData["TotalScore"] ?? ""
                        username = userData["Username"] ?? ""
                        
                        self.arrayOfPlayer.append(username)
                        self.arrayOfScore.append((totalscore))
                        
                        print("ArrayOfPlayer, ",self.arrayOfPlayer)
                        self.saveToUserDefaults()
                        let rank = Ranking.init(name: username, point: Int(totalscore)!)
                        self.data.append(rank)
                    }
                }
            }
            completion(self.data)
        }
    }
    
}
