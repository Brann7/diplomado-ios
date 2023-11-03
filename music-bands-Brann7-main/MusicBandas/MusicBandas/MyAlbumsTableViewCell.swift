//
//  MyAlbumsTableViewCell.swift
//  MusicBandas
//
//  Created by Diplomado on 30/10/23.
//

import UIKit

class MyAlbumsTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNameAlbum: UILabel!
    @IBOutlet weak var imageAlbum: UIImageView!
    @IBOutlet weak var labelYearAlbum: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
    }
    
}
