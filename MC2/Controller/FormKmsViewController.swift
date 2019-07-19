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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapToAddKms(_ sender: Any) {
        id += 1
      
        
        let data = kms(idKMS: "\(id)", idDataBayi: "1", berat: Double(heightTextField.text!)!, lingkarkepala: Int(lingkarKepalaTextField.text!)!, panjang: Int(heightTextField.text!)!, tanggal: Date(timeIntervalSinceNow: 0))
        
        tabelKMS.append(data)
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
