//
//  JurnalCellDateRow.swift
//  MC2
//
//  Created by Kevin Abram on 15/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class JurnalCellDateRow: UITableViewCell {
    
    @IBOutlet weak var dateTitle: UILabel!
    
    @IBOutlet weak var dateLine: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
