//
//  screenAlbums.swift
//  MusicBandas
//
//  Created by Diplomado on 30/10/23.
//

import Foundation
import UIKit

class screenAlbums: UIViewController {
    
    @IBOutlet weak var tableViewAlbums: UITableView!{
        didSet {
            //También puede ir dentro del viewDidLoad()
            tableViewAlbums.register(UINib(nibName: "MyAlbumsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
    }
    
    //var dataList: RowsBands?
//    var nameAlbumS: String = "Hola"
//    var imageAlbumS: String = "Hola"
//    var yearAlbumS: String = "Hola"
    var albums: RowsBands?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewAlbums.dataSource = self
        tableViewAlbums.delegate = self
        
    }
}

extension screenAlbums: UITableViewDataSource {
    
    //Número de rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //3
        return (albums?.bandAlbum.count)!
    }
    
    //Crear la celda(s)
    //El indexPath hace un ciclo para recorrer las filas y la sección
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Permite hacer la celda reutilizable
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MyAlbumsTableViewCell
            cell?.accessoryType = .disclosureIndicator
            cell?.imageAlbum.image = UIImage(named: albums!.bandAlbum[indexPath.row].imageAlbum)
            cell?.labelNameAlbum.text = albums?.bandAlbum[indexPath.row].nameAlbum  // Corregir aquí
            cell?.labelYearAlbum.text = albums?.bandAlbum[indexPath.row].yearAlbum
            return cell!
    }
    
}

extension screenAlbums: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    //Obtener el valor de la celda seleccionada
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(model.getTitle(index: indexPath))
        //Alternativa para no cambiar el color de selccion
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Logica para el tipo de albums
        performSegue(withIdentifier: "screenSongs", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "screenSongs" {
            if let id = tableViewAlbums.indexPathForSelectedRow {
                let filaAlbums = albums?.bandAlbum[id.row].bandSongs
                let destino = segue.destination as? screenSongs
                destino?.songs = filaAlbums
            }
        }
    }
}



