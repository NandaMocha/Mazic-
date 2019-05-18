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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
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
        performSegue(withIdentifier: "leaderBoard", sender: self)
    }
    
    @IBAction func profileButton(_ sender: Any) {
        performSegue(withIdentifier: "profile", sender: self)
    }
    
}
