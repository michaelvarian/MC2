//
//  KesehatanViewController.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 16/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class KesehatanViewController: UIViewController {

    @IBOutlet weak var grafikView: UIView!
    @IBOutlet weak var imunisasiButton: UIButton!
    @IBOutlet weak var catatanKesehatanButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func setView(){
        grafikView.setShadowView()
        grafikView.littleRoundView()
        imunisasiButton.setShadowButton()
        imunisasiButton.littleRoundView()
        catatanKesehatanButton.setShadowButton()
        catatanKesehatanButton.littleRoundView()
    }
}
