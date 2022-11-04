//
//  TransformationModel.swift
//  0-DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 4/11/22.
//

import UIKit


// MARK: - CLASSE HEROE -
struct Transformation: Decodable {
    let id: String
    let name: String
    let description: String
    let photo: URL
}
