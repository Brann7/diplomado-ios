//
//  CollectionViewController.swift
//  ColletionTableView
//
//  Created by Diplomado on 03/11/23.
//

import UIKit

class CollectionViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        }
    }
    
    //Dividimos la pantalla a la mitad
    let size = UIScreen.main.bounds.width / 2
    
    var dataArray = ["Manuel","Grecia","Alejandro","Diplomado"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //Presionamos una celda y la movemos arrastrándola
        //Target: Quien lo utiliza
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressgesture))
        collectionView.addGestureRecognizer(longPressGesture)
    }
    
    @objc private func handleLongPressgesture(_ gesture: UILongPressGestureRecognizer) {
        let gestureLocation = gesture.location(in: collectionView)//posicion cuando presionamos
        switch gesture.state {
        case .began:
            guard let tarjetIndexPath = collectionView.indexPathForItem(at: gestureLocation) else { return }
            collectionView.beginInteractiveMovementForItem(at: tarjetIndexPath)
            
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gestureLocation)
            
        case .ended:
            //Hace el cambio entre celdas
            collectionView.endInteractiveMovement()
        
        default:
            collectionView.cancelInteractiveMovement()
        }
    }

    @IBAction func addButton(_ sender: UIButton) {
        dataArray.append(textField.text ?? "")
        textField.text = ""
        collectionView.reloadData()
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //200
        dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCollectionViewCell
        cell?.myTextLabel.text = dataArray[indexPath.row]
        //cell?.myTextLabel.text = "Holi"
        return cell!
    }
    
}

extension CollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Imprimir la celda seleccionada
        print(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = dataArray.remove(at: sourceIndexPath.row)
        dataArray.insert(item, at: destinationIndexPath.row)
        collectionView.reloadData()
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    //Tamaño de la celda
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: size, height: size)
        } else {
            return CGSize( width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            
        }
        
    }
    
}
