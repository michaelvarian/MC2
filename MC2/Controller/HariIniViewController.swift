//
//  HariIniViewController.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 13/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//
var color = #colorLiteral(red: 1, green: 0.6687598228, blue: 0.3416582942, alpha: 1)

import UIKit

class HariIniViewController: UIViewController {
    
    // Contants
    let cellHomeTahapan = "cellHomeTahapan"
    let cellHomeAktivitas = "cellHomeAktivitas"
    let cellHomeKomunitas = "cellHomeKomunitas"
    
    // Layout
    @IBOutlet weak var headerView: UIImageView!
    @IBOutlet weak var accountImage: UIImageView!
    @IBOutlet weak var kondisiView: UIView!
    @IBOutlet weak var tahapanView: UIView!
    @IBOutlet weak var aktivitasView: UIView!
    @IBOutlet weak var komunitasView: UIView!
    @IBOutlet weak var catatButton: UIButton!
    @IBOutlet weak var urgentView: UIView!
    
    // Contents Header
    @IBOutlet weak var ucapanLabel: UILabel!
    @IBOutlet weak var tanggalLabel: UILabel!
    @IBOutlet weak var namaHeaderLabel: UILabel!
    
    
    // Contents Status Gizi
    @IBOutlet weak var namaStatusLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var umurView: UIView!
    @IBOutlet weak var beratView: UIView!
    @IBOutlet weak var tinggiView: UIView!
    @IBOutlet weak var summaryImunisasiLabel: UILabel!
    @IBOutlet weak var deskripsiSummaryImunisasi: UILabel!
    @IBOutlet weak var summaryGiziLabel: UILabel!
    @IBOutlet weak var deskripsiSummaryGizi: UILabel!
    @IBOutlet weak var summaryTumbuhLabel: UILabel!
    @IBOutlet weak var deskripsiSummaryTumbuh: UILabel!
    
    
    // Contents Tahapan
    @IBOutlet weak var tahapanButton: UIButton!
    @IBOutlet weak var namaTahapanLabel: UILabel!
    
    // Contents Aktivitas
    @IBOutlet weak var aktivitasButton: UIButton!
    @IBOutlet weak var namaAktivitasLabel: UILabel!
    
    // Contents Komunitas
    @IBOutlet weak var komunitasButton: UIButton!
    @IBOutlet weak var detailKomunitasButton: UIButton!
    
    
    @IBOutlet weak var homeTahapanTable: UITableView!
    @IBOutlet weak var homeAktivitasTable: UITableView!
    @IBOutlet weak var homeKomunitasTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStartView()
        setName()
        addDataAktivitas()
        addDataKomunitas()
        cellDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func catatTapped(_ sender: UIButton) {
        showActionSheet()
    }
    

    
   
}
extension HariIniViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func cellDelegate(){
        homeTahapanTable.delegate = self
        homeTahapanTable.dataSource = self
        homeAktivitasTable.delegate = self
        homeAktivitasTable.dataSource = self
        homeKomunitasTable.delegate = self
        homeKomunitasTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int!
        
        if tableView == homeTahapanTable{
            return tabelTumbuh.count
        }else if tableView == homeAktivitasTable{
            return tabelAktivitas.count
        }else{
            return tabelKomunitas.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.homeTahapanTable{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellHomeTahapan) as! HomeTahapanTableViewCell
            let tahapan = tabelTumbuh[indexPath.row]
            
            cell.tahapanDeskripsi.text = tahapan.descTumbuh
            cell.checkBoxTahapan.tag = indexPath.row
            cell.checkBoxTahapan.addTarget(self, action: #selector(checkMarkedClicked(sender:)), for: .touchUpInside)
            return cell
        }else if tableView == homeAktivitasTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellHomeAktivitas) as! HomeAktivitasTableViewCell
            let aktivitas = tabelAktivitas[indexPath.row]

