//
//  FormImunisasiViewController.swift
//  MC2
//
//  Created by Kevin Abram on 19/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class FormImunisasiViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var jenisImunisasi: UITextField!
    
    @IBOutlet weak var tanggalImunisasi: UITextField!
    
    @IBOutlet weak var lokasi: UITextField!
    
    var selectedMonth: String!
   // var toolBar = UIToolbar()
    //var picker = UIPickerView()
    
            let picker = UIPickerView()
            let datePicker = UIDatePicker()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setPicker()
        setDatePicker()
        
        picker.delegate = self
        picker.dataSource = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func setPicker(){
        
        let pickerToolbar = UIToolbar()
        pickerToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(onDoneButtonTapped))
        //    let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        //  let space = UIBarButtonItem(title: "Select the date", style: .plain, target: nil, action: nil)
        // let space = UIBarButtonItem(barButtonSystemItem: ., target: <#T##Any?#>, action: <#T##Selector?#>)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 0))
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        let space = UIBarButtonItem(customView: label)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(onCancelButtonTapped))
        pickerToolbar.setItems([doneButton, space, cancelButton], animated: false)
       //pickerToolbar.isTranslucent = false
        //self.view.addSubview(toolBar)
        
        jenisImunisasi.inputAccessoryView = pickerToolbar
       // jenisImunisasi.inputAccessoryView?.backgroundColor = .black
        jenisImunisasi.inputView = picker
        
        
    }
    
    func setDatePicker()
    {
        datePicker.datePickerMode = .date
        let datePickerToolbar = UIToolbar()
        datePickerToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        //    let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        //  let space = UIBarButtonItem(title: "Select the date", style: .plain, target: nil, action: nil)
        // let space = UIBarButtonItem(barButtonSystemItem: ., target: <#T##Any?#>, action: <#T##Selector?#>)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 0))
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        let space = UIBarButtonItem(customView: label)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        datePickerToolbar.setItems([doneButton, space, cancelButton], animated: false)
        
        tanggalImunisasi.inputAccessoryView = datePickerToolbar
        tanggalImunisasi.inputView = datePicker
    }
    
    @objc func onDoneButtonTapped() {
        jenisImunisasi.text = tabelImunisasi[picker.selectedRow(inComponent: 0)].jenisImunisasi
        
        self.view.endEditing(true)
    }
    
    @objc func onCancelButtonTapped() {
        self.view.endEditing(true)
    }
    
    @objc func doneDatePicker()
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        //txtDatePicker.text = formatter.string(from: datePicker.date)
        tanggalImunisasi.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker()
    {
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tabelImunisasi.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tabelImunisasi[row].jenisImunisasi
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedMonth = tabelImunisasi[row].jenisImunisasi
    }
}
