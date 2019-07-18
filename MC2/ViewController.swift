//
//  ViewController.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 12/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Inisialisasi Data

        
        let aku = akun(idAkun: "1", namaOrangTua: "kevin", panggilan: "")
        let aku2 = akun(idAkun: "1", namaOrangTua: "aldi", panggilan: "")
        let aku3 = akun(idAkun: "1", namaOrangTua: "azis", panggilan: "")
        
        
        
        tabelAkun.append(aku)
        tabelAkun.append(aku2)
        tabelAkun.append(aku3)
        
        //example code filter data / where di database
        let b = (tabelAkun.filter{$0.idAkun.contains("1") && $0.idAkun.contains("azis")})
        
        for akun in b
        {
            print(akun.idAkun)
        }
    }


}

