//
//  HomeViewController.swift
//  Mazic!
//
//  Created by Nanda Mochammad on 18/05/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import UIKit
import ChameleonFramework

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let color = [UIColor.red, UIColor.black]
        view.backgroundColor = UIColor(gradientStyle:UIGradientStyle.topToBottom, withFrame:view!.frame, andColors: color)

    }
    @IBAction func playMaze(_ sender: Any) {
        performSegue(withIdentifier: "letsPlay", sender: self)
    }
    
    @IBAction func leaderBoard(_ sender: Any) {
        performSegue(withIdentifier: "leaderBoard", sender: self)
    }
}
