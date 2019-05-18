//
//  MathViewController.swift
//  Mazic!
//
//  Created by Nanda Mochammad on 18/05/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class MathViewController: CustomClassSetting {
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var answerTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checkButton.layer.cornerRadius = (checkButton.frame.height)/2
        checkButton.layer.borderColor = UIColor.white.cgColor
        checkButton.layer.borderWidth = 2
        
        answerTF.layer.cornerRadius = (answerTF.frame.height)/2
        answerTF.layer.borderColor = UIColor.white.cgColor
        answerTF.layer.borderWidth = 2
    }
    

}
