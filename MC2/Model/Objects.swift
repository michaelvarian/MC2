//
//  Objects.swift
//  MC2
//
//  Created by Muhammad Reynaldi on 12/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import Foundation
import UIKit

//The array of objects

var tabelAkun: [akun] = []

var tabelDataBayi: [dataBayi] = []

var tabelDataKesehatan: [dataKesehatan] = []

var tabelAktivitas: [aktivitas] = []

var tabelImunisasi: [imunisasi] = []

var tabelKomunitas: [komunitas] = []

var tabelKondisi: [kondisi] = []

var tabelTumbuh: [tumbuh] = []

var tabelJurnal: [jurnal] = []

var tabelJurnalFiltered: [jurnal] = []

var tabelPercobaan: [jurnal] = []


//The object inits

//enum panggilan
//{
//    case Mama
//    case Papa
//    case Papi
//    case Mami
//    case Bun
//    case Yah
//}

class akun
{
    var idAkun: String //Primary Key
    var namaOrangTua: String
    var namaBayi: String
    var panggilan: String
    
    init(idAkun: String, namaOrangTua: String, namaBayi: String, panggilan: String) {
        self.idAkun = idAkun
        self.namaOrangTua = namaOrangTua
        self.namaBayi = namaBayi
        self.panggilan = panggilan
        
    }
}

class dataBayi
{
    var idDataBayi: String //Primary Key
    var idAkun: String //Foreign Key
    var panjang: Double
    
    init(idDataBayi: String, idAkun: String, panjang: Double) {
        self.idDataBayi = idDataBayi
        self.idAkun = idAkun
        self.panjang = panjang
    }
}

class dataKesehatan
{
    var idDataKesehatan: String //Primary Key
    var idAkun: String //Foreign Key
    var lokasi: String
    var fotoKesehatan: UIImage
    var pengobatan: String
    var tanggalPengobatan: String
    var catatan: String
    
    init(idDataKesehatan: String, idAkun: String, lokasi: String, fotoKesehatan: UIImage, pengobatan: String, tanggalPengobatan: String, catatan: String) {
        self.idDataKesehatan = idDataKesehatan
        self.idAkun = idAkun
        self.lokasi = lokasi
        self.fotoKesehatan = fotoKesehatan
        self.pengobatan = pengobatan
        self.tanggalPengobatan = tanggalPengobatan
        self.catatan = catatan
    }
}

class aktivitas
{
    var idAktivitas: String //Primary Key
    var idAkun: String //Foreign Key
    var namaAktivitas: String
    var descAktivitas: String
    var fotoAktivitas: UIImage
    
    init(idAktivitas: String, idAkun: String, namaAktivitas: String, descAktivitas: String, fotoAktivitas: UIImage) {
        self.idAktivitas = idAktivitas
        self.idAkun = idAkun
        self.namaAktivitas = namaAktivitas
        self.descAktivitas = descAktivitas
        self.fotoAktivitas = fotoAktivitas
    }
}

class imunisasi
{
    var idImunisasi: String //Primary Key
    var idAkun: String // Foreign Key
    var jenisImunisasi: String
    var descImunisasi: String
    var tanggalImunisasi: Date
    var isCheck: Bool
    
    init(idImunisasi: String, IdAkun: String, jenisImunisasi: String, descImunisasi:String, tanggalImunisasi: Date, isCheck: Bool) {
        self.idImunisasi = idImunisasi
        self.idAkun = IdAkun
        self.jenisImunisasi = jenisImunisasi
        self.descImunisasi = descImunisasi
        self.tanggalImunisasi = tanggalImunisasi
        self.isCheck = isCheck
    }
}


class komunitas
{
    var idKomunitas: String // Primary Key
    var idAkun: String // Foreign Key
    var namaKomunitas: String
    var descKomunitas: String
    var fotoKomunitas: UIImage
    var linkKomunitas: String
    
    init(idKomunitas: String, IdAkun: String, namaKomunitas: String, descKomunitas:String, fotoKomunitas: UIImage, linkKomunitas: String) {
        self.idKomunitas = idKomunitas
        self.idAkun = IdAkun
        self.namaKomunitas = namaKomunitas
        self.descKomunitas = descKomunitas
        self.fotoKomunitas = fotoKomunitas
        self.linkKomunitas = linkKomunitas
    }
}

class kondisi
{
    var idKondisi: String // Primary Key
    var idAkun: String // Foreign Key
    var status: String
    var descStatusGizi: String
    var descStatusImunisasi: String
    var descStatusTumbuh: String
    var kenaikanBeratMinimal: String
    var isNaik: Bool
    
    init(idKondisi: String, IdAkun: String, status: String, descStatusGizi: String, descStatusImunisasi: String, descStatusTumbuh: String, kenaikanBeratMinimal: String, isNaik: Bool) {
        self.idKondisi = idKondisi
        self.idAkun = IdAkun
        self.status = status
        self.descStatusGizi = descStatusGizi
        self.descStatusImunisasi = descStatusImunisasi
        self.descStatusTumbuh = descStatusTumbuh
        self.kenaikanBeratMinimal = kenaikanBeratMinimal
        self.isNaik = isNaik
    }
}

class tumbuh
{
    var idTumbuh: String // Primary Key
    var idAkun: String // Foreign Key
    var namaTumbuh: String
    var descTumbuh: String
    var isCheck: Bool
    
