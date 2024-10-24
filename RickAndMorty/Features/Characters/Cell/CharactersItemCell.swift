//
//  CharactersItemCell.swift
//  RickAndMorty
//
//  Created by Semih Altın on 10.10.2024.
//

import UIKit

class CharactersItemCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepareCharacterCell(with model: CharacterItemCellVM) {
        characterNameLabel.text = model.characterName
        setupCharacterImageView(imageUrl: model.characterImage)
    }
    
    private func setupCharacterImageView(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil { return }
            guard let data else { return }
            DispatchQueue.main.async {
                self.characterImageView.image = UIImage(data: data)
            }
        }.resume()
    }
    
}
