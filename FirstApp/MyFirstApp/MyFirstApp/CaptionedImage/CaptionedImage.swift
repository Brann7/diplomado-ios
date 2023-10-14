//
//  CaptionedImage.swift
//  MyFirstApp
//
//  Created by Diplomado on 13/10/23.
//

import UIKit

class CaptionedImage: UIView {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    //Hay que decirle dónde se encuentran las vistas
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    func setContent(imagee: String, caption: String?){
        captionLabel.text = caption
        captionLabel.isHidden = caption == nil
        image.image = UIImage(named: imagee)
    }
    
    private func setUpView(){
        //Nombre de la view como primer parametro
        
        //"da forma de hacer
//        guard let contentView = Bundle.main.loadNibNamed("CaptionedImage", owner: self)?.first as? UIView else {return}
        
        //3ra forma de hacer, la primera fue desde la interfaz
        guard let contentView = UINib(nibName: "CaptionedImage", bundle: nil).instantiate(withOwner: self).first as? UIView else {return}
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        //Cómo la vamos a agregar y acomodar
        addSubview(contentView)
        topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }

}
