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
        totalScore.text = "High Score : \(highScore)"


    }

    @IBAction func logOutButton(_ sender: Any) {
        let alert = UIAlertController(title: "Peringatan", message: "Apakah anda yakin untuk Keluar?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tidak", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Keluar", style: .destructive, handler: { (done) in
            DataManager.shared.userBeginLogout()
            print(DataManager.shared.initialized)
            self.performSegue(withIdentifier: "unwindToHome", sender: self)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
