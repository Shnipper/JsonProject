//
//  DisneyModels.swift
//  JsonProject
//
//  Created by Евгений Волошенко on 19.04.2022.
//

import Foundation

struct DisneyData: Decodable {
    
    var data: [DisneyCharacter]?
    
    static func getDisneyCharacters(from value: Any) -> [DisneyCharacter] {
        guard let disneyData = value as? [String: Any] else { return [] }
        guard let disneyCharacters = disneyData["data"] as? [[String: Any]] else { return [] }
        return disneyCharacters.compactMap { DisneyCharacter(disneyCharacters: $0) }
    }
}

struct DisneyCharacter: Decodable {

    var name: String?
    var imageUrl: String?
    
    init(disneyCharacters: [String: Any]) {
        name = disneyCharacters["name"] as? String
        imageUrl = disneyCharacters["imageUrl"] as? String
    }
}
