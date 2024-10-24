//
//  CharacterItemCellVM.swift
//  RickAndMorty
//
//  Created by Semih Altın on 10.10.2024.
//

import Foundation

final class CharacterItemCellVM {
    
    private let model: CharactersResultResponse
    
    init(model: CharactersResultResponse) {
        self.model = model
    }
    
    var characterName: String { model.name ?? "" }
    var characterImage: String { model.image ?? "" }
    
}
