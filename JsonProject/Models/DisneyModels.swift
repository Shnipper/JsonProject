//
//  DisneyModels.swift
//  JsonProject
//
//  Created by Евгений Волошенко on 19.04.2022.
//

import Foundation

struct DisneyData: Decodable {
    var data: [DisneyCharacter]?
}

struct DisneyCharacter: Decodable {
    var _id: Int?
    var name: String?
    var imageUrl: String?
}
