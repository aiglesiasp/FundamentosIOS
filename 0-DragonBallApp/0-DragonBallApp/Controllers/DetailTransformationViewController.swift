//
//  DetailTransformationViewController.swift
//  0-DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 4/11/22.
//

import UIKit

class DetailTransformationViewController: UIViewController {
    
    //LINKEO COMPONENETES
    @IBOutlet weak var imageTransformation: UIImageView!
    @IBOutlet weak var titleTransformation: UILabel!
    @IBOutlet weak var descriptionTransformation: UITextView!
    
    //DECLARO VARIABLE TRANSFORMACIONES
    private var transformation: Transformation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TRANSFORMATION"

        guard let transformation = transformation else {return}
        
        self.imageTransformation.setImage(url: transformation.photo)
        self.titleTransformation.text = transformation.name
        self.descriptionTransformation.text = transformation.description
        
    }
    
    //MARK: FUNCION PARA SETEAR UNA TRANSFORMACION
    func set(model: Transformation) {
        transformation = model
    }

}

