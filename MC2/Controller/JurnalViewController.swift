//
//  JurnalViewController.swift
//  MC2
//
//  Created by Kevin Abram on 13/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class JurnalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var jurnalSearchBar: UISearchBar!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var filterView: UIView!
    
    @IBOutlet weak var filterOvalShape: UIView!
    
    @IBOutlet weak var jurnalTableView: UITableView!
    
//    @IBOutlet weak var filterDateStart: UIButton!
//
//    @IBOutlet weak var filterDateEnd: UIButton!
    
    @IBOutlet weak var filterDateStart: UITextField!
    
    @IBOutlet weak var filterDateEnd: UITextField!
    
    @IBOutlet weak var filterTumbuhKembang: UIButton!

    @IBOutlet weak var filterImunisasi: UIButton!
    
    @IBOutlet weak var filterCatatanKesehatan: UIButton!
    
  //  let rows: [String] = ["row1", "row2", "row3"]
    
  //  let sections: [[String]] = []
    
    let datePicker = UIDatePicker()
    
    var isFilterTumbuhKembangHighlighted = false
    
    var isFilterImunisasiHighlighted = false
    
    var isFilterCatatanKesehatanHighlighted = false
    
    let sections = ["section1", "section2", "section3"]
    
    let rows = [["row1 section1", "row2 section1", "row3 section1"], ["row1 section2"], ["row1 section3", "row2 section3"]]
    
    var isFilterOpened = false
    
    var isFiltered = false
    
    var textFieldTag = 0
    
    override func viewWillAppear(_ animated: Bool) {
        //setDatePicker()
        
        setDatePicker()
        
        jurnalTableView.allowsSelectionDuringEditing = false
        
        jurnalTableView.allowsSelection = false
        
        headerView.layer.cornerRadius = 20
        
        headerView.setShadow()
        
        filterView.layer.cornerRadius = 20
        
        filterView.setShadow()
        
        filterOvalShape.layer.cornerRadius = 3
        
        isFilterOpened = false
        
        filterDateStart.layer.cornerRadius = 5
        
        filterDateStart.setShadow()
        
        filterDateEnd.layer.cornerRadius = 5
        
        filterDateEnd.setShadow()
        
        filterTumbuhKembang.layer.cornerRadius = 5
        
        filterTumbuhKembang.setShadow()
        
        filterImunisasi.layer.cornerRadius = 5
        
        filterImunisasi.setShadow()
        
    filterCatatanKesehatan.layer.cornerRadius = 5
        
        filterCatatanKesehatan.setShadow()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
//        print("rows counted: \(rows[section].count)")
//        return rows[section].count
        if isFiltered == false
        {
            return tabelJurnal[section].jurnalContent.count
        }
        else
        {
            return tabelJurnalFiltered[section].jurnalContent.count
        }
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
//        let cell = jurnalTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! JurnalCellRow
//        let cellDate = jurnalTableView.dequeueReusableCell(withIdentifier: "cellDate", for: indexPath) as! JurnalCellDateRow
//        print("indexpath section: \(indexPath.section)")
//
//        cell.jurnalTitle.text = tabelJurnal[indexPath.section].jurnalContent[indexPath.row].titleJurnal
//
//        if tabelJurnal[indexPath.section].jurnalContent[indexPath.row].jurnalCategory == .empty
//        {
//            let date = tabelJurnal[indexPath.section].jurnalContent[indexPath.row].date
//
//            print("date: \(date)" )
//
//            let formatter = DateFormatter()
//            formatter.dateFormat = "yyyy/MM/dd HH:mm"
//
//            let dateString = formatter.string(from: date)
//
//            cellDate.JurnalTitle.text = dateString
//
//            return cellDate
//        }
//
//        return cell
        if isFiltered == false
        {
            if tabelJurnal[indexPath.section].jurnalContent[indexPath.row].jurnalCategory == .empty
            {
                let cell = jurnalTableView.dequeueReusableCell(withIdentifier: "cellDate", for: indexPath) as! JurnalCellDateRow
                var date = Date()
                date = tabelJurnal[indexPath.section].jurnalContent[indexPath.row].date
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd"
                let dateString = formatter.string(from: date)
                cell.dateTitle.text = dateString
                cell.dateLine.layer.cornerRadius = 3
                cell.isUserInteractionEnabled = false
                return cell
            }
            else
            {
                let cell = jurnalTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! JurnalCellRow
                cell.jurnalTitle.text = tabelJurnal[indexPath.section].jurnalContent[indexPath.row].titleJurnal
                cell.jurnalCircle.layer.cornerRadius = cell.jurnalCircle.frame.size.width/2
                return cell
            }
        }
        else
        {
            if tabelJurnalFiltered[indexPath.section].jurnalContent[indexPath.row].jurnalCategory == .empty
            {
                let cell = jurnalTableView.dequeueReusableCell(withIdentifier: "cellDate", for: indexPath) as! JurnalCellDateRow
                var date = Date()
                date = tabelJurnalFiltered[indexPath.section].jurnalContent[indexPath.row].date
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd"
                let dateString = formatter.string(from: date)
                cell.dateTitle.text = dateString
                cell.dateLine.layer.cornerRadius = 3
                cell.isUserInteractionEnabled = false
                return cell
            }
            else
            {
                let cell = jurnalTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! JurnalCellRow
                cell.jurnalTitle.text = tabelJurnalFiltered[indexPath.section].jurnalContent[indexPath.row].titleJurnal
                cell.jurnalCircle.layer.cornerRadius = cell.jurnalCircle.frame.size.width/2
                return cell
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int // Default is 1 if not implemented
    {
        if isFiltered == false
        {
            return tabelJurnal.count
        }
        else
        {
            return tabelJurnalFiltered.count
        }
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? // fixed font style. use custom view (UILabel) if you want something different
//    {
//        let monthValue = tabelJurnal[section].monthValue
//        let yearValue = tabelJurnal[section].yearValue
//        let df = DateFormatter()
//        let monthName = df.monthSymbols[monthValue]
//        return "\(monthName) \(yearValue)"
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let sectionView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        sectionView.backgroundColor = .white
        
        let dateLabel = UILabel(frame: CGRect(x: 150, y: 0, width: 250, height: 50))
        dateLabel.textColor = .black
        dateLabel.font = UIFont.systemFont(ofSize: 29, weight: .medium)
        
        let monthValue: Int
        let yearValue: Int
        
        if isFiltered == false
        {
            monthValue = tabelJurnal[section].monthValue
            yearValue = tabelJurnal[section].yearValue
        }
        else
        {
            monthValue = tabelJurnalFiltered[section].monthValue
            yearValue = tabelJurnalFiltered[section].yearValue
        }
        
        let df = DateFormatter()
        let monthName = df.monthSymbols[monthValue]
        dateLabel.text = "\(monthName) \(yearValue)"
        
        let line = UIView(frame: CGRect(x: -20, y: 25, width: 150, height: 5))
        line.backgroundColor = .darkGray
        line.layer.cornerRadius = 3
        
        sectionView.addSubview(line)
        
        sectionView.addSubview(dateLabel)
        
        return sectionView
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if isFiltered == false
        {
            if tabelJurnal[indexPath.section].jurnalContent[indexPath.row].jurnalCategory == .empty
            {
                return 100
            }
            else
            {
                return 150
            }
        }
        else
        {
            if tabelJurnalFiltered[indexPath.section].jurnalContent[indexPath.row].jurnalCategory == .empty
            {
                return 100
            }
            else
            {
                return 150
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) // called when text changes (including clear)
    {
        //Empty the filtered jurnal array
        tabelJurnalFiltered.removeAll()
        
        //This code loops the sections of the jurnal as well as adding the nested sections (for placing on the section)
        var jurnalCount = 0
        var boolAdd = false
       // var addJurnalContent: jurnalContent
        for jurnals in tabelJurnal
        {
            boolAdd = false
            for jurnalContents in tabelJurnal[jurnalCount].jurnalContent
            {
                if jurnalContents.titleJurnal.contains(searchText.lowercased())
                {
                    boolAdd = true
                    print("found!")
                }
            }
            if boolAdd == true
            {
                tabelJurnalFiltered.append(jurnal(idJurnal: jurnals.idJurnal, idAkun: jurnals.idAkun, yearValue: jurnals.yearValue, monthValue: jurnals.monthValue, jurnalContent: [jurnalContent]()))
            }
            jurnalCount += 1
        }
        
        //This code loops the content of the jurnal content (for placing on the rows)
        print("search text: \(searchText.lowercased())")
        var jurnalCount2 = 0
        var idJurnalContentCount = 0
        var addSubSection = false
        for jurnals2 in tabelJurnal
        {
            print("jurnal with number of: \(jurnalCount2)")
            print("-----")
            for jurnalContents2 in tabelJurnal[jurnalCount2].jurnalContent
            {
                if jurnalContents2.titleJurnal.contains(searchText.lowercased())
                {
                    addSubSection = false
                    let date = jurnalContents2.date
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy/MM/dd"
                    let dateString = formatter.string(from: date)
                    let dateDate = formatter.date(from: dateString)
                    print("a date must be output at this point")
                    print(dateDate!)
                    
                    for jurnalDates in tabelJurnal[jurnalCount2].jurnalContent
                    {
                        if jurnalDates.date == dateDate!
                        {
                            
                        }
                        else
                        {
                            addSubSection = true
                        }

                    }
                    
                    if addSubSection == true
                    {
                        idJurnalContentCount += 1
                        let newSubSection = jurnalContent(idJurnalContent: String(idJurnalContentCount), idJurnal: jurnals2.idJurnal, jurnalCategory: .empty, date: dateDate!, titleJurnal: "", descJurnal: "")
                        tabelJurnalFiltered[jurnalCount2].jurnalContent.append(newSubSection)
                        
                    }
                    
                    idJurnalContentCount += 1
                    let newContent = jurnalContent(idJurnalContent: String(idJurnalContentCount), idJurnal: jurnals2.idJurnal, jurnalCategory: jurnalContents2.jurnalCategory, date: dateDate!, titleJurnal: jurnalContents2.titleJurnal, descJurnal: jurnalContents2.descJurnal)
                    tabelJurnalFiltered[jurnalCount2].jurnalContent.append(newContent)
                }
            }
            print("-----")
            jurnalCount2 += 1
        }
        
        if searchText.count == 0
        {
            isFiltered = false
        }
        else
        {
            isFiltered = true
        }
        
        jurnalTableView.reloadData()
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
//    {
////        if tabelJurnal[indexPath.section].jurnalContent[indexPath.row].jurnalCategory == .empty
////        {
////            return 100
////        }
////        else
////        {
////            return 150
////        }
//        return 150
//    }
    
//    func computeItemAndSubsectionIndex(for indexPath: IndexPath?) -> IndexPath? {
//        var sectionItems = sections[Int(indexPath?.section ?? 0)]
//        var itemIndex = indexPath?.row
//        var subsectionIndex = 0
//        for i in 0..<sectionItems.count {
//            // First row for each section item is header
//            itemIndex = (itemIndex ?? 0) - 1
//            // Check if the item index is within this subsection's items
//            let subsectionItems = sectionItems[i]
//            if (itemIndex ?? 0) < Int(subsectionItems?.count ?? 0) {
//                subsectionIndex = i
//                break
//            } else {
//                itemIndex -= subsectionItems?.count
//            }
//        }
//        return IndexPath(row: itemIndex ?? 0, section: subsectionIndex)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func filterClick(_ sender: UIButton) {
        
        switch isFilterOpened
        {
        case false:
            UIView.animate(withDuration: 0.5)
            {
                self.filterView.transform =    CGAffineTransform(translationX: 0, y: +150)
            }
            isFilterOpened = true
        case true:
            UIView.animate(withDuration: 0.5)
            {
                self.filterView.transform = CGAffineTransform(translationX: 0, y: 0)
            }
            isFilterOpened = false
        }
    }
    
    @IBAction func filterButtonClick(_ sender: UIButton) {
        
        switch sender.tag
        {
        case 0:
            switch isFilterTumbuhKembangHighlighted
            {
            case false:
                filterTumbuhKembang.setHighlighted()
                isFilterTumbuhKembangHighlighted = true
            case true:
                filterTumbuhKembang.setHighlighted()
                isFilterTumbuhKembangHighlighted = false
            }
        case 1:
            switch isFilterImunisasiHighlighted
            {
            case false:
                filterImunisasi.setHighlighted()
                isFilterImunisasiHighlighted = true
            case true:
                filterImunisasi.setHighlighted()
                isFilterImunisasiHighlighted = false
            }
        case 2:
            switch isFilterCatatanKesehatanHighlighted
            {
            case false:
                filterCatatanKesehatan.setHighlighted()
                isFilterCatatanKesehatanHighlighted = true
            case true:
                filterCatatanKesehatan.setHighlighted()
                isFilterCatatanKesehatanHighlighted = false
            }
        default: break
        }
    }
    
    @IBAction func filterDateStartClicked(_ sender: UITextField) {
        textFieldTag = sender.tag
        print("date end is clicked")
    }
    
    @IBAction func filterDateEndClicked(_ sender: UITextField) {
        textFieldTag = sender.tag
        print("date end is clicked")
    }
    
    func setDatePicker()
    {
        datePicker.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([doneButton, space, cancelButton], animated: false)
        //textField.inputAccessoryView = toolbar
        //textField.inputView = datePicker
//        filterDateStart.inputAccessoryView = toolbar
//        filterDateStart.inputView = datePicker
        filterDateStart.inputAccessoryView = toolbar
        filterDateStart.inputView = datePicker
        filterDateEnd.inputAccessoryView = toolbar
        filterDateEnd.inputView = datePicker
    }
    
    @objc func doneDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        //txtDatePicker.text = formatter.string(from: datePicker.date)
        switch textFieldTag {
        case 0:
            filterDateStart.text = formatter.string(from: datePicker.date)
        case 1:
            filterDateEnd.text = formatter.string(from: datePicker.date)
        default:
            break
        }
        
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
}

extension UIView
{
    func setShadow()
    {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowRadius = 2
        self.layer.shouldRasterize = true
        self.layer.masksToBounds = false
    }
    
    func setHighlighted()
    {
        if self.backgroundColor == UIColor.white
        {
            self.backgroundColor = .lightGray
            
            self.layer.shadowColor = UIColor.darkGray.cgColor
            self.layer.shadowOpacity = 0.3
            self.layer.shadowOffset = CGSize(width: 0, height: 5)
            self.layer.shadowRadius = 0
            self.layer.shouldRasterize = true
            self.layer.masksToBounds = false
        }
        
        else if self.backgroundColor == UIColor.lightGray
        {
            self.backgroundColor = .white
            
            self.layer.shadowColor = UIColor.darkGray.cgColor
            self.layer.shadowOpacity = 0.3
            self.layer.shadowOffset = CGSize(width: 0, height: 5)
            self.layer.shadowRadius = 2
            self.layer.shouldRasterize = true
            self.layer.masksToBounds = false
        }
    }
}
