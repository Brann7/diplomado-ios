//
//  ViewController.swift
//  Tablas
//
//  Created by Diplomado on 27/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldAgregar: UITextField!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            //También puede ir dentro del viewDidLoad()
            tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        model.addRow(text: textFieldAgregar.text ?? "") //Llamamos la func para agregar a la tabla el nuevo elemento
        tableView.reloadData()//Recargar la tabla
    }
    //Crear una instancia para conectar el model con el controlador
    let model = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Para que funcione la tabla necesita delegados y datasource
        //Delegados:
        //dataSource: Maneja los datos que serán desplegados
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    
    //Repite tres veces la información porque son 3 secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        //3
        model.getSections()
    }
    
    //Le da un titulo arriba de las tablas
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        model.getSectionTitle()
    }
    
    //Número de rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //3
        model.getCountArray()
        //Comentar para poder borrar todas las filas
//        switch section {
//        case 0: model.getCountArray()
//        case 1: 1
//        default: 2
//        }
    }
    
    //Crear la celda(s)
    //El indexPath hace un ciclo para recorrer las filas y la sección
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //permite hacer lacelda reutilizable
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MyTableViewCell
        
//        if cell == nil {
//            //Aquí se pone todas las modificaciones a la celda cuando se crea
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
//            cell?.backgroundColor = .systemBlue
//            cell?.accessoryType = .disclosureIndicator
//        }
        
        //Copia la misma información en las 3 filas
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        //cell?.textLabel?.text = model.getTitle(index: indexPath)
        //cell?.detailTextLabel?.text = model.getDescription(index: indexPath)
        
        switch indexPath.section {
        case 1: cell?.backgroundColor = .systemBlue
        case 2: cell?.backgroundColor = .systemBrown
        default: cell?.backgroundColor = .orange
        }
        
        //Para no marcar de color cuando se selecciona
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        //Alternativa
        
        
        cell?.myTitle.text = model.getTitle(index: indexPath)
        cell?.mySubTitle.text = model.getDescription(index: indexPath)
        return cell!
    }
    
    //Quitar con swipe necesitamos 3 cosas
    //1ero. -> Es el titulo de "Delete"
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Delete"
    }
    //2do -> Para salir el mensaje en el lado derecho el "Delete"
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    //3ro
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //print("Legué aquí")
            model.deleteRow(indexPath: indexPath)
            tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate {
    //Medida de la altura del header
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        150.0
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 1: 80
        case 2: 100
        default: 150
        }
    }
    
    //Obtener el valor de la celda seleccionada
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(model.getTitle(index: indexPath))
        
        //Alternativa para no cambiar el color de selccion
        //tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "segueNextScreen", sender: nil)
        
    }
}
