//
//  CharacterDetailResponse.swift
//  RickAndMorty
//
//  Created by Semih Altın on 10.10.2024.
//

import Foundation

struct CharacterDetailResponse: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let image: String?
}
