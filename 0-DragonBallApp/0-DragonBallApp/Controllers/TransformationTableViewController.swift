//
//  TransformationTableViewController.swift
//  0-DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 1/11/22.
//

import UIKit

class TransformationTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TRANSFORMATION"
        
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
    
}
