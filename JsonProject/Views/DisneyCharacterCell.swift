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
        
        DispatchQueue.global().async {
            guard let url = URL(string: disneyCharacter.imageUrl ?? "") else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.characterImage.image = UIImage(data: imageData)
            }
        }
    }
}
