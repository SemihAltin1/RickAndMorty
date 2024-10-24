//
//  CharacterDetailVM.swift
//  RickAndMorty
//
//  Created by Semih Altın on 10.10.2024.
//

import Foundation

final class CharacterDetailVM: CharacterDetailVMProtocol {
    var characterDetail: CharacterDetailResponse?
    var delegate: CharacterDetailDelegate?
    private let dataProvider: CharactersDataProviderProtocol
    
    
    init(dataProvider: CharactersDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    func fetchCharacterDetail(with id: Int) {
        dataProvider.fetchCharacterDetail(id: id) { result in
            switch result {
            case .success(let characterDetail):
                self.characterDetail = characterDetail
                self.delegate?.notify(with: .reloadScreen)
                break
            case .failure(let error):
                self.delegate?.notify(with: .error(error))
                break
            }
        }
    }
    
    
}
