//
//  NetworkData.swift
//  JsonProject
//
//  Created by Евгений Волошенко on 19.04.2022.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()

    func fetchData(from url: String?, with completion: @escaping(DisneyData) -> Void) {
        guard let stringUrl = url else { return }
        guard let url = URL(string: stringUrl) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let disneyData = try JSONDecoder().decode(DisneyData.self, from: data)
                DispatchQueue.main.async {
                    completion(disneyData)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }

    private init() {}
}
