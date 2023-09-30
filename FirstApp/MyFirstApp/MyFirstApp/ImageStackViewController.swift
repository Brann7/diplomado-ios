//
//  ImageStackViewController.swift
//  MyFirstApp
//
//  Created by Diplomado on 29/09/23.
//

import UIKit

class ImageStackViewController: UIViewController {
    
    var showCat = false
    
    @IBOutlet weak var firstImageView: UIImageView! //Para ligar a un objeto de interfaz builder
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if showCat {
            firstImageView.image = UIImage(named: "images-2") //nombre de la imagen (está en assets)
            secondImageView.image = UIImage(named: "images-3")
            thirdImageView.image = UIImage(named: "images-4")
        }else {
            firstImageView.image = UIImage(named: "perro1") //nombre de la imagen (está en assets)
            secondImageView.image = UIImage(named: "perro2")
            thirdImageView.image = UIImage(named: "perro3")
        }
        
    }
    

}
