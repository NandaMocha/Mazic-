//
//  MathViewController.swift
//  Mazic!
//
//  Created by Nanda Mochammad on 18/05/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit

class MathViewController: CustomClassSetting {
    
    //Declare the question array
    let question : [[String]] = DataManager.shared.userHistory
    let answer : [Int] = [1,2,3,4,5,6,7,8,9,10]

    var questionNow : String?
    
    @IBOutlet weak var questionView: UIImageView!
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
        
        showQuestion()
        
    }
    
    func showQuestion() {
        for i in 0 ... 9{
            if Int(question[i][1]) == 0{
                questionNow = question[i][0]
                questionView.image = UIImage(named: "\(question[i][0])")
            }
            break
        }
    }
    
    func checkAnswer() {
        
    }
    

}
