//
//  DetailTahapanTableViewCell.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 14/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class DetailTahapanTableViewCell: UITableViewCell {

    
    @IBOutlet weak var outerTahapanView: UIView!
    @IBOutlet weak var checkBoxTahapan: UIButton!
    @IBOutlet weak var deskripsiTahapanLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
