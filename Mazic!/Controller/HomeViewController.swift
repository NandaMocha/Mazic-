//
//  HomeViewController.swift
//  Mazic!
//
//  Created by Nanda Mochammad on 18/05/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class HomeViewController: CustomClassSetting {

    @IBOutlet weak var profile: UIButton!
    
    var target : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        DataManager.shared.retrieveFromFirebase()
        DataManager.shared.loadFromUserDefaults()
        DataManager.shared.retrieveDataFromFirebase { (data) in
            let result = data.sorted(by: { $0.point > $1.point })
            DataManager.shared.data = result
            print(result)
//            let rank = result[0]
//            print(rank.name)
        }
        DataManager.shared.saveToUserDefaults()

    }
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    @IBAction func playMaze(_ sender: Any) {
        performSegue(withIdentifier: "letsPlay", sender: self)
    }
    
    @IBAction func leaderBoard(_ sender: Any) {
        target = "LeaderBoard"
        if DataManager.shared.initialized == true{
            performSegue(withIdentifier: "keLeaderBoardLangsung", sender: self)
        }else{
            performSegue(withIdentifier: "loginDulu", sender: self)
        }
    }
    
    @IBAction func profileButton(_ sender: Any) {
        target = "Profil"
        if DataManager.shared.initialized == true{
            performSegue(withIdentifier: "keProfileLangsung", sender: self)
        }else{
            performSegue(withIdentifier: "loginDulu", sender: self)
        }
    }
    
}
