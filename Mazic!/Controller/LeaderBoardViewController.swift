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
    
    var arrayOfPlayer = Array<String>()
    var arrayOfScore = Array<Int>()
    var tempArray = Array<Int>()
    var tempHigh = 0
    var tempB = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bestPlayer()
        
    }
    
    //Method for counting the best score
    func bestPlayer(){
        let dataUser = DataManager.shared.data
        nameOne.text = dataUser[0].name
        nameTwo.text = dataUser[1].name
        nameThree.text = dataUser[2].name
    }

}

struct Ranking {
    var name:String?
    var point:Int
}
