//
//  CharactersDataProvider.swift
//  RickAndMorty
//
//  Created by Semih Altın on 9.10.2024.
//

import Foundation

final class CharactersDataProvider: CharactersDataProviderProtocol {
    let serviceManager: CharactersServiceManagerProtocol
    init(serviceManager: CharactersServiceManagerProtocol) {
        self.serviceManager = serviceManager
    }
    
    func fetchCharacters(nextUrl: String?, completion: @escaping (Result<CharactersResponse, any Error>) -> ()) {
        serviceManager.fetchCharacters(nextUrl: nextUrl, completion: completion)
    }
    
    func fetchCharacterDetail(id: Int, completion: @escaping (Result<CharacterDetailResponse, any Error>) -> ()) {
        serviceManager.fetchCharacterDetail(id: id, completion: completion)
    }
    
}
