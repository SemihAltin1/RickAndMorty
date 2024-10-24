//
//  CharactersVMProtocol.swift
//  RickAndMorty
//
//  Created by Semih Altın on 9.10.2024.
//

import Foundation

protocol CharactersVMProtocol {
    var characters: [CharactersResultResponse] { get set }
    var delegate: CharactersVMDelegate? { get set }
    func fetchCharacters()
}

enum CharactersVMNotify {
    case reloadTableView
    case error(Error)
}

protocol CharactersVMDelegate {
    func notif(with notify: CharactersVMNotify)
}
