//
//  ProfilViewController.swift
//  MC2
//
//  Created by Beny Untoro on 17/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class ProfilViewController: UIViewController {

    @IBOutlet weak var lblParentName: UILabel!
    @IBOutlet weak var lblCall: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Profil"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func updateView() {
        lblCall.text = tabelAkun.first?.panggilan
        lblParentName.text = tabelAkun.first?.namaOrangTua
    }
    
    @IBAction func btnEditAccount(_ sender: UIButton) {
        let alert = UIAlertController(title: "Edit Account", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.text = tabelAkun.first?.panggilan
        })
        
        alert.addTextField(configurationHandler: { textField in
            textField.text = tabelAkun.first?.namaOrangTua
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            let currAkun = tabelAkun.first
            let newAkun = currAkun
            
            newAkun?.panggilan = (alert.textFields![0].text)!
            newAkun?.namaOrangTua = (alert.textFields![1].text)!
            
            tabelAkun.remove(at: 0)
            tabelAkun.append(newAkun!)
            self.updateView()
        }))
        
        self.present(alert, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
