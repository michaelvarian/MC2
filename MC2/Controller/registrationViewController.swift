//
//  registrationViewController.swift
//  MC2
//
//  Created by Michael Varian Sutanto on 20/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class registrationViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return panggilanTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return panggilanTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPanggilan = panggilanTypes[row]
        panggilanField.text = selectedPanggilan
    }
   
    var selectedPanggilan : String?
    var panggilanTypes = ["---","Mama","Papa","Mami","Papi","Bun","Yah"]
    
    func createPickerView(){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        
        panggilanField.inputView = pickerView
        
    }
    
    func dismissPickerView(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Selesai", style: .plain, target: self, action: #selector(self.dissmissKeyboard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        panggilanField.inputAccessoryView = toolBar
        
    }
    
    @objc func dissmissKeyboard(){
        view.endEditing(true)
    }
    
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var panggilanLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var panggilanField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        dismissPickerView()
        // Do any additional setup after loading the view.
    }
    @IBAction func lanjutActionButton(_ sender: Any) {
        
        let data = akun(idAkun: "1", namaOrangTua: String(nameField.text!), panggilan: String(panggilanField.text!))
        
        tabelAkun.append(data)
        
        performSegue(withIdentifier: "registration2", sender: self)
    }
}
