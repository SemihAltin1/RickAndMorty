//
//  CharacterDetailVMProtocol.swift
//  RickAndMorty
//
//  Created by Semih Altın on 10.10.2024.
//

import Foundation

protocol CharacterDetailVMProtocol {
    var characterDetail: CharacterDetailResponse? { get set }
    var delegate: CharacterDetailDelegate? { get set }
    func fetchCharacterDetail(with id: Int)
}

enum CharacterDetailNotify {
    case reloadScreen
    case error(Error)
}

protocol CharacterDetailDelegate {
    func notify(with notify: CharacterDetailNotify)
}
