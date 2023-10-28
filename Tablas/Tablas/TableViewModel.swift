//
//  TableViewModel.swift
//  Tablas
//
//  Created by Diplomado on 27/10/23.
//

import Foundation

struct Rows {
    var title: String
    var descriptionn: String
}

class TableViewModel {
    var rowsArray: [Rows] = []
    
    init() {
        rowsArray = [
            Rows(title: "Pikachu", descriptionn: "Electrico"),
            Rows(title: "Charmander", descriptionn: "Fuego"),
            Rows(title: "Gengar", descriptionn: "Fantasma"),
            Rows(title: "Dragon", descriptionn: "Dragon")
            ]
    }
    
    func getCountArray() -> Int{
        rowsArray.count
    }
    
    func getTitle (index: IndexPath) -> String {
        rowsArray[index.row].title
    }
    
    func getDescription (index: IndexPath) -> String {
        rowsArray[index.row].descriptionn
    }
    
    //Agregar nuevo elemento al array
    func addRow(text: String) {
        rowsArray.append(Rows(title: text, descriptionn: ""))
    }
    
    //Para eliminar la celda
    func deleteRow(indexPath: IndexPath) {
        let selectedRow = indexPath.row
        rowsArray.remove(at: selectedRow)
    }
    
    func getSections() -> Int {
        3
    }
    
    func getSectionTitle() -> String {
        "Pokemon!"
    }
    
}
