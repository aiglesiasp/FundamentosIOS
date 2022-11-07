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
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //Carga de la pantalla
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Boton para pasar entre pantallas -
    @IBAction func onLoginButtonTap(_ sender: Any) {
        //Creo las variables necesarias. Llamada a mi NetworkModel y a los componenetes de la pantalla
        let model = NetworkModel.shared
        let user = username.text ?? ""
        let password = password.text ?? ""
        let nextVC = HeroesTableViewController()
        
        //Compruebo que las variables USER y PASSWORD no esten vacias
        guard !user.isEmpty, !password.isEmpty else {
            self.showAlert(title: "Missing fields", message: "Please complete all fields to login")
            return
        }
        
        //Deshabilito el boton y habilito el ActivityIndicator
        loginButton.isEnabled = false
        activityIndicator.startAnimating()
        
        //Ahora llamo a la funcion login del Model
        model.login(user: user, password: password) { [weak self] token, error in
            
            DispatchQueue.main.async {
                //Acivo boton y desactivo indicator
                self?.loginButton.isEnabled = true
                self?.activityIndicator.stopAnimating()
                
                if let error = error {
                    self?.showAlert(title: "There was an error", message: error.localizedDescription)
                    return
                }
                //Compruebo que el token no esta vacio y son iguales
                guard let token = token, !token.isEmpty else {
                    self?.showAlert(title: "There is no Token")
                    return
                    
                }

                //Llamo a la siguiente vista
                self?.navigationController?.setViewControllers([nextVC], animated: true)
            }
        }
    }
}


