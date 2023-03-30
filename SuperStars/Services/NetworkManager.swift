//
//  NetworkManager.swift
//  SuperStars
//
//  Created by Bektemur Mamashayev on 30/03/23.
//

import Foundation
import Alamofire



final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(completion: @escaping(Result<[Superhero], AFError>) -> Void) {
        guard let url = URL(string: "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/all.json") else {
            return
        }
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    guard let superheroes = try? JSONDecoder().decode([Superhero].self, from: data) else {
                        return
                    }
                    completion(.success(superheroes))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