    init(idTumbuh: String, idAkun: String, namaTumbuh: String, descTumbuh: String, isCheck: Bool) {
        self.idTumbuh = idTumbuh
        self.idAkun = idAkun
        self.namaTumbuh = namaTumbuh
        self.descTumbuh = descTumbuh
        self.isCheck = isCheck
    }
}

enum jurnalCategoryEnum
{
    case tumbuhKembang
    case imunisasi
    case catatanKesehatan
    case empty
}

class jurnal
{
    var idJurnal: String // Primary Key
    var idAkun: String // Foreign Key
    var yearValue: Int
    var monthValue: Int
    var jurnalContent: [jurnalContent]
    
    //    init(idJurnal: String, idAkun: String, jurnalCategory: jurnalCategoryEnum, date: Date, titleJurnal: String, descJurnal: String) {
    //        self.idJurnal = idJurnal
    //        self.idAkun = idAkun
    //        self.date = date
    //        self.titleJurnal = titleJurnal
    //        self.descJurnal = descJurnal
    //        self.jurnalCategory = jurnalCategory
    //}
    
    init(idJurnal: String, idAkun: String, yearValue: Int, monthValue: Int, jurnalContent: [jurnalContent]) {
        self.idJurnal = idJurnal
        self.idAkun = idAkun
        self.yearValue = yearValue
        self.monthValue = monthValue
        self.jurnalContent = jurnalContent
    }
}

class jurnalContent
{
    var idJurnalContent: String // Primary Key
    var idJurnal: String // Foreign key
    var jurnalCategory: jurnalCategoryEnum
    var date: Date
    var titleJurnal: String
    var descJurnal: String
    
    //    init(idJurnalContent: String) {
    //       self.idJurnalContent = idJurnalContent
    //    }
    
    init(idJurnalContent: String, idJurnal: String, jurnalCategory: jurnalCategoryEnum, date: Date, titleJurnal: String, descJurnal: String) {
        self.idJurnalContent = idJurnalContent
        self.idJurnal = idJurnal
        self.jurnalCategory = jurnalCategory
        self.date = date
        self.titleJurnal = titleJurnal
        self.descJurnal = descJurnal
    }
}

func initJurnalObjects()
{
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    
    let firstDateData = formatter.date(from: "2016/10/08 11:31")
    let secondDateData = formatter.date(from: "2016/10/08 15:31")
    let thirdDateData = formatter.date(from: "2016/10/08 10:29")
    
    let fourthDateData = formatter.date(from: "2016/10/09 08:37")
    let fifthDateData = formatter.date(from: "2016/10/09 10:00")
    
    let sixthDateData = formatter.date(from: "2016/11/01 03:23")
    let seventhDateData = formatter.date(from: "2016/11/01 03:23")
    
    
    let row1section1 = jurnalContent(idJurnalContent: "1", idJurnal: "1", jurnalCategory: .catatanKesehatan, date:
        firstDateData!, titleJurnal: "this is a title", descJurnal: "this is a description")
    let row2section1 = jurnalContent(idJurnalContent: "2", idJurnal: "1", jurnalCategory: .imunisasi, date: secondDateData!, titleJurnal: "this is a second title", descJurnal: "this is a second description")
    let row3section1 = jurnalContent(idJurnalContent: "3", idJurnal: "1", jurnalCategory: .tumbuhKembang, date: thirdDateData!, titleJurnal: "this is a third title", descJurnal: "this is a third description")
    
    let emptyrow1 = jurnalContent(idJurnalContent: "4", idJurnal: "1", jurnalCategory: .empty, date: firstDateData!, titleJurnal: "", descJurnal: "")
    
    let emptyrow2 = jurnalContent(idJurnalContent: "5", idJurnal: "1", jurnalCategory: .empty, date: fourthDateData!, titleJurnal: "", descJurnal: "")
    
    let row4section1 = jurnalContent(idJurnalContent: "6", idJurnal: "1", jurnalCategory: .imunisasi, date: fourthDateData!, titleJurnal: "this is a fourth title", descJurnal: "this is a fourth description")
    
    let row5section1 = jurnalContent(idJurnalContent: "7", idJurnal: "1", jurnalCategory: .tumbuhKembang, date: fifthDateData!, titleJurnal: "this is a fifth title ", descJurnal: "this is a fifth description")
    
    let emptyrow3 = jurnalContent(idJurnalContent: "8", idJurnal: "2", jurnalCategory: .empty, date: sixthDateData!, titleJurnal: "", descJurnal: "")
    
    let row1section2 = jurnalContent(idJurnalContent: "9", idJurnal: "2", jurnalCategory: .catatanKesehatan, date: sixthDateData!, titleJurnal: "this is a sixth title", descJurnal: "this is a sixth description")
    
    let row2section2 = jurnalContent(idJurnalContent: "10", idJurnal: "2", jurnalCategory: .imunisasi, date: seventhDateData!, titleJurnal: "this is a seventh title", descJurnal: "this is a seventh description")
    
    let section1 = jurnal(idJurnal: "1", idAkun: "1", yearValue: 2016, monthValue: 10, jurnalContent: [emptyrow1, row1section1, row2section1, row3section1, emptyrow2, row4section1, row5section1])
    
    let section2 = jurnal(idJurnal: "2", idAkun: "1", yearValue: 2016, monthValue: 11, jurnalContent: [emptyrow3, row1section2, row2section2])
    
    tabelJurnal.append(section1)
    tabelJurnal.append(section2)
}




