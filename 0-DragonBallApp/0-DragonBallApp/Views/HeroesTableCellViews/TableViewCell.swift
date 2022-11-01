//
//  TableViewCell.swift
//  0-DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 1/11/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    //Link de los 3 componenetes
    @IBOutlet weak var heroesImage: UIImageView!
    @IBOutlet weak var heroesTitle: UILabel!
    @IBOutlet weak var heroesDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
