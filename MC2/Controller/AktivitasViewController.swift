//
//  AktivitasViewController.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 15/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class AktivitasViewController: UIViewController {
    // Variables and Constant
    let month = ["1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "10",
                "11",
                "12"]
    var selectedMonth: String!
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    
    let cellAktivitas = "aktivitasCell"

    // Outlets
    @IBOutlet weak var pilihBulan: UIBarButtonItem!
    @IBOutlet weak var aktivitasTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2196078431, green: 0.2196078431, blue: 0.2196078431, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5215686275, green: 0.8117647059, blue: 0.8666666667, alpha: 1)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
    }
    
    
    
    @IBAction func pilihBulanTapped(_ sender: UIBarButtonItem) {
        createMonthPicker()
    }
    
}
extension AktivitasViewController:UITableViewDelegate, UITableViewDataSource{
    
    func cellDelegate(){
        aktivitasTableView.delegate = self
        aktivitasTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabelAktivitas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellAktivitas) as! AktivitasTableViewCell
        let aktivitas = tabelAktivitas[indexPath.row]
        cell.aktivitasImage.image = aktivitas.fotoAktivitas
        cell.judulAktivitasLabel.text = aktivitas.namaAktivitas
        cell.deskripsiAktivitasLabel.text = aktivitas.descAktivitas
        
        cell.deskripsiAktivitasView.littleRoundView()
        cell.deskripsiAktivitasView.setShadowView()
        cell.aktivitasImage.littleRound()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetailAktivitas", sender: self)
        aktivitasTableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension AktivitasViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    
    func createMonthPicker() {
        picker = UIPickerView.init()
        picker.delegate = self
        picker.selectRow(5, inComponent:0, animated:true)

        picker.backgroundColor = UIColor.white
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.setValue(UIColor.black, forKey: "textColor")
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(picker)
        
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .plain, target: self, action: #selector(onDoneButtonTapped))]
        self.view.addSubview(toolBar)
    }
    
    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return month.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return month[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedMonth = month[row]
    }
}
