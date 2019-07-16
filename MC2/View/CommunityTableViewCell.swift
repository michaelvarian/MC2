//
//  CommunityTableViewCell.swift
//  MC2
//
//  Created by Beny Untoro on 15/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class CommunityTableViewCell: UITableViewCell {

    @IBOutlet weak var imgCommunity: UIImageView!
    @IBOutlet weak var lblCommunityName: UILabel!
    @IBOutlet weak var lblCommunityDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

