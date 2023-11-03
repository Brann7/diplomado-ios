//
//  screenSongs.swift
//  MusicBandas
//
//  Created by proteco on 03/11/23.
//

import UIKit

class screenSongs: UIViewController {

    @IBOutlet weak var tableSongs: UITableView!
    var songs: [RowsSongs]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSongs.delegate = self
        tableSongs.dataSource = self
        // Agregar impresiones de depuración
                print("Number of songs: \(songs?.count ?? 0)")
                if let songs = songs {
                    for song in songs {
                        print("Song: \(song.nameSong), Duration: \(song.duracion)")
                    }
                }
    }
}

extension screenSongs: UITableViewDataSource {
    
    // Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs?.count ?? 0
    }
    
    // Crear la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Utiliza el estilo por defecto proporcionado por el sistema
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        if let song = songs?[indexPath.row] {
            cell.textLabel?.text = song.nameSong
            cell.detailTextLabel?.text = song.duracion
        }
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}

extension screenSongs: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // Obtener el valor de la celda seleccionada
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Puedes agregar lógica adicional aquí si es necesario
    }
}
