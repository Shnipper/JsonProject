//
//  TableViewController.swift
//  JsonProject
//
//  Created by Евгений Волошенко on 19.04.2022.
//

import UIKit

class DisneyCharactersViewController: UITableViewController {
    
    private var disneyCharacters: [DisneyCharacter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 110
        
//        Fetch without Alamofire
//        NetworkManager.shared.fetchData(from: Link.disneyData.rawValue) { disneyData in
//            guard let disneyCharacters = disneyData.data else { return }
//            self.disneyCharacters = disneyCharacters
//            self.tableView.reloadData()
//        }

        NetworkManager.shared.fetchDataWithAlamofire(from: Link.disneyData.rawValue) { result in
            switch result {
            case .success(let disneyCharacters):
                self.disneyCharacters = disneyCharacters
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        disneyCharacters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "disneyCharacter", for: indexPath) as! DisneyCharacterCell
        let character =  disneyCharacters[indexPath.row]
        cell.configure(with: character)
        return cell
    }
}
