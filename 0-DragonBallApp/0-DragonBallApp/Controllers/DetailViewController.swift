//
//  DetailViewController.swift
//  0-DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 1/11/22.
//

import UIKit

class DetailViewController: UIViewController {

    // Linkeo componenetes
    @IBOutlet weak var heroeImage: UIImageView!
    @IBOutlet weak var heroeName: UILabel!
    @IBOutlet weak var heroeDescription: UITextView!
    
    
    //Declaro variable simple de heroe
    private var hero: Hero?
    
    
    //MARK: - CARGAR LA VISTA DE DETAIL -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "HEROE"
        
        guard let hero = hero else { return }
        
        self.heroeImage.setImage(url: hero.photo)
        self.heroeName.text = hero.name
        self.heroeDescription.text = hero.description

    }
    
    //MARK: - FUNCION PARA SETEAR UN HEROE -
    func set(model: Hero) {
        hero = model
    }
    
    
    
    //MARK: - BOTON QUE LLAMA A LAS TRANSFORMACIONES -
    @IBAction func onTransformationButtonTap(_ sender: Any) {
        let nextVC = TransformationTableViewController()
        nextVC.set(heroId: hero?.id ?? "")
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
