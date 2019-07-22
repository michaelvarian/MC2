//
//  DetailImunisasiViewController.swift
//  MC2
//
//  Created by Kevin Abram on 22/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class DetailImunisasiViewController: UIViewController {

    @IBOutlet weak var catatImunisasiButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catatImunisasiButton.setShadowAndRound()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
