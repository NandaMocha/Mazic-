//
//  LeaderBoardViewController.swift
//  Mazic!
//
//  Created by Nanda Mochammad on 18/05/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class LeaderBoardViewController: CustomClassSetting {
    @IBOutlet weak var nameOne: UILabel!
    @IBOutlet weak var nameTwo: UILabel!
    
    @IBOutlet weak var nameThree: UILabel!
    @IBOutlet weak var scoreOne: UILabel!
    @IBOutlet weak var scoreTwo: UILabel!
    @IBOutlet weak var scoreThree: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        DataManager.shared.retrieveFromFirebase()
    }

}
