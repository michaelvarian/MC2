//
//  FormCatantanKesehatanViewController.swift
//  MC2
//
//  Created by Kevin Abram on 19/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class FormCatantanKesehatanViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var id:Int = 0
    var imageCatatan:UIImage!
    private var datePicker:UIDatePicker?
    
    @IBOutlet weak var tujuanBerobatTF: UITextField!
    @IBOutlet weak var tanggalBerobatTF: UITextField!
    @IBOutlet weak var lokasiBerobatTF: UITextField!
    @IBOutlet weak var catatanTF: UITextField!
    @IBOutlet weak var catatButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPicker()
        setView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2196078431, green: 0.2196078431, blue: 0.2196078431, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5215686275, green: 0.8117647059, blue: 0.8666666667, alpha: 1)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func catatTapped(_ sender: UIButton) {
        addCatatanKesehatan()
        navigationController?.popViewController(animated: true)
    }
    
    func setView(){
        catatButton.setShadowButton()
        catatButton.littleRoundButton()
    }
    
    func addCatatanKesehatan(){
        id += 1
        
        let dataCatatanKesehatan = dataKesehatan(idDataKesehatan: "\(id)", idAkun: "1", lokasi: lokasiBerobatTF.text!, fotoKesehatan: imageCatatan ,pengobatan: tujuanBerobatTF.text!, tanggalPengobatan: tanggalBerobatTF.text!, catatan: catatanTF.text!)
        
        tabelDataKesehatan.append(dataCatatanKesehatan)
    }
    
    func initPicker(){
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(FormCatantanKesehatanViewController.dateChange(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTap(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        tanggalBerobatTF.inputView = datePicker
    }
    
    @objc func dateChange(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        tanggalBerobatTF.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc func viewTap(gestureRecognizer:UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @IBAction func addPhotoTapped(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(.init(title: "Kamera", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(.init(title: "Perpustakaan Foto", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(.init(title: "Batal", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageCatatan = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
