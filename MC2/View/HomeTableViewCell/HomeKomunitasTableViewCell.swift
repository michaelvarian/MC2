//
//  HomeKomunitasTableViewCell.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 19/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class HomeKomunitasTableViewCell: UITableViewCell {

    @IBOutlet weak var imageKomunitas: UIImageView!
    @IBOutlet weak var namaKomunitas: UILabel!
    @IBOutlet weak var deskripsiKomunitas: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
