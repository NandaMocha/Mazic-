//
//  ProfileViewController.swift
//  Mazic!
//
//  Created by Nanda Mochammad on 18/05/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class ProfileViewController: CustomClassSetting {
    
    @IBOutlet weak var greet: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = DataManager.shared.userName
        let highScore = String(DataManager.shared.userHighScore)
        
        greet.text = "\(name)"
        totalScore.text = "Best : \(highScore)"


    }

    @IBAction func logOutButton(_ sender: Any) {
        let alert = UIAlertController(title: "Warning", message: "Are you seure?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Keluar", style: .destructive, handler: { (done) in
            
            DataManager.shared.userBeginLogout()
            print(DataManager.shared.initialized)
            
            self.performSegue(withIdentifier: "unwindToHome", sender: self)
        }))
        alert.addAction(UIAlertAction(title: "Tidak", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
