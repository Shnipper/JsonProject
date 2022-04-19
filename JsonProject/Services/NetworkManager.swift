//
//  NetworkData.swift
//  JsonProject
//
//  Created by Евгений Волошенко on 19.04.2022.
//

import Foundation

class NetworkManager {

    static var shared = NetworkManager()

    private let urlString = "https://api.disneyapi.dev/characters"
    var disneyData: DisneyData?

    func fetchData() {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                self.disneyData = try JSONDecoder().decode(DisneyData.self, from: data)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }

    private init() {}

}
