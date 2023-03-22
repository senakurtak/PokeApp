//
//  ContentVC.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 21.03.2023.
//

import UIKit

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
            cell.pokeName.text = pokeName.uppercased()
            cell.pokeName.textColor = .pokeYellow
            cell.backgroundColor = .pokeCoalAlpha
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailPageVC()
        let pokeName = viewModel.pokemons[indexPath.row].name
        detailVC.pokeNameText = pokeName.uppercased()
        present(detailVC, animated: true)
    }
}

