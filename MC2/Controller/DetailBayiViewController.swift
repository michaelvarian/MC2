//
//  DetailBayiViewController.swift
//  MC2
//
//  Created by Beny Untoro on 17/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class DetailBayiViewController: UIViewController {

    @IBOutlet weak var lblBabyName: UILabel!
    @IBOutlet weak var lblBabyAge: UILabel!
    @IBOutlet weak var txtBabyName: UITextField!
    @IBOutlet weak var txtSex: UITextField!
    @IBOutlet weak var txtBirthDate: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtHeadRound: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Detail Bayi"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func updateView() {
        let dataBayi = tabelDataBayi[0]
        lblBabyName.text = dataBayi.namaBayi
        txtBabyName.text = dataBayi.namaBayi
        txtSex.text = dataBayi.jnsKelamin
        //txtBirthDate.text = String(dataBayi.tglLahir)
        txtHeight.text = String(dataBayi.berat)
        txtWeight.text = String(dataBayi.panjang)
        txtHeadRound.text = String(dataBayi.lingkarKepala)
    }
    
    @IBAction func btnSaveClicked(_ sender: UIButton) {
        let currBaby = tabelDataBayi[0]
        let newBaby = currBaby
        
        newBaby.berat = Double(txtWeight.text!) as! Double
        newBaby.jnsKelamin = txtSex.text!
        newBaby.lingkarKepala = Int(txtHeadRound.text!)!
        newBaby.namaBayi = txtBabyName.text!
        newBaby.panjang = Double(txtHeight.text!) as! Double
        //newBaby.tglLahir = Date(txtBirthDate.text)
        
        tabelDataBayi.remove(at: 0)
        tabelDataBayi.append(newBaby)
        updateView()
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
