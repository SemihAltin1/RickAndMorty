//
//  CharactersResponse.swift
//  RickAndMorty
//
//  Created by Semih Altın on 9.10.2024.
//

import Foundation

struct CharactersResponse: Decodable {
    let info: CharactersInfoResponse?
    let results: [CharactersResultResponse]?
}

struct CharactersInfoResponse: Decodable {
    let next: String?
    let prev: String?
}

struct CharactersResultResponse: Decodable {
    let id: Int?
    let name: String?
    let image: String?
}
