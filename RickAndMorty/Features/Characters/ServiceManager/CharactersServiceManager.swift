//
//  CharactersServiceManager.swift
//  RickAndMorty
//
//  Created by Semih Altın on 9.10.2024.
//

import Foundation

final class CharactersServiceManager: CharactersServiceManagerProtocol {
    
    func fetchCharacterDetail(id: Int, completion: @escaping (Result<CharacterDetailResponse, any Error>) -> ()) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(id)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error {
                completion(.failure(error))
            } else {
                guard let data else { return }
                do {
                    let jsonDecoder = JSONDecoder()
                    let decodedData = try jsonDecoder.decode(CharacterDetailResponse.self, from: data)
                    DispatchQueue.main.async { completion(.success(decodedData)) }
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    
    func fetchCharacters(nextUrl: String?, completion: @escaping (Result<CharactersResponse, any Error>) -> ()) {
        guard let url = URL(string: nextUrl ?? "https://rickandmortyapi.com/api/character") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error {
                completion(.failure(error))
            } else {
                guard let data else { return }
                do {
                    let jsonDecoder = JSONDecoder()
                    let decodedData = try jsonDecoder.decode(CharactersResponse.self, from: data)
                    DispatchQueue.main.async { completion(.success(decodedData)) }
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
}
