//
//  MathViewController.swift
//  Mazic!
//
//  Created by Nanda Mochammad on 18/05/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit
import Firebase

class MathViewController: CustomClassSetting, UITextFieldDelegate {
    
    //Declare the question array
    var questionArray : [[String]] = DataManager.shared.userHistory
    //Declare the answer
    let answerArray : [Int] = [1,2,3,4,5,6,7,8,9,10]
    
    @IBOutlet weak var questionNumber: UILabel!
    
    var questionNow : Int = 0
    var tryAnswer : Int = 1
    
    var count : Int = 0
    
    @IBOutlet weak var questionView: UIImageView!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var answerTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(questionArray)

        checkButton.layer.cornerRadius = (checkButton.frame.height)/2
        checkButton.contentMode = .center
        checkButton.imageView?.contentMode = .scaleAspectFit
        checkButton.setImage(UIImage(named: "checkButtonAll"), for: .normal)
        
        
        showQuestion()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        answerTF.resignFirstResponder()
        return true
    }
    
    //MARK:- Show Question
    func showQuestion() {
        print("Show Question did it")
        for i in 0 ... 9{
            if Int(questionArray[i][1]) == 0{
                print("Cek Question \(questionArray)")
                questionNow = i
                questionNumber.text = "\(i+1)/10"
                questionView.image = UIImage(named: "\(questionArray[i][0])")
                break
            }
        }
    }
    
    //MARK:- Check Button Tapped
    @IBAction func checkButton(_ sender: Any) {
        checkAnswer()
    }
    
    func checkAnswer() {
        if answerTF.text != ""{
            if answerTF.text == String(answerArray[questionNow]){
                switch tryAnswer{
                case 1:
                    questionArray[questionNow][1] = "5"
                    animateWhenTrue(textField: answerTF)
                    print("True \(tryAnswer)")
                case 2:
                    questionArray[questionNow][1] = "4"
                    animateWhenTrue(textField: answerTF)
                    print("True \(tryAnswer)")
                case 3:
                    questionArray[questionNow][1] = "3"
                    animateWhenTrue(textField: answerTF)
                    print("True \(tryAnswer)")
                case 4:
                    questionArray[questionNow][1] = "2"
                    animateWhenTrue(textField: answerTF)
                    print("True \(tryAnswer)")
                default:
                    questionArray[questionNow][1] = "1"
                    animateWhenTrue(textField: answerTF)
                    print("True \(tryAnswer)")
                }
                
            }else{
                tryAnswer += 1
                animateWhenWrong(textField: answerTF)
                answerTF.text = ""
                answerTF.becomeFirstResponder()
            }
        }else{
            animateWhenWrong(textField: answerTF)
            answerTF.becomeFirstResponder()
        }
    }
    
    //MARK:- Add the behaviour
    func animateWhenWrong(textField: UITextField){
        
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
            textField.background = UIImage(named: "answerTFWrong")
            textField.center.x += 5
            
        }) { (done) in
            textField.center.x -= 5
            if self.count < 2{
                self.animateWhenWrong(textField: textField)
                self.count += 1
            } else{
                self.count = 0
                textField.background = UIImage(named: "answerTF")
            }
        }
    }
    
    func animateWhenTrue(textField: UITextField){
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            textField.background = UIImage(named: "answerTFTrue")

        }) { (done) in
            self.answerTF.text = ""
            self.tryAnswer = 1
            self.showQuestion()
            print("Reload True")
            textField.background = UIImage(named: "answerTF")
        }
    }
    
    
    //MARK:- Will Appear/Disappear
    override func viewWillDisappear(_ animated: Bool) {
        DataManager.shared.userHistory = questionArray
        DataManager.shared.saveToUserDefaults()
        print(DataManager.shared.userHistory)
        if DataManager.shared.initialized == true{
            DataManager.shared.updateToFireBase()
        }
    }

    
    
    
}//Class
