//
//  LoginViewController.swift
//  0-DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 1/11/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    //Linkeo los componenetes de la View
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    
    //Carga de la pantalla
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Boton para pasar entre pantallas.
    @IBAction func onLoginButtonTap(_ sender: Any) {
        let nextVC = HeroesTableViewController()
        navigationController?.setViewControllers([nextVC], animated: true)
    }
}
