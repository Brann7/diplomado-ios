//
//  MyBandsTableViewCell.swift
//  MusicBandas
//
//  Created by Diplomado on 30/10/23.
//

import UIKit

class MyBandsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageBand: UIImageView!
    @IBOutlet weak var labelNameBand: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
