//
//  CharactersVC.swift
//  RickAndMorty
//
//  Created by Semih Altın on 9.10.2024.
//

import UIKit

final class CharactersVC: UIViewController {
    
    //MARK: - IBOUTLETS
    @IBOutlet weak var charactersTableView: UITableView!
    
    //MARK: - PROPERTIES
    var viewModel: CharactersVMProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        registerCell()
        setupNavigator()
    }

    //MARK: - PRIVATE FUNCTIONS
    private func setupViewModel() {
        viewModel?.fetchCharacters()
    }
    private func registerCell() {
        let charactersItemCellName = String(describing: CharactersItemCell.self)
        let chatacyersItemcCellNib = UINib(nibName: charactersItemCellName, bundle: .main)
        charactersTableView.register(chatacyersItemcCellNib, forCellReuseIdentifier: charactersItemCellName)
    }
    private func setupNavigator() {
        navigationItem.title = "Characters"
    }
}

//MARK: - EXTENSIONS
extension CharactersVC: CharactersVMDelegate {
    func notif(with notify: CharactersVMNotify) {
        switch notify {
        case .reloadTableView:
            charactersTableView.reloadData()
            break
        case .error(let error):
            print("Error \(error.localizedDescription)")
            break
        }
    }
}

extension CharactersVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let count = viewModel?.characters.count else { return }
        if indexPath.row == count - 1 {
            viewModel?.fetchCharacters()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let characterItem = viewModel?.characters[indexPath.row] else { return }
        let serviceManager = CharactersServiceManager()
        let dataProvider = CharactersDataProvider(serviceManager: serviceManager)
        let characterDetailVM = CharacterDetailVM(dataProvider: dataProvider)
        let characterDetailVC = CharacterDetailVC()
        characterDetailVC.characterId = characterItem.id
        characterDetailVC.viewModel = characterDetailVM
        navigationController?.pushViewController(characterDetailVC, animated: true)
    }
}

extension CharactersVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = viewModel?.characters.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharactersItemCell.self), for: indexPath) as? CharactersItemCell {
            guard let characterItem = viewModel?.characters[indexPath.row] else { return UITableViewCell() }
            let characterItemCellVM = CharacterItemCellVM(model: characterItem)
            cell.prepareCharacterCell(with: characterItemCellVM)
            return cell
        }
        return UITableViewCell()
    }
    
    
}
