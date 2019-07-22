//
//  DetailCatatanKesehatanViewController.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 17/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class DetailCatatanKesehatanViewController: UIViewController {

    // Variables
    var objCatatanKesehatan: dataKesehatan!
    
    @IBOutlet weak var imageCatatan: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var catatanLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        sendData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func closeTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func setView(){
        imageCatatan.littleRound()
        imageCatatan.setShadowView()
        closeButton.setRoundedView()
        closeButton.setShadowButton()
    }
    
    func sendData(){
        imageCatatan.image = objCatatanKesehatan.fotoKesehatan
        dateLabel.text = objCatatanKesehatan.tanggalPengobatan
        titleLabel.text = objCatatanKesehatan.pengobatan
        catatanLabel.text = objCatatanKesehatan.catatan
    }

}
