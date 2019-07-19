//
//  JurnalButton.swift
//  MC2
//
//  Created by Kevin Abram on 19/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class JurnalButton: UIButton {
    var sectionIndex: Int
    var rowIndex: Int
    
    required init?(coder aDecoder: NSCoder) {
        //This section index is to get the section of the button touched for the journal
        self.sectionIndex = 0
        
        //This row index is to get the row of the button touched for the journal
        self.rowIndex = 0
        
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
