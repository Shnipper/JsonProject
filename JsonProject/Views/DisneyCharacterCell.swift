//
//  DisneyCharacterCell.swift
//  JsonProject
//
//  Created by Евгений Волошенко on 19.04.2022.
//

import UIKit

class DisneyCharacterCell: UITableViewCell {

    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var characterNameLabel: UILabel!
    
    func configure(with disneyCharacter: DisneyCharacter) {
        
        characterNameLabel.text = disneyCharacter.name
        
        NetworkManager.shared.fetchImage(from: disneyCharacter.imageUrl) { result in
            switch result {
            case .success(let imageData):
                self.characterImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
