//
//  File.swift
//  MusicBandas
//
//  Created by Diplomado on 28/10/23.
//

import Foundation

struct RowsBands {
    var nameBanda: String
    var imageBand: String
    var bandAlbum: [RowsAlbums]
}
struct RowsAlbums {
    var nameAlbum: String
    var imageAlbum: String
    var yearAlbum: String
    var bandSongs: [RowsSongs]
}

struct RowsSongs {
    var nameSong: String
    var duracion: String
}

class TableViewModel {
    
    var rowsArrayBands: [RowsBands] = []
    
    init(){
        //Banda 1
        let songs1 = [RowsSongs(nameSong: "Song 1", duracion: "3:30"), RowsSongs(nameSong: "Song 1", duracion: "3:30")]
        
        let album1 = RowsAlbums(nameAlbum: "Black Holes & Revelations", imageAlbum: "museRevelations", yearAlbum: "2006", bandSongs: songs1)
        
        let band1 = RowsBands(nameBanda: "Muse", imageBand: "Muse", bandAlbum: [album1])
        
        //Banda 2
        let songs2 = [RowsSongs(nameSong: "Song 1", duracion: "3:30"), RowsSongs(nameSong: "Song 1", duracion: "3:30")]
        
        let album2 = RowsAlbums(nameAlbum: "Album, 2", imageAlbum: "museRevelations", yearAlbum: "2006", bandSongs: songs2)
        
        let band2 = RowsBands(nameBanda: "Artici", imageBand: "Muse", bandAlbum: [album2])

        rowsArrayBands = [band1, band2]
    }
    

    //var rowsArrayAlbumsMuse: [RowsAlbums] = []
    
//    init() {
//        rowsArrayBands = [
//            RowsBands(nameBanda: "Muse", imageBand: "Muse",
//                      bandAlbum: [RowsAlbums(nameAlbum: "Black Holes & Revelations", imageAlbum: "museRevelations", yearAlbum: "2006", bandSongs: [RowsSongs(nameSong: "Song1", duracion: "2:30"),RowsSongs(nameSong: "Song2", duracion: "4:24")]),RowsAlbums(nameAlbum: "The resistance", imageAlbum: "Theresistance", yearAlbum: "2008", bandSongs: [RowsSongs(nameSong: "Song1 Resis", duracion: "5:00"),RowsSongs(nameSong: "Song2 resis", duracion: "3:50")])])
//            ]
//
////        rowsArrayAlbumsMuse = [
////            RowsAlbums(nameAlbum: "Black Holes & Revelations", imageAlbum: "museRevelations", yearAlbum: "2006", bandSongs: <#[RowsSongs]#>),
////
////            ]
//    }
    
    func getCountArray() -> Int{
        rowsArrayBands.count
    }
    
    //Crear func para contar el total de albums
    
//    func getCountArrayAlbums(index: IndexPath) -> Int{
//        rowsArrayBands[RowsAlbums].count
//    }
    
    func getTitle(index: IndexPath) -> String {
        rowsArrayBands[index.row].nameBanda
    }
    func getImageBand (index: IndexPath) -> String {
        rowsArrayBands[index.row].imageBand
    }
    
    func getTitleAlbum (index: IndexPath) -> String {
        rowsArrayBands[index.row].bandAlbum[index.row].nameAlbum
    }
    func getImageAlbum (index: IndexPath) -> String {
        rowsArrayBands[index.row].bandAlbum[index.row].imageAlbum
    }
    func getYearlbum (index: IndexPath) -> String {
        rowsArrayBands[index.row].bandAlbum[index.row].yearAlbum
    }
    
    func getNameSong (index: IndexPath) -> String {
        rowsArrayBands[index.row].bandAlbum[index.row].bandSongs[index.row].nameSong
    }
    func getDuracionSong (index: IndexPath) -> String {
        rowsArrayBands[index.row].bandAlbum[index.row].bandSongs[index.row].duracion
    }
    func getBandAtIndex(index: Int) -> RowsBands {
            return rowsArrayBands[index]
        }
    //Agregar nuevo elemento al array
//    func addRow(text: String) {
//        rowsArrayBands.append(Rows(nameBanda: text))
//    }
    
    //Para eliminar la celda
    func deleteRow(indexPath: IndexPath) {
        let selectedRow = indexPath.row
        rowsArrayBands.remove(at: selectedRow)
    }
    
    func getSections() -> Int {
        3
    }
    
    func getSectionTitle() -> String {
        "List bands"
    }
    
}
