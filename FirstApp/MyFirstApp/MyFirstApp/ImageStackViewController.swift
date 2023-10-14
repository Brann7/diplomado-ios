//
//  ImageStackViewController.swift
//  MyFirstApp
//
//  Created by Diplomado on 29/09/23.
//

import UIKit

class ImageStackViewController: UIViewController {
    
    var showCat = false
    
    @IBOutlet weak var firstCaptionedImage: CaptionedImage! //Para ligar a un objeto de interfaz builder
    @IBOutlet weak var secondCaptionedImage: CaptionedImage!
    @IBOutlet weak var thirdCaptionedImage: CaptionedImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if showCat {
            //ImageView y el otro .image es la variable de captioned
//            firstCaptionedImage.image.image = UIImage(named: "images-2") //nombre de la imagen (está en assets)
//            firstCaptionedImage.captionLabel.text = "images-2"
//            
//            secondCaptionedImage.image.image = UIImage(named: "images-3")
//            secondCaptionedImage.captionLabel.text = "images-3"
//            
//            thirdCaptionedImage.image.image = UIImage(named: "images-4")
//            thirdCaptionedImage.captionLabel.text = "images-4"
            
            firstCaptionedImage.setContent(imagee: "images-2", caption: "images-2")
            secondCaptionedImage.setContent(imagee: "images-3", caption: "images-3")
            thirdCaptionedImage.setContent(imagee: "images-4", caption: "images-4")
        }else {
//            firstCaptionedImage.image.image = UIImage(named: "perro1") //nombre de la imagen (está en assets)
//            secondCaptionedImage.image.image = UIImage(named: "perro2")
//            thirdCaptionedImage.image.image = UIImage(named: "perro3")
            
            firstCaptionedImage.setContent(imagee: "images-2", caption: "images-2")
            secondCaptionedImage.setContent(imagee: "images-3", caption: "images-3")
            thirdCaptionedImage.setContent(imagee: "images-4", caption: "images-4")
        }
        
    }
    

}