            cell.imageAktivitas.image = aktivitas.fotoAktivitas
            cell.titleAktivitas.text = aktivitas.namaAktivitas
            cell.deskripsiAktivitas.text = aktivitas.descAktivitas
            cell.imageAktivitas.setShadow()
            cell.imageAktivitas.littleRound()
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellHomeKomunitas) as! HomeKomunitasTableViewCell
            let komunitas = tabelKomunitas[indexPath.row]
            cell.imageKomunitas.image = komunitas.fotoKomunitas
            cell.namaKomunitas.text = komunitas.namaKomunitas
            cell.deskripsiKomunitas.text = komunitas.descKomunitas
            cell.imageKomunitas.setShadow()
            cell.imageKomunitas.littleRound()
            return cell
        }
        
    }
    
    @objc func checkMarkedClicked(sender: UIButton){
        if sender.isSelected == false{
            showAlertView(sender: sender, row: sender.tag)
        }else{
            sender.isSelected = false
        }
        
    }
    
    func showAlertView(sender:UIButton, row:Int){

        let alert = UIAlertController(title: "Waw Hebat", message: "Apakah buah hati anda dapat melakukannya", preferredStyle: .alert)
        
        let ya = UIAlertAction(title: "Ya", style: .default) { action in
            sender.isSelected = true
            self.homeTahapanTable.beginUpdates()
            tabelTumbuh.remove(at: row)
            self.homeTahapanTable.deleteRows(at: [IndexPath(row: row, section: 0)], with: .fade)
            self.homeTahapanTable.endUpdates()
            self.homeTahapanTable.reloadData()
        }
        
        let tidak = UIAlertAction(title: "Tidak ", style: .default) { action in
            sender.isSelected = false
        }
        
        alert.addAction(tidak)
        alert.addAction(ya)
        
        present(alert, animated: true, completion: nil)
    }
    
    
}

extension HariIniViewController{
    
    func setName(){
        namaHeaderLabel.text = "Mama " + tabelAkun[0].namaOrangTua
        namaStatusLabel.text = tabelDataBayi[0].namaBayi
        namaAktivitasLabel.text = tabelDataBayi[0].namaBayi
    }
    
    func setDate(){
        let today = Date()
        let weekday = Calendar.current.component(.weekday, from: today)
        let month = Calendar.current.component(.month, from: today)
        let date = Calendar.current.component(.day, from: today)
        
        tanggalLabel.text = Calendar.current.weekdaySymbols[weekday-1] + " \(date) \(Calendar.current.shortMonthSymbols[month-1]) 2019"
    }
    
    func setStartView(){
        setDate()
        accountImage.setRounded()
        
        urgentView.setShadow()
        urgentView.littleRoundView()
        catatButton.setShadowButton()
        catatButton.littleRoundButton()
        kondisiView.setShadowView()
        kondisiView.littleRoundView()
        tahapanView.setShadowView()
        tahapanView.littleRoundView()
        aktivitasView.setShadowView()
        aktivitasView.littleRoundView()
        komunitasView.setShadowView()
        komunitasView.littleRoundView()
        umurView.setShadowView()
        umurView.littleRoundCondition()
        beratView.setShadowView()
        beratView.littleRoundCondition()
        tinggiView.setShadowView()
        tinggiView.littleRoundCondition()
        
        detailKomunitasButton.littleRoundButton()
    }
    
    func showActionSheet() {
        
        let actionSheet = UIAlertController(title: nil, message: "Ayo terus konsisten rawat bayi bunda", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Batal", style: .cancel, handler: nil)
        
        let kms = UIAlertAction(title: "Kartu Menuju Sehat", style: .default) { action in
            self.performSegue(withIdentifier: "goToKMS", sender: self)
        }
        
        let imunisasi = UIAlertAction(title: "Imunisasi", style: .default) { action in
            self.performSegue(withIdentifier: "goToImunisasi", sender: self)
        }
        
        let riwayatSakit = UIAlertAction(title: "Riwayat Sakit", style: .default) { action in
            self.performSegue(withIdentifier: "goToCatatanKesehatan", sender: self)
        }
        
        actionSheet.addAction(kms)
        actionSheet.addAction(imunisasi)
        actionSheet.addAction(riwayatSakit)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true, completion: nil)
    }
}

