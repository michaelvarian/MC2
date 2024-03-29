//
//  JurnalDescriptionViewController.swift
//  MC2
//
//  Created by Kevin Abram on 19/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class JurnalDescriptionViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor = .lightGray
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func closeButtonClicked(_ sender: UIButton) {
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
