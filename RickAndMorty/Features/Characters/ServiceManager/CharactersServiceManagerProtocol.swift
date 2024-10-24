//
//  CharactersServiceManagerProtocol.swift
//  RickAndMorty
//
//  Created by Semih Altın on 9.10.2024.
//

import Foundation

protocol CharactersServiceManagerProtocol {
    func fetchCharacters(nextUrl: String?, completion: @escaping (Result<CharactersResponse, Error>) -> ())
    func fetchCharacterDetail(id: Int, completion: @escaping (Result<CharacterDetailResponse, Error>) -> ())
}
