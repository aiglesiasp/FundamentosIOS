//
//  TransformationTableViewController.swift
//  0-DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 1/11/22.
//

import UIKit

class TransformationTableViewController: UITableViewController {
    
    //DECLARAMOS ARRAY DE TRANSFORMACIONS
    var transformaciones: [Transformation] = []
    var heroId: String?
    
    func set(heroId: String) {
        self.heroId = heroId
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TRANSFORMATION"
        
        //MARK: - REGISTRAR NUESTRA CELDA -
        tableView?.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "heroesCellView")
        //MARK: CONSEGUIMOS EL TOKEN
        guard let token = LocalDataModel.getToken() else {return}
        //MARK: - LLAMADA A RED -
        let networkModel = NetworkModel(token: token)
        guard let heroId else {return}
        networkModel.getTransformation(id: heroId) { [weak self] transformaciones, _ in
            guard let self = self else {return}
            let trans = transformaciones
            self.transformaciones = trans.sorted {
                $0.name.localizedStandardCompare($1.name) == .orderedAscending
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return transformaciones.count
    }
    
    // MARK: - AQUI LE PASO EL TIPO DE CELDA -
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // MARK: - Casting de la celda -
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "heroesCellView", for: indexPath) as? TableViewCell else {
            //Si no lo encuentra devuelve una table view normal
            return UITableViewCell()
        }

        
        // TODO: - Aqui he pasado variables
        //cell.heroesTitle.text = "Index: \(indexPath)"
        cell.setTransformation(model: transformaciones[indexPath.row])
        // Configure the cell...
        return cell
    }
    
    
    //MARK: - Aqui paso al detalle de tranformaciones
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextVC = DetailTransformationViewController()
        nextVC.set(model: transformaciones[indexPath.row])
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
