//
//  Rounded.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 13/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func setRounded(){
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
    func littleRound(){
        self.layer.cornerRadius = 20.0
        self.clipsToBounds = true
    }
    
    func littleRoundKevin(){
        self.layer.cornerRadius = 30.0
        self.layer.masksToBounds = true
    }
}

extension UIView {

    func setRoundedView(){
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
    func littleRoundView(){
        self.layer.cornerRadius = 20.0
        self.clipsToBounds = false
    }
    
    func littleRoundCondition(){
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = false
    }
    
    func reallyRound(){
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = false
    }
    
    
}

extension UIButton{
    func littleRoundButton(){
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = false
    }
}
