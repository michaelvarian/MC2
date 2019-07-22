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
        addDataKomunitas()
        tblCommunity.delegate = self 
        tblCommunity.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Komunitas"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2196078431, green: 0.2196078431, blue: 0.2196078431, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5215686275, green: 0.8117647059, blue: 0.8666666667, alpha: 1)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: "https://t.me/joinchat/DRouLxOEK0-GHBJu76Bd6A") {
            UIApplication.shared.open(url)
        }
    }
}
