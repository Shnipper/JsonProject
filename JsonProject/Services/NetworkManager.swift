//
//  NetworkData.swift
//  JsonProject
//
//  Created by Евгений Волошенко on 19.04.2022.
//

import Foundation
import Alamofire

enum Link: String {
    case disneyData = "https://api.disneyapi.dev/characters"
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

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
    
    func fetchDataWithAlamofire(from url: String, with completion: @escaping(Result<[DisneyCharacter], NetworkError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponce in
                switch dataResponce.result {
                case .success(let value):
                    print(value)
                    let disneyCharacters = DisneyData.getDisneyCharacters(from: value)
                    DispatchQueue.main.async {
                        completion(.success(disneyCharacters))
                    }
                case .failure(_):
                    completion(.failure(.decodingError))
                }
            }
    }
    
    func fetchImage(from url: String?, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }

    private init() {}
}
