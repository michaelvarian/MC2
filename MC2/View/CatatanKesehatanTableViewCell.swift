//
//  CatatanKesehatanTableViewCell.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 16/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class CatatanKesehatanTableViewCell: UITableViewCell {

    @IBOutlet weak var catatanView: UIView!
    @IBOutlet weak var catatanLokasi: UILabel!
    @IBOutlet weak var catatanImage: UIImageView!
    @IBOutlet weak var catatanDate: UILabel!
    @IBOutlet weak var catatanTitle: UILabel!
    @IBOutlet weak var catatanDeskripsi: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
