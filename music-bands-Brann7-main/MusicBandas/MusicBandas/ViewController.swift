//
//  ViewController.swift
//  MusicBandas
//
//  Created by Diplomado on 28/10/23.
//

import UIKit

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

class ViewController: UIViewController {
    

    
    var bands: [RowsBands] = []
    
    @IBOutlet weak var tabla: UITableView!{
    didSet {
            //También puede ir dentro del viewDidLoad()
            tabla.register(UINib(nibName: "MyBandsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
    }
    
    //let model = TableViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.dataSource = self
        tabla.delegate = self
        
        let album1Muse = RowsAlbums(nameAlbum: "Black Holes & Revelations", imageAlbum: "museRevelations", yearAlbum: "2006", bandSongs: [
            RowsSongs(nameSong: "Song 1", duracion: "3:00"),
            RowsSongs(nameSong: "Song 2", duracion: "3:15"),
            RowsSongs(nameSong: "Song 3", duracion: "3:50")
        ])
        
        let album2Muse = RowsAlbums(nameAlbum: "Resistance", imageAlbum: "Theresistance", yearAlbum: "2008", bandSongs: [
            RowsSongs(nameSong: "Song 1", duracion: "3:00"),
            RowsSongs(nameSong: "Song 2", duracion: "3:15"),
            RowsSongs(nameSong: "Song 3", duracion: "3:50")
        ])
        
        bands = [RowsBands(nameBanda: "Muse", imageBand: "Muse", bandAlbum: [album1Muse, album2Muse]), RowsBands(nameBanda: "Arctic Monkeys", imageBand: "arctic_monkeys", bandAlbum: [album1Muse])]
    }

}

extension ViewController: UITableViewDataSource {
    
    //Le da un titulo arriba de las tablas
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return model.getSectionTitle()
//    }
    
    //Número de rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //3
        return bands.count
        
    }
    
    //Crear la celda(s)
    //El indexPath hace un ciclo para recorrer las filas y la sección
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //permite hacer lacelda reutilizable
        let cell = tabla.dequeueReusableCell(withIdentifier: "cell") as? MyBandsTableViewCell
        let band = bands[indexPath.row]
        cell?.accessoryType = .disclosureIndicator
        cell?.imageBand.image = UIImage(named: band.imageBand)
        cell?.labelNameBand.text = band.nameBanda
        return cell!
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    //Obtener el valor de la celda seleccionada
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(model.getTitle(index: indexPath))
        
        //Alternativa para no cambiar el color de selccion
        //tabla.deselectRow(at: indexPath, animated: true)

        
        //Logica para el tipo de albums
        performSegue(withIdentifier: "screenAlbums", sender: nil)
    }
    
    //Enviar datos a la otra ventana de albums
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "screenAlbums" {
            if let id = tabla.indexPathForSelectedRow {
                let fila = bands[id.row]
                let destino = segue.destination as? screenAlbums
                destino?.albums = fila
                //destino?.dataList? = fila
            }
        }

    }
    
}


