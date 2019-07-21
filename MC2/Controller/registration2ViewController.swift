//
//  registration2ViewController.swift
//  MC2
//
//  Created by Michael Varian Sutanto on 20/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class registration2ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    
    
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
        jenisKelaminField.text = selectedJenisKelamin
    }
    
    var selectedJenisKelamin : String?
    var jenisKelaminTypes = ["- - -","Laki - Laki","Perempuan"]
    
    func createPickerView(){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        jenisKelaminField.inputView = pickerView
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(registration2ViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapgesture = UITapGestureRecognizer(target: self,  action:#selector(registration2ViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapgesture)
        
        tanggalLahirField.inputView = datePicker
        
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        tanggalLahirField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    func dismissPickerView(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Selesai", style: .plain, target: self, action: #selector(self.dissmissKeyboard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        jenisKelaminField.inputAccessoryView = toolBar
        
    }
    
    @objc func dissmissKeyboard(){
        view.endEditing(true)
    }
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var namaBayiLabel: UILabel!
    @IBOutlet weak var namaBayiField: UITextField!
    @IBOutlet weak var jenisKelaminLabel: UILabel!
    @IBOutlet weak var jenisKelaminField: UITextField!
    @IBOutlet weak var tanggalLahirLabel: UILabel!
    @IBOutlet weak var tanggalLahirField: UITextField!
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        
        dismissPickerView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func lanjutButtonAction(_ sender: UIButton) {
        
        // Ini gimana cara ambil data dari Date Picker nya???
        
        let data = dataBayi(idDataBayi: "1", idAkun: "1", namaBayi: String(namaBayiField.text!), panjang: 0, berat: 0, tglLahir: Date(timeIntervalSinceNow: 0), jnsKelamin: String(jenisKelaminField.text!), lingkarKepala: 0)
        
        tabelDataBayi.append(data)
        
        performSegue(withIdentifier: "goToHome", sender: self)
    }
    
}
