//
//  DetailBayiViewController.swift
//  MC2
//
//  Created by Beny Untoro on 17/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class DetailBayiViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return jenisKelaminTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return jenisKelaminTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedJenisKelamin = jenisKelaminTypes[row]
        txtSex.text = selectedJenisKelamin
    }
    
    var selectedJenisKelamin : String?

    @IBOutlet weak var lblBabyName: UILabel!
    @IBOutlet weak var lblBabyAge: UILabel!
    @IBOutlet weak var txtBabyName: UITextField!
    @IBOutlet weak var txtSex: UITextField!
    @IBOutlet weak var txtBirthDate: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtHeadRound: UITextField!
    
    var jenisKelaminTypes = ["- - -","Laki - Laki","Perempuan"]
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        updateView()
        dismissPickerView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Detail Bayi"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        setDatePicker()
    }
    
    func createPickerView(){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        txtSex.inputView = pickerView
        
//        let tapgesture = UITapGestureRecognizer(target: self,  action:#selector(registration2ViewController.viewTapped(gestureRecognizer:)))
        
        //view.addGestureRecognizer(tapgesture)
        
    }
    
    func dismissPickerView(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Selesai", style: .plain, target: self, action: #selector(self.dissmissKeyboard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        txtSex.inputAccessoryView = toolBar
        
    }
    
    @objc func dissmissKeyboard(){
        view.endEditing(true)
    }
    
    func updateView() {
        let dataBayi = tabelDataBayi[0]
        lblBabyName.text = dataBayi.namaBayi
        txtBabyName.text = dataBayi.namaBayi
        txtSex.text = dataBayi.jnsKelamin
        //txtBirthDate.text = String(c)
        txtHeight.text = String(dataBayi.panjang)
        txtWeight.text = String(dataBayi.berat)
        txtHeadRound.text = String(dataBayi.lingkarKepala)
        
        var date = Date()
        date = dataBayi.tglLahir
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let dateString = formatter.string(from: date)
        txtBirthDate.text = dateString
    }
    
    @IBAction func btnSaveClicked(_ sender: UIButton) {
        let currBaby = tabelDataBayi[0]
        let newBaby = currBaby
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        newBaby.berat = Double(txtWeight.text!) as! Double
        newBaby.jnsKelamin = txtSex.text!
        newBaby.lingkarKepala = Int(txtHeadRound.text!)!
        newBaby.namaBayi = txtBabyName.text!
        newBaby.panjang = Double(txtHeight.text!) as! Double
        newBaby.tglLahir = formatter.date(from: txtBirthDate.text!)!
        
        tabelDataBayi.remove(at: 0)
        tabelDataBayi.append(newBaby)
        updateView()
    }
    
    @objc func doneDatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
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
