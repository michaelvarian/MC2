//
//  FormKmsViewController.swift
//  MC2
//
//  Created by Azis Jabbar Susetio on 19/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class FormKmsViewController: UIViewController {

    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var lingkarKepalaTextField: UITextField!
    var id:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2196078431, green: 0.2196078431, blue: 0.2196078431, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5215686275, green: 0.8117647059, blue: 0.8666666667, alpha: 1)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func tapToAddKms(_ sender: Any) {
        id += 1
      
        let data = kms(idKMS: "\(id)", idDataBayi: "1", berat: Double(heightTextField.text!)!, lingkarkepala: Int(lingkarKepalaTextField.text!)!, panjang: Int(heightTextField.text!)!, tanggal: Date(timeIntervalSinceNow: 0))
        
        tabelKMS.append(data)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    

}
