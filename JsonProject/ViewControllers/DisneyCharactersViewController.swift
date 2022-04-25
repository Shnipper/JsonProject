//
//  TableViewController.swift
//  JsonProject
//
//  Created by Евгений Волошенко on 19.04.2022.
//

import UIKit

class DisneyCharactersViewController: UITableViewController {
    
    private var disneyCharacters: [DisneyCharacter]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 110
        
        NetworkManager.shared.fetchData(from: "https://api.disneyapi.dev/characters") { disneyData in
            guard let disneyCharacters = disneyData.data else { return }
            self.disneyCharacters = disneyCharacters
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        disneyCharacters?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "disneyCharacter", for: indexPath) as! DisneyCharacterCell
        guard let character =  disneyCharacters?[indexPath.row] else { return cell }
        cell.configure(with: character)
        return cell
    }
}
