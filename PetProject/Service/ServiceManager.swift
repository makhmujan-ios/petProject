//
//  ServiceManager.swift
//  PetProject
//
//  Created by Niyazov Makhmujan on 07.01.2023.
//

import Foundation

protocol ServiceMangerProtocol: AnyObject {
    func fetchNews(completion: @escaping (Result<MainModel, Error>) -> Void)
}

class ServiceManager: ServiceMangerProtocol {
    let apiKey = "KTrWKdNZXY5wmN98XAoUi3RK6C3JES1j"
    
    func fetchNews(completion: @escaping (Result<MainModel, Error>) -> Void) {
        let urlString = "https://api.nytimes.com/svc/topstories/v2/world.json?api-key=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let decoder = JSONDecoder()
                guard let data = data else { return }
                let response = try decoder.decode(MainModel.self, from: data)
                print(response)
                completion(.success(response))
          } catch {
              completion(.failure(error))
            }
        }.resume()
    }
}
