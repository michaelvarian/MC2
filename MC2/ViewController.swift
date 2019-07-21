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

        
        //example code filter data / where di database
        let b = (tabelAkun.filter{$0.idAkun.contains("1") && $0.idAkun.contains("azis")})
        
        for akun in b
        {
            print(akun.idAkun)
        }
    }


}

