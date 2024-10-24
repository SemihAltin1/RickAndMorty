//
//  CharacterDetailVC.swift
//  RickAndMorty
//
//  Created by Semih Altın on 10.10.2024.
//

import UIKit

final class CharacterDetailVC: UIViewController {

    //MARK: - IBOUTLETS
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterIdLabel: UILabel!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterStatusLabel: UILabel!
    @IBOutlet weak var characterSpeciesLabel: UILabel!
    @IBOutlet weak var characterTypeLabel: UILabel!
    @IBOutlet weak var characterGenderLabel: UILabel!
    
    
    //MARK: - PROPERTIES
    var characterId: Int?
    var viewModel: CharacterDetailVM? {
        didSet {
            viewModel?.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    
    //MARK: - PRIVATE FUNCTIONS
    private func setupViewModel(){
        guard let characterId else { return }
        viewModel?.fetchCharacterDetail(with: characterId)
    }
    private func reloadScreen(){
        guard let characterInfo = viewModel?.characterDetail else { return }
        characterIdLabel.text = "Id: \(String(characterInfo.id ?? 0))"
        characterNameLabel.text = "Name: \(characterInfo.name ?? "")"
        characterStatusLabel.text = "Status: \(characterInfo.status ?? "")"
        characterSpeciesLabel.text = "Species: \(characterInfo.species ?? "")"
        characterTypeLabel.text = "Type: \(characterInfo.type ?? "")"
        characterGenderLabel.text = "Gender: \(characterInfo.gender ?? "")"
        setupCharacterImageView(imageUrl: characterInfo.image)
    }
    private func setupCharacterImageView(imageUrl: String?) {
        guard let url = URL(string: imageUrl ?? "") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print("Character Image Error: \(error.localizedDescription)")
                return
            }
            guard let data else { return }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.characterImageView.image = image
            }
        }.resume()
        
    }

}

extension CharacterDetailVC: CharacterDetailDelegate {
    func notify(with notify: CharacterDetailNotify) {
        switch notify {
        case .reloadScreen:
            reloadScreen()
            break
        case .error(_):
            break
        }
    }
}
