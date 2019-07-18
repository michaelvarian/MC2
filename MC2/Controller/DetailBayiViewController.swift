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
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Detail Bayi"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        setDatePicker()
    }
    
    func updateView() {
        let dataBayi = tabelDataBayi[0]
        lblBabyName.text = dataBayi.namaBayi
        txtBabyName.text = dataBayi.namaBayi
        txtSex.text = dataBayi.jnsKelamin
        //txtBirthDate.text = String(c)
        txtHeight.text = String(dataBayi.berat)
        txtWeight.text = String(dataBayi.panjang)
        txtHeadRound.text = String(dataBayi.lingkarKepala)
        
        var date = Date()
        date = dataBayi.tglLahir
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let dateString = formatter.string(from: date)
        txtBirthDate.text = dateString
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
    
    @objc func doneDatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        txtBirthDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
    }
    
    func setDatePicker()
    {
        datePicker.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 0))
        label.text = "Pilih tanggal"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        let space = UIBarButtonItem(customView: label)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([doneButton, space, cancelButton], animated: false)
        
        txtBirthDate.inputAccessoryView = toolbar
        txtBirthDate.inputView = datePicker
    }
}
