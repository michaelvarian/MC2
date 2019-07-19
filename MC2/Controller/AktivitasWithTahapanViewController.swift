//
//  AktivitasWithTahapanViewController.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 18/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class AktivitasWithTahapanViewController: UIViewController {
    
    let cellTahapan = "cellTahapanAktivitas"

    @IBOutlet weak var detailTahapanTableView: UITableView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var viewTahapan: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        cellDelegate()
        addData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addData(){
        let tahapan1 = tumbuh(idTumbuh: "1", idAkun: "1", bulan: 1, namaTumbuh: "Berbicara", descTumbuh: "Refleks tersenyum baik sedang bangun maupun tidur", isCheck: false)
        let tahapan2 = tumbuh(idTumbuh: "1", idAkun: "1", bulan: 2, namaTumbuh: "Berbicara", descTumbuh: "Refleks tersenyum baik sedang bangun maupun tidur", isCheck: false)
        let tahapan3 = tumbuh(idTumbuh: "1", idAkun: "1", bulan: 3, namaTumbuh: "Berbicara", descTumbuh: "Refleks tersenyum baik sedang bangun maupun tidur", isCheck: false)
        let tahapan4 = tumbuh(idTumbuh: "1", idAkun: "1", bulan: 4, namaTumbuh: "Berbicara", descTumbuh: "Refleks tersenyum baik sedang bangun maupun tidur", isCheck: false)
        let tahapan5 = tumbuh(idTumbuh: "1", idAkun: "1", bulan: 5, namaTumbuh: "Berbicara", descTumbuh: "Refleks tersenyum baik sedang bangun maupun tidur", isCheck: false)
        
        tabelTumbuh.append(tahapan1)
        tabelTumbuh.append(tahapan2)
        tabelTumbuh.append(tahapan3)
        tabelTumbuh.append(tahapan4)
        tabelTumbuh.append(tahapan5)
    }
    
    func setView(){
        viewTahapan.setShadowView()
        viewTahapan.littleRoundView()
        submitButton.setShadowButton()
        submitButton.littleRoundButton()
    }

    @IBAction func submitTapped(_ sender: UIButton) {
        
    }
}
extension AktivitasWithTahapanViewController: UITableViewDelegate, UITableViewDataSource{
    
    func cellDelegate(){
        detailTahapanTableView.delegate = self
        detailTahapanTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabelTumbuh.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellTahapan) as! DetailTahapanTableViewCell
        let tahapan = tabelTumbuh[indexPath.row]
        cell.outerTahapanView.setShadowView()
        cell.outerTahapanView.littleRoundView()
        cell.deskripsiTahapanLabel.text = tahapan.descTumbuh
        cell.checkBoxTahapan.addTarget(self, action: #selector(checkMarkedClicked(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func checkMarkedClicked(sender: UIButton){
        if sender.isSelected == false{
            showAlertView(sender: sender)
        }else{
            sender.isSelected = false
        }
    }
    
    func showAlertView(sender:UIButton){
        let alert = UIAlertController(title: "Waw Hebat", message: "Apakah buah hati anda dapat melakukannya", preferredStyle: .alert)
        
        let ya = UIAlertAction(title: "Ya", style: .default) { action in
            sender.isSelected = true
        }
        
        let tidak = UIAlertAction(title: "Tidak ", style: .default) { action in
            sender.isSelected = false
        }
        
        alert.addAction(tidak)
        alert.addAction(ya)
        
        present(alert, animated: true, completion: nil)
    }
    
}
