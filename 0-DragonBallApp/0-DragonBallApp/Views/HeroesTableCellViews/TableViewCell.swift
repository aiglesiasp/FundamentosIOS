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
    
    

    func setHero(model:Hero) {
        self.heroesTitle.text = model.name
        self.heroesDescription.text = model.description
        let url = URL(string: model.photo)
        guard let url = url else {return}
        self.heroesImage.setImage(url: url)
    }
    
    func setTransformation(model: Transformation) {
        self.heroesTitle.text = model.name
        self.heroesDescription.text = model.description
        let url = URL(string: model.photo)
        guard let url = url else {return}
        self.heroesImage.setImage(url: url)
    }
}
