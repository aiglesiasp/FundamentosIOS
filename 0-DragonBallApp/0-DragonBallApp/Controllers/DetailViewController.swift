//
//  DetailViewController.swift
//  0-DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 1/11/22.
//

import UIKit

// MARK: - CLASSE HEROE -
struct Hero {
    let image: UIImage
    let name: String
    let description: String
}



class DetailViewController: UIViewController {

    // Linkeo componenetes
    @IBOutlet weak var heroeImage: UIImageView!
    @IBOutlet weak var heroeName: UILabel!
    @IBOutlet weak var heroeDescription: UITextView!
    
    private var hero: Hero?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "HEROE"
        
        guard let hero = hero else { return }
        
        self.heroeImage.image = hero.image
        self.heroeName.text = hero.name
        self.heroeDescription.text = hero.description

    }
    func set(model: Hero) {
        hero = model
    }
    
    @IBAction func onTransformationButtonTap(_ sender: Any) {
        let nextVC = TransformationTableViewController()
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
