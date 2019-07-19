//
//  CatatanKesehatanViewController.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 16/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class CatatanKesehatanViewController: UIViewController {

    @IBOutlet weak var catatanKesehatanTableView: UITableView!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var catatButton: UIButton!
    
    // Constant
    let cellCatatanKesehatan = "cellCatatanKesehatan"
    let segue = "goToDetailCatatan"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellDelegate()
        addData()
        setView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func addData(){
        let catatanKesehatan1 = dataKesehatan(idDataKesehatan: "1", idAkun: "1", lokasi: "Siloam Kebon Jeruk", fotoKesehatan: UIImage(named: "siloam")!, pengobatan: "Pemeriksaan Bulanan", tanggalPengobatan: "09-07-19", catatan: "Badan Kuning")
        let catatanKesehatan2 = dataKesehatan(idDataKesehatan: "2", idAkun: "2", lokasi: "Siloam Kebon Jeruk", fotoKesehatan: UIImage(named: "siloam")!, pengobatan: "Pemeriksaan Bulanan", tanggalPengobatan: "09-07-19", catatan: "Badan Kuning")
        let catatanKesehatan3 = dataKesehatan(idDataKesehatan: "3", idAkun: "3", lokasi: "Siloam Kebon Jeruk", fotoKesehatan: UIImage(named: "siloam")!, pengobatan: "Pemeriksaan Bulanan", tanggalPengobatan: "09-07-19", catatan: "Badan Kuning")
        let catatanKesehatan4 = dataKesehatan(idDataKesehatan: "4", idAkun: "4", lokasi: "Siloam Kebon Jeruk", fotoKesehatan: UIImage(named: "siloam")!, pengobatan: "Pemeriksaan Bulanan", tanggalPengobatan: "09-07-19", catatan: "Badan Kuning")
        let catatanKesehatan5 = dataKesehatan(idDataKesehatan: "5", idAkun: "5", lokasi: "Siloam Kebon Jeruk", fotoKesehatan: UIImage(named: "siloam")!, pengobatan: "Pemeriksaan Bulanan", tanggalPengobatan: "09-07-19", catatan: "Badan Kuning")
        
        tabelDataKesehatan.append(catatanKesehatan1)
        tabelDataKesehatan.append(catatanKesehatan2)
        tabelDataKesehatan.append(catatanKesehatan3)
        tabelDataKesehatan.append(catatanKesehatan4)
        tabelDataKesehatan.append(catatanKesehatan5)
    }
    
    func setView(){
        headerView.setShadowView()
        headerView.littleRoundView()
        catatButton.setShadowView()
        catatButton.littleRoundButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailCatatanKesehatan  = segue.destination as! DetailCatatanKesehatanViewController
        if let indexPath = catatanKesehatanTableView.indexPathForSelectedRow{
            let catatan = tabelDataKesehatan[indexPath.row] 
            detailCatatanKesehatan.objCatatanKesehatan = catatan
        }
    }
    
}
extension CatatanKesehatanViewController: UITableViewDelegate, UITableViewDataSource{
    
    func cellDelegate(){
        catatanKesehatanTableView.delegate = self
        catatanKesehatanTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabelDataKesehatan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellCatatanKesehatan) as! CatatanKesehatanTableViewCell
        let catatanKesehatan = tabelDataKesehatan[indexPath.row]
        cell.catatanImage.image = catatanKesehatan.fotoKesehatan
        cell.catatanLokasi.text = catatanKesehatan.lokasi
        cell.catatanDate.text = catatanKesehatan.tanggalPengobatan
        cell.catatanTitle.text = catatanKesehatan.pengobatan
        cell.catatanDeskripsi.text = catatanKesehatan.catatan
        
        cell.catatanImage.littleRound()
        cell.catatanView.setShadowView()
        cell.catatanView.littleRoundView()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segue, sender: self)
    }
    
}
