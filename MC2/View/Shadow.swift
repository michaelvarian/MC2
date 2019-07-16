//
//  Shadow.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 13/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func setShadowView(){
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 2, height: 15)
        self.layer.shadowRadius = 18
        self.layer.shouldRasterize = true
    }
}

extension UIButton{
    func setShadowButton(){
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 2, height: 10)
        self.layer.shadowRadius = 5
        self.layer.shouldRasterize = true
    }
}
