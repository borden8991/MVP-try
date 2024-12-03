//
//  NetworkService.swift
//  MVP Try
//
//  Created by Vasily Maslov on 30.11.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment], Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment], any Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error{
                completion(.failure(error))
                return
            }

            do {
                let obj = try JSONDecoder().decode([Comment].self, from: data ?? Data())
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }


}
