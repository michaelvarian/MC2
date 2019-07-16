//
//  AktivitasTableViewCell.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 16/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class AktivitasTableViewCell: UITableViewCell {

    
    @IBOutlet weak var deskripsiAktivitasView: UIView!
    @IBOutlet weak var aktivitasImage: UIImageView!
    @IBOutlet weak var kategoriLabel: UILabel!
    @IBOutlet weak var judulAktivitasLabel: UILabel!
    @IBOutlet weak var deskripsiAktivitasLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
