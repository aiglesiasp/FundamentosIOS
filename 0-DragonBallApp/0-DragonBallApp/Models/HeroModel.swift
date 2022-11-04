//
//  HeroModel.swift
//  0-DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 2/11/22.
//

import UIKit


// MARK: - CLASSE HEROE -
struct Hero: Decodable {
    let id: String
    let name: String
    let description: String
    let photo: URL
    let favorite: Bool
}

