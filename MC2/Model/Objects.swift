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

var tabelKMS: [kms] = []

var tabelJurnal: [jurnal] = []

var tabelJurnalFiltered: [jurnal] = []

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
    var panggilan: String
    
    init(idAkun: String, namaOrangTua: String, panggilan: String) {
        self.idAkun = idAkun
        self.namaOrangTua = namaOrangTua
        self.panggilan = panggilan
    }
}

class dataBayi
{
    var idDataBayi: String //Primary Key
    var idAkun: String //Foreign Key
    var namaBayi: String
    var panjang: Double
    var berat: Double
    var tglLahir: Date
    var jnsKelamin: String
    var lingkarKepala: Int
    
    init(idDataBayi: String, idAkun: String, namaBayi: String, panjang: Double, berat: Double, tglLahir: Date, jnsKelamin: String, lingkarKepala: Int) {
        self.idDataBayi = idDataBayi
        self.idAkun = idAkun
        self.namaBayi = namaBayi
        self.panjang = panjang
        self.berat = berat
        self.tglLahir = tglLahir
        self.jnsKelamin = jnsKelamin
        self.lingkarKepala = lingkarKepala
    }
}

class kms
{
    var idKMS: String //Primary Key
    var idDataBayi: String //Foreign Key
    var berat: Double
    var lingkarkepala: Int
    var panjang: Int
    var tanggal: Date
    init(idKMS: String, idDataBayi: String, berat: Double, lingkarkepala: Int, panjang: Int, tanggal: Date) {
        self.idKMS = idKMS
        self.idDataBayi = idDataBayi
        self.berat = berat
        self.lingkarkepala = lingkarkepala
        self.panjang = panjang
        self.tanggal = tanggal
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
    var tanggalImunisasi: Date
    var bulan: Int
    var lokasi: String
    var isCheck: Bool
    
    init(idImunisasi: String, IdAkun: String, jenisImunisasi: String, tanggalImunisasi: Date, bulan: Int, lokasi: String, isCheck: Bool) {
        self.idImunisasi = idImunisasi
        self.idAkun = IdAkun
        self.jenisImunisasi = jenisImunisasi
        self.tanggalImunisasi = tanggalImunisasi
        self.bulan = bulan
        self.lokasi = lokasi
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
    var bulan: Int
    var namaTumbuh: String
    var descTumbuh: String
    var isCheck: Bool
    
    init(idTumbuh: String, idAkun: String, bulan: Int, namaTumbuh: String, descTumbuh: String, isCheck: Bool) {
        self.idTumbuh = idTumbuh
        self.idAkun = idAkun
        self.bulan = bulan
        self.namaTumbuh = namaTumbuh
        self.descTumbuh = descTumbuh
        self.isCheck = isCheck
    }
}

enum EnumJenisKelamin {
    case LakiLaki
    case Perempuan
}

enum jurnalCategoryEnum
{
    case tumbuhKembang
    case imunisasi
    case catatanKesehatan
    case empty
    case all
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

func initTumbuh() {
    let t1 = tumbuh(idTumbuh: "1", idAkun: "1", bulan: 1, namaTumbuh: "Menatap ke Ibu", descTumbuh: "Menatap ke Ibu", isCheck: false)
    let t2 = tumbuh(idTumbuh: "2", idAkun: "1", bulan: 1, namaTumbuh: "Mengeluarkan suara o… o…", descTumbuh: "Mengeluarkan suara o… o…", isCheck: false)
    let t3 = tumbuh(idTumbuh: "3", idAkun: "1", bulan: 1, namaTumbuh: "Tersenyum", descTumbuh: "Tersenyum", isCheck: false)
    let t4 = tumbuh(idTumbuh: "4", idAkun: "1", bulan: 1, namaTumbuh: "Menggerakkan tangan dan kaki", descTumbuh: "Menggerakkan tangan dan kaki", isCheck: false)
    let t5 = tumbuh(idTumbuh: "5", idAkun: "1", bulan: 3, namaTumbuh: "Mengangkat kepala tegak ketika tengkurap", descTumbuh: "Mengangkat kepala tegak ketika tengkurap", isCheck: false)
    let t6 = tumbuh(idTumbuh: "6", idAkun: "1", bulan: 3, namaTumbuh: "Tertawa", descTumbuh: "Tertawa", isCheck: false)
    let t7 = tumbuh(idTumbuh: "7", idAkun: "1", bulan: 3, namaTumbuh: "Menggerakkan kepala ke kanan dan ke kiri", descTumbuh: "Menggerakkan kepala ke kanan dan ke kiri", isCheck: false)
    let t8 = tumbuh(idTumbuh: "8", idAkun: "1", bulan: 3, namaTumbuh: "Membalas tersenyum ketika diajak bicara", descTumbuh: "Membalas tersenyum ketika diajak bicara", isCheck: false)
    let t9 = tumbuh(idTumbuh: "9", idAkun: "1", bulan: 3, namaTumbuh: "Mengoceh spontan atau bereaksi dengan mengoceh", descTumbuh: "Mengoceh spontan atau bereaksi dengan mengoceh", isCheck: false)
    let t10 = tumbuh(idTumbuh: "10", idAkun: "1", bulan: 6, namaTumbuh: "Berbalik dari telungkup ke telentang", descTumbuh: "Berbalik dari telungkup ke telentang", isCheck: false)
    let t11 = tumbuh(idTumbuh: "11", idAkun: "1", bulan: 6, namaTumbuh: "Mempertahankan posisi kepala tetap tegak", descTumbuh: "Mempertahankan posisi kepala tetap tegak", isCheck: false)
    let t12 = tumbuh(idTumbuh: "12", idAkun: "1", bulan: 6, namaTumbuh: "Meraih benda yang ada didekatnya", descTumbuh: "Meraih benda yang ada didekatnya", isCheck: false)
    let t13 = tumbuh(idTumbuh: "13", idAkun: "1", bulan: 6, namaTumbuh: "Menirukan bunyi", descTumbuh: "Menirukan bunyi", isCheck: false)
    let t14 = tumbuh(idTumbuh: "14", idAkun: "1", bulan: 6, namaTumbuh: "Menggenggam mainan", descTumbuh: "Menggenggam mainan", isCheck: false)
    let t15 = tumbuh(idTumbuh: "15", idAkun: "1", bulan: 6, namaTumbuh: "Tersenyum ketika melihat mainan/gambar yang menarik", descTumbuh: "Tersenyum ketika melihat mainan/gambar yang menarik", isCheck: false)
    let t16 = tumbuh(idTumbuh: "16", idAkun: "1", bulan: 9, namaTumbuh: "Merambat", descTumbuh: "Merambat", isCheck: false)
    let t17 = tumbuh(idTumbuh: "17", idAkun: "1", bulan: 9, namaTumbuh: "Mengucapkan ma … ma, da … da", descTumbuh: "Mengucapkan ma … ma, da … da", isCheck: false)
    let t18 = tumbuh(idTumbuh: "18", idAkun: "1", bulan: 9, namaTumbuh: "Meraih benda sebesar kacang", descTumbuh: "Meraih benda sebesar kacang", isCheck: false)
    let t19 = tumbuh(idTumbuh: "19", idAkun: "1", bulan: 9, namaTumbuh: "Mencari benda/mainan yang dijatuhkan", descTumbuh: "Mencari benda/mainan yang dijatuhkan", isCheck: false)
    let t20 = tumbuh(idTumbuh: "20", idAkun: "1", bulan: 9, namaTumbuh: "Bermain tepuk tangan atau ci-luk-ba", descTumbuh: "Bermain tepuk tangan atau ci-luk-ba", isCheck: false)
    let t21 = tumbuh(idTumbuh: "21", idAkun: "1", bulan: 9, namaTumbuh: "Makan kue/biskuit sendiri", descTumbuh: "Makan kue/biskuit sendiri", isCheck: false)
    let t22 = tumbuh(idTumbuh: "22", idAkun: "1", bulan: 12, namaTumbuh: "Berdiri dan berjalan berpegangan", descTumbuh: "Berdiri dan berjalan berpegangan", isCheck: false)
    let t23 = tumbuh(idTumbuh: "23", idAkun: "1", bulan: 12, namaTumbuh: "Memegang benda kecil", descTumbuh: "Memegang benda kecil", isCheck: false)
    let t24 = tumbuh(idTumbuh: "24", idAkun: "1", bulan: 12, namaTumbuh: "Meniru kata sederhana seperti ma.. ma.., pa.. pa..", descTumbuh: "Meniru kata sederhana seperti ma.. ma.., pa.. pa..", isCheck: false)
    let t25 = tumbuh(idTumbuh: "25", idAkun: "1", bulan: 12, namaTumbuh: "Mengenal anggota keluarga", descTumbuh: "Mengenal anggota keluarga", isCheck: false)
    let t26 = tumbuh(idTumbuh: "26", idAkun: "1", bulan: 12, namaTumbuh: "Takut pada orang yang baru dikenal", descTumbuh: "Takut pada orang yang baru dikenal", isCheck: false)
    let t27 = tumbuh(idTumbuh: "27", idAkun: "1", bulan: 12, namaTumbuh: "Menunjuk apa yang diinginkan tappa menangis/merengek", descTumbuh: "Menunjuk apa yang diinginkan tappa menangis/merengek", isCheck: false)
    
    tabelTumbuh.append(t1)
    tabelTumbuh.append(t2)
    tabelTumbuh.append(t3)
    tabelTumbuh.append(t4)
    tabelTumbuh.append(t5)
    tabelTumbuh.append(t6)
    tabelTumbuh.append(t7)
    tabelTumbuh.append(t8)
    tabelTumbuh.append(t9)
    tabelTumbuh.append(t10)
    tabelTumbuh.append(t11)
    tabelTumbuh.append(t12)
    tabelTumbuh.append(t13)
    tabelTumbuh.append(t14)
    tabelTumbuh.append(t15)
    tabelTumbuh.append(t16)
    tabelTumbuh.append(t17)
    tabelTumbuh.append(t18)
    tabelTumbuh.append(t19)
    tabelTumbuh.append(t20)
    tabelTumbuh.append(t21)
    tabelTumbuh.append(t22)
    tabelTumbuh.append(t23)
    tabelTumbuh.append(t24)
    tabelTumbuh.append(t25)
    tabelTumbuh.append(t26)
    tabelTumbuh.append(t27)
}

func initAccount() {
    let account1 = akun(idAkun: "1", namaOrangTua: "Linda Jobs", panggilan: "Mama")
    tabelAkun.append(account1)
}

func initDataBayi() {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd"
    
    let bayi1 = dataBayi(idDataBayi: "1", idAkun: "1", namaBayi: "Joko Cook", panjang: 50, berat: 2.98, tglLahir: formatter.date(from: "2019/05/23")!, jnsKelamin: "Laki-Laki", lingkarKepala: 30)
    
    tabelDataBayi.append(bayi1)
}

func initImunisasi() {
    let i1 = imunisasi(idImunisasi: "1", IdAkun: "1", jenisImunisasi: "HB-0", tanggalImunisasi: Date(timeIntervalSinceNow: 0), bulan: 0, lokasi: "", isCheck: false)
    let i2 = imunisasi(idImunisasi: "2", IdAkun: "1", jenisImunisasi: "BCG", tanggalImunisasi: Date(timeIntervalSinceNow: 0), bulan: 1, lokasi: "", isCheck: false)
    let i3 = imunisasi(idImunisasi: "3", IdAkun: "1", jenisImunisasi: "Polio", tanggalImunisasi: Date(timeIntervalSinceNow: 0), bulan: 1, lokasi: "", isCheck: false)
    let i4 = imunisasi(idImunisasi: "4", IdAkun: "1", jenisImunisasi: "DPT-HB-Hib 1", tanggalImunisasi: Date(timeIntervalSinceNow: 0), bulan: 2, lokasi: "", isCheck: false)
    let i5 = imunisasi(idImunisasi: "5", IdAkun: "1", jenisImunisasi: "Polio 2", tanggalImunisasi: Date(timeIntervalSinceNow: 0), bulan: 2, lokasi: "", isCheck: false)
    let i6 = imunisasi(idImunisasi: "6", IdAkun: "1", jenisImunisasi: "DPT-HB-Hib 2", tanggalImunisasi: Date(timeIntervalSinceNow: 0), bulan: 3, lokasi: "", isCheck: false)
    let i7 = imunisasi(idImunisasi: "7", IdAkun: "1", jenisImunisasi: "Polio 3", tanggalImunisasi: Date(timeIntervalSinceNow: 0), bulan: 3, lokasi: "", isCheck: false)
    let i8 = imunisasi(idImunisasi: "8", IdAkun: "1", jenisImunisasi: "DPT-HB-Hib 3", tanggalImunisasi: Date(timeIntervalSinceNow: 0), bulan: 4, lokasi: "", isCheck: false)
    let i9 = imunisasi(idImunisasi: "9", IdAkun: "1", jenisImunisasi: "Polio 4", tanggalImunisasi: Date(timeIntervalSinceNow: 0), bulan: 4, lokasi: "", isCheck: false)
    let i10 = imunisasi(idImunisasi: "10", IdAkun: "1", jenisImunisasi: "IPV", tanggalImunisasi: Date(timeIntervalSinceNow: 0), bulan: 4, lokasi: "", isCheck: false)
    let i11 = imunisasi(idImunisasi: "11", IdAkun: "1", jenisImunisasi: "Campak", tanggalImunisasi: Date(timeIntervalSinceNow: 0), bulan: 9, lokasi: "", isCheck: false)

    tabelImunisasi.append(i1)
    tabelImunisasi.append(i2)
    tabelImunisasi.append(i3)
    tabelImunisasi.append(i4)
    tabelImunisasi.append(i5)
    tabelImunisasi.append(i6)
    tabelImunisasi.append(i7)
    tabelImunisasi.append(i8)
    tabelImunisasi.append(i9)
    tabelImunisasi.append(i10)
    tabelImunisasi.append(i11)
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

func addDataTahapan(){
    let tahapan1 = tumbuh(idTumbuh: "1", idAkun: "1", bulan: 1, namaTumbuh: "Berbicara", descTumbuh: "Refleks tersenyum baik sedang bangun maupun tidur", isCheck: false)
    let tahapan2 = tumbuh(idTumbuh: "1", idAkun: "1", bulan: 2, namaTumbuh: "Berbicara", descTumbuh: "Refleks tersenyum baik sedang bangun maupun tidur", isCheck: false)
    let tahapan3 = tumbuh(idTumbuh: "1", idAkun: "1", bulan: 3, namaTumbuh: "Berbicara", descTumbuh: "Refleks tersenyum baik sedang bangun maupun tidur", isCheck: false)
    let tahapan4 = tumbuh(idTumbuh: "1", idAkun: "1", bulan: 4, namaTumbuh: "Berbicara", descTumbuh: "Refleks tersenyum baik sedang bangun maupun tidur", isCheck: false)
    let tahapan5 = tumbuh(idTumbuh: "1", idAkun: "1", bulan: 5, namaTumbuh: "Berbicara", descTumbuh: "Refleks tersenyum baik sedang bangun maupun tidur", isCheck: false)
    
    tabelTumbuh.append(tahapan1)
    tabelTumbuh.append(tahapan2)
    tabelTumbuh.append(tahapan3)
    tabelTumbuh.append(tahapan4)
    tabelTumbuh.append(tahapan5)
}

func addDataAktivitas(){
    let aktivitas1 = aktivitas(idAktivitas: "1", idAkun: "1", namaAktivitas: "Bernafas", descAktivitas: "Jika mencoba untuk bernafas, tolong di ajak bermain sepak bola, serta berenang", fotoAktivitas: UIImage(imageLiteralResourceName: "bernafas.jpg"))
    let aktivitas2 = aktivitas(idAktivitas: "2", idAkun: "2", namaAktivitas: "Bernafas", descAktivitas: "Jika mencoba untuk bernafas, tolong di ajak bermain sepak bola, serta berenang", fotoAktivitas: UIImage(imageLiteralResourceName: "bernafas.jpg"))
    let aktivitas3 = aktivitas(idAktivitas: "3", idAkun: "3", namaAktivitas: "Bernafas", descAktivitas: "Jika mencoba untuk bernafas, tolong di ajak bermain sepak bola, serta berenang", fotoAktivitas: UIImage(imageLiteralResourceName: "bernafas.jpg"))
    let aktivitas4 = aktivitas(idAktivitas: "4", idAkun: "4", namaAktivitas: "Bernafas", descAktivitas: "Jika mencoba untuk bernafas, tolong di ajak bermain sepak bola, serta berenang", fotoAktivitas: UIImage(imageLiteralResourceName: "bernafas.jpg"))
    let aktivitas5 = aktivitas(idAktivitas: "5", idAkun: "5", namaAktivitas: "Bernafas", descAktivitas: "Jika mencoba untuk bernafas, tolong di ajak bermain sepak bola, serta berenang", fotoAktivitas: UIImage(imageLiteralResourceName: "bernafas.jpg"))
    
    tabelAktivitas.append(aktivitas1)
    tabelAktivitas.append(aktivitas2)
    tabelAktivitas.append(aktivitas3)
    tabelAktivitas.append(aktivitas4)
    tabelAktivitas.append(aktivitas5)
}

func addDataKomunitas(){
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
}


/// this is line 296
