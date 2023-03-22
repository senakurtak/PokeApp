//
//  ContentVC.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 21.03.2023.
//

import UIKit
import SDWebImage

class ContentVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = ContentVM()
    var pokeID : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getPokemonList { result in
            switch result {
            case .success(let pokemonResults):
                print(pokemonResults.results.first?.name)
                print("all pokemon names below")
                for pokemon in pokemonResults.results {
                    print(pokemon.name)
                }
                self.collectionView.reloadData()
            case .failure(let error):
                print("Error retrieving Pokemon list: \(error.localizedDescription)")
            }
        }
        self.collectionView.reloadData()
        configure()
    }
    
    func configure(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ContentCVC", bundle: nil), forCellWithReuseIdentifier: "ContentCVC")
    }
    
}

extension ContentVC : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCVC", for: indexPath) as! ContentCVC
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = true
        if indexPath.row < viewModel.pokemons.count {
            let pokeName = viewModel.pokemons[indexPath.row].name
            let url = viewModel.pokemons[indexPath.row].url // https://pokeapi.co/api/v2/pokemon/1/
            let start = url.index(url.startIndex, offsetBy: 34)
            let end = url.index(url.endIndex, offsetBy: -1)
            let range = start..<end
            let subStr = url[range]
            self.pokeID = Int(subStr)
            let urlString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(pokeID ?? 1).png"
            cell.pokeImage.sd_setImage(with: URL(string: urlString))
            cell.pokeName.text = pokeName.uppercased()
            cell.pokeName.textColor = .pokeYellow
            cell.backgroundColor = .pokeCoalAlpha
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailPageVC()
        let pokeName = viewModel.pokemons[indexPath.row].name
        let url = viewModel.pokemons[indexPath.row].url // https://pokeapi.co/api/v2/pokemon/1/
        let start = url.index(url.startIndex, offsetBy: 34)
        let end = url.index(url.endIndex, offsetBy: -1)
        let range = start..<end
        let subStr = url[range]
        detailVC.pokeID = Int(subStr)
        detailVC.pokeNameText = pokeName.uppercased()
        self.pokeID = Int(subStr)
        present(detailVC, animated: true)
    }
}

