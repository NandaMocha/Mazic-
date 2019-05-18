//
//  customClassSetting.swift
//  Mazic!
//
//  Created by Nanda Mochammad on 18/05/19.
//  Copyright © 2019 nandamochammad. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

class CustomClassSetting: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color = [UIColor.flatOrange, UIColor.flatYellow]
        view?.backgroundColor = UIColor(gradientStyle:UIGradientStyle.topToBottom, withFrame:view!.frame, andColors: color)
        
        guard let navBar = navigationController?.navigationBar else{ fatalError("Nav Controller does not exist") }
        
        
        navBar.barTintColor = color[0]
        
        navBar.tintColor = ContrastColorOf(color[0], returnFlat: true)
        
        navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : ContrastColorOf(color[0], returnFlat: true)]
        
        navBar.backItem?.title = " "

        
        
    }
    
    
}

