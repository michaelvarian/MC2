//
//  KomunitasViewController.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 15/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class KomunitasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tblCommunity: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let community1 = komunitas(idKomunitas: "1", IdAkun: "1", namaKomunitas: "Komunitas 1", descKomunitas: "Deskripsi Komunitas 1", fotoKomunitas: UIImage(named: "Komunitas.png")!, linkKomunitas: "")
        let community2 = komunitas(idKomunitas: "2", IdAkun: "2", namaKomunitas: "Komunitas 2", descKomunitas: "Deskripsi Komunitas 2", fotoKomunitas: UIImage(named: "Komunitas.png")!, linkKomunitas: "")
        let community3 = komunitas(idKomunitas: "3", IdAkun: "3", namaKomunitas: "Komunitas 3", descKomunitas: "Deskripsi Komunitas 3", fotoKomunitas: UIImage(named: "Komunitas.png")!, linkKomunitas: "")
        let community4 = komunitas(idKomunitas: "4", IdAkun: "4", namaKomunitas: "Komunitas 4", descKomunitas: "Deskripsi Komunitas 4", fotoKomunitas: UIImage(named: "Komunitas.png")!, linkKomunitas: "")
        let community5 = komunitas(idKomunitas: "5", IdAkun: "5", namaKomunitas: "Komunitas 5", descKomunitas: "Deskripsi Komunitas 5", fotoKomunitas: UIImage(named: "Komunitas.png")!, linkKomunitas: "")
        
        tabelKomunitas.append(community1)
        tabelKomunitas.append(community2)
        tabelKomunitas.append(community3)
        tabelKomunitas.append(community4)
        tabelKomunitas.append(community5)
        
        tblCommunity.delegate = self 
        tblCommunity.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Komunitas"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabelKomunitas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CommunityTableViewCell
        cell?.imgCommunity.image = tabelKomunitas[indexPath.row].fotoKomunitas
        cell?.lblCommunityName.text = tabelKomunitas[indexPath.row].namaKomunitas
        cell?.lblCommunityDesc.text = tabelKomunitas[indexPath.row].descKomunitas
        return cell!
    }
}
