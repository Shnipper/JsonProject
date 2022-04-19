//
//  TableViewController.swift
//  JsonProject
//
//  Created by Евгений Волошенко on 19.04.2022.
//

import UIKit

class DisneyCharactersViewController: UITableViewController {
    
//    private var disneyData: DisneyData?
//    private let urlString = "https://api.disneyapi.dev/characters"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 110
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NetworkManager.shared.disneyData?.data?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "disneyCharacter", for: indexPath) as! DisneyCharacterCell
        guard let character =  NetworkManager.shared.disneyData?.data?[indexPath.row] else { return cell }
        cell.configure(with: character)
        return cell
    }

//    func fetchData() {
//        guard let url = URL(string: urlString) else { return }
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            do {
//                self.disneyData = try JSONDecoder().decode(DisneyData.self, from: data)
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            } catch let error {
//                print(error.localizedDescription)
//            }
//        }.resume()
//    }

}
