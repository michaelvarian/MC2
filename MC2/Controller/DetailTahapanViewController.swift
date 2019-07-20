//
//  DetailTahapanViewController.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 14/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class DetailTahapanViewController: UIViewController {
    @IBOutlet weak var detailTahapanTableView: UITableView!
  
    // Constant
    let cellTahapan = "cellTahapan"
    let segue = "goToDetailTahapan"
    
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
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let detailTahapan = segue.destination as! MoreDetailTahapanViewController
//        if let indexPath = detailTahapanTableView.indexPathForSelectedRow{
//            let tahapan = tabelTumbuh[indexPath.row]
//            detailTahapan.objTahapan = tahapan
//        }
//    }
    
}

extension DetailTahapanViewController:UITableViewDelegate, UITableViewDataSource{

    func cellDelegate(){
        self.detailTahapanTableView.delegate = self
        self.detailTahapanTableView.dataSource = self
        self.detailTahapanTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
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
