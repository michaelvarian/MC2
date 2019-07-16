//
//  HariIniViewController.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 13/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class HariIniViewController: UIViewController {
    
    // Layout
    @IBOutlet weak var headerView: UIImageView!
    @IBOutlet weak var accountImage: UIImageView!
    @IBOutlet weak var kondisiView: UIView!
    @IBOutlet weak var tahapanView: UIView!
    @IBOutlet weak var aktivitasView: UIView!
    @IBOutlet weak var komunitasView: UIView!
    @IBOutlet weak var catatButton: UIButton!
    
    // Content Status Gizi
    @IBOutlet weak var namaStatusLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var outerUmur: UIView!
    @IBOutlet weak var outerBerat: UIView!
    @IBOutlet weak var outerTinggi: UIView!
    @IBOutlet weak var umurView: UIView!
    @IBOutlet weak var beratView: UIView!
    @IBOutlet weak var tinggiView: UIView!
    @IBOutlet weak var summaryImunisasiLabel: UILabel!
    @IBOutlet weak var deskripsiSummaryImunisasi: UILabel!
    @IBOutlet weak var summaryGiziLabel: UILabel!
    @IBOutlet weak var deskripsiSummaryGizi: UILabel!
    @IBOutlet weak var summaryTumbuhLabel: UILabel!
    @IBOutlet weak var deskripsiSummaryTumbuh: UILabel!
    
    
    // Content Tahapan
    @IBOutlet weak var tahapanButton: UIButton!
    @IBOutlet weak var namaTahapanLabel: UILabel!
    
    // Content Aktivitas
    @IBOutlet weak var aktivitasButton: UIButton!
    @IBOutlet weak var namaAktivitasLabel: UILabel!
    
    // Content Komunitas
    @IBOutlet weak var komunitasButton: UIButton!
    @IBOutlet weak var namaKomunitasLabel: UILabel!
    @IBOutlet weak var detailKomunitasButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStartView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func catatTapped(_ sender: UIButton) {
        showActionSheet()
    }
    
    
    @IBAction func tahapanTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func aktivitasTapped(_ sender: UIButton) {
    }
    
    @IBAction func komunitasTapped(_ sender: UIButton) {
    }
    
   
}

extension HariIniViewController{
    
    func setStartView(){
        accountImage.setRounded()
        
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
        outerUmur.setRoundedView()
        outerUmur.setShadowView()
        umurView.setShadowView()
        umurView.littleRoundCondition()
        outerBerat.setRoundedView()
        outerBerat.setShadowView()
        beratView.setShadowView()
        beratView.littleRoundCondition()
        outerTinggi.setRoundedView()
        outerTinggi.setShadowView()
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
