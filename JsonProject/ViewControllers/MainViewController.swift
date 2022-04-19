//
//  ViewController.swift
//  JsonProject
//
//  Created by Евгений Волошенко on 19.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchData()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let tableViewController = segue.destination as? DisneyCharactersViewController else { return }
//        NetworkManager.shared.fetchData()
//        tableViewController.fetchData()
//        tableViewController.tableView.reloadData()
//    }
}

