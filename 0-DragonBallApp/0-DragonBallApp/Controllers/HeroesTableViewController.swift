//
//  HeroesTableViewController.swift
//  0-DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 1/11/22.
//

import UIKit

class HeroesTableViewController: UITableViewController {
    
    //DECLARAMOS UN ARRAY DE HEROES
    var heroes: [Hero] = []
       
    //MARK: - FUNCION VISUAL
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "LISTA DE HEROES"
        
        //MARK: - REGISTRAR NUESTRA CELDA -
        tableView?.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "heroesCellView")
        
        //MARK: - LLAMADA A RED -
        let networkModel = NetworkModel.shared
        networkModel.getHeroes { [weak self] heroes, _ in
            guard let self = self else { return }
            self.heroes = heroes
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        
    }

    // MARK: - Table view data source -
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return heroes.count
    }

    
    // MARK: - AQUI LE PASO EL TIPO DE CELDA -
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // MARK: - Casting de la celda
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "heroesCellView", for: indexPath) as? TableViewCell else {
            //Si no lo encuentra devuelve una table view normal
            return UITableViewCell()
        }

        // TODO: - Aqui he pasado variables
        cell.setHero(model: heroes[indexPath.row])
        // Configure the cell...
        return cell
    }
    
    
    // MARK: - FUNCION PARA PASAR A LA PANTALLA DETAILS -
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Creo el Detail ViewConroller
        let nextVC = DetailViewController()
        //Le paso la lista de heroes
        nextVC.set(model: heroes[indexPath.row])
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
