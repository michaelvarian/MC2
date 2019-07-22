//
//  ListImunisasiViewController.swift
//  MC2
//
//  Created by Kevin Abram on 22/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class ListImunisasiViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var listImunisasiTableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2196078431, green: 0.2196078431, blue: 0.2196078431, alpha: 1)
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5215686275, green: 0.8117647059, blue: 0.8666666667, alpha: 1)
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        
//        self.tabBarController?.tabBar.isHidden = true
//        
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = listImunisasiTableView.dequeueReusableCell(withIdentifier: "cellImunisasi", for: indexPath) as! ListImunisasiTableViewCell
        return cell
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
     {
        return 110
    }
    
    @IBAction func pilihBulanClicked(_ sender: UIBarButtonItem) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
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
