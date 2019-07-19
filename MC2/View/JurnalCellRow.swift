//
//  JurnalCellRow.swift
//  MC2
//
//  Created by Kevin Abram on 14/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class JurnalCellRow: UITableViewCell {

    @IBOutlet weak var jurnalTitle: UILabel!
    
    @IBOutlet weak var jurnalCircle: UIView!
    
    @IBOutlet weak var jurnalDesc: UITextView!
    
    @IBOutlet weak var jurnalClick: JurnalButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
