//
//  HeroesTableViewController.swift
//  0-DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 1/11/22.
//

import UIKit

class HeroesTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "LISTA DE HEROES"
        
        //MARK: - REGISTRAR NUESTRA CELDA -
        tableView?.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "heroesCellView")

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    // MARK: - AQUI LE PASO EL TIPO DE CELDA -
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // MARK: - Casting de la celda -
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "heroesCellView", for: indexPath) as? TableViewCell else {
            //Si no lo encuentra devuelve una table view normal
            return UITableViewCell()
        }

        
        // TODO: - Aqui he pasado variables
        cell.heroesTitle.text = "Index \(indexPath)"
        // Configure the cell...
        return cell
    }
    
    
    // MARK: - FUNCION PARA PASAR A LA PANTALLA DETAILS
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Creo mi heroe
        let hero = Hero(
            image: UIImage(named: "fondo2") ?? UIImage(),
            name: "Index: \(indexPath)",
            description: "Index: \(indexPath)")
        
        //Creo el Detail ViewConroller
        let nextVC = DetailViewController()
        //Agregando datos
        nextVC.set(model: hero)

        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
