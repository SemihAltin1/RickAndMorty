//
//  CharactersVM.swift
//  RickAndMorty
//
//  Created by Semih Altın on 9.10.2024.
//

import Foundation

final class CharactersVM: CharactersVMProtocol {
    var characters: [CharactersResultResponse] = []
    var delegate: CharactersVMDelegate?
    private var nextUrl: String?
    let dataProvider: CharactersDataProviderProtocol
    
    init(dataProvider: CharactersDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    func fetchCharacters() {
        dataProvider.fetchCharacters(nextUrl: nextUrl) { result in
            switch result {
            case .success(let response):
                self.characters.append(contentsOf: response.results ?? [])
                self.nextUrl = response.info?.next ?? ""
                self.delegate?.notif(with: .reloadTableView)
                break
            case .failure(let error):
                self.delegate?.notif(with: .error(error))
                break
            }
        }
    }
    
    
}
