//
//  HomeAktivitasTableViewCell.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 18/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class HomeAktivitasTableViewCell: UITableViewCell {

    @IBOutlet weak var imageAktivitas: UIImageView!
    @IBOutlet weak var titleAktivitas: UILabel!
    @IBOutlet weak var deskripsiAktivitas: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
