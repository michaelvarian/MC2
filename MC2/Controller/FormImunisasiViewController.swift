//
//  FormImunisasiViewController.swift
//  MC2
//
//  Created by Kevin Abram on 19/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class FormImunisasiViewController: UIViewController, UIPickerViewDelegate, UITextFieldDelegate, UIPickerViewDataSource {

    @IBOutlet weak var jenisImunisasi: UITextField!
    
    @IBOutlet weak var tanggalImunisasi: UITextField!
    
    @IBOutlet weak var lokasi: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var catatButton: UIButton!
    
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
        lokasi.delegate = self
        
        self.navigationController?.navigationBar.isHidden = false
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2196078431, green: 0.2196078431, blue: 0.2196078431, alpha: 1)
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5215686275, green: 0.8117647059, blue: 0.8666666667, alpha: 1)
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        
        self.tabBarController?.tabBar.isHidden = true
        
        self.navigationController?.navigationBar.isTranslucent = true
        
        //self.navigationController?.navigationBar.barTintColor = .init(p3red: 133/255, green: 207/255, blue: 221/255, alpha: 1)
        
        self.navigationController?.navigationBar.barTintColor = .init(red: 133/255, green: 207/255, blue: 221/255, alpha: 1)
        
        catatButton.setShadowAndRound()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func textFieldDidBeginEditing(_ textField: UITextField) // became first responder
    {
        scrollView.setContentOffset(CGPoint(x: 0, y: 100), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    
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
    @IBAction func tapDismiss(_ sender: UITapGestureRecognizer) {
//        self.view.endEditing(true)
//        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}

extension UIView
{
    func setShadowAndRound()
    {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowRadius = 2
        self.layer.shouldRasterize = true
        self.layer.masksToBounds = false
    }
}
