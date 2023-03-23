//
//  DetailPageVC.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 21.03.2023.
//

import UIKit
import Foundation

protocol PokemonSelectionDelegate {
    func didSelectPokemon(id: Int)
}

class DetailPageVC: UIViewController {
    
    @IBOutlet weak var pokeName: UILabel!
    
    @IBOutlet weak var pokeImage: UIImageView!
    
    @IBOutlet weak var abilitiesTitle: UILabel!
    
    @IBOutlet weak var abilityFirst: UILabel!
    
    @IBOutlet weak var abilitySecond: UILabel!
    
    @IBOutlet weak var abilityThird: UILabel!
    
    @IBOutlet weak var abilityFourth: UILabel!
    
    var pokeID: Int?
    var pokeNameText : String?
    var delegate: PokemonSelectionDelegate?

    var abilityFirstText: String?
    var abilitySecondText: String?
    var abilityThirdText: String?
    var abilityFourthText: String?
    var viewModel = DetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPokemonAbilities(id: pokeID!) { result in
            switch result {
            case .success(let pokemonAbilityResults):
                self.setUpDetailPage()
                if let firstAbilityName = pokemonAbilityResults.abilities.first?.ability.name {
                    self.abilityFirst.text = firstAbilityName.uppercased()
                } else {
                    self.abilityFirst.text = ""
                }
                if pokemonAbilityResults.abilities.count > 1, let secondAbilityName = pokemonAbilityResults.abilities[1].ability.name {
                    self.abilitySecond.text = secondAbilityName.uppercased()
                } else {
                    self.abilitySecond.text = ""
                }
                if pokemonAbilityResults.abilities.count > 2, let thirdAbilityName = pokemonAbilityResults.abilities[2].ability.name {
                    self.abilityThird.text = thirdAbilityName.uppercased()
                } else {
                    self.abilityThird.text = ""
                }
                if pokemonAbilityResults.abilities.count > 3, let fourthAbilityName = pokemonAbilityResults.abilities[3].ability.name {
                    self.abilityFourth.text = fourthAbilityName.uppercased()
                } else {
                    self.abilityFourth.text = ""
                }
            case .failure(let error):
                print("Error retrieving Pokemon Abilities \(error.localizedDescription)")
            }
        }
        setUpDetailPage()
    }
    
    func setUpDetailPage(){
        pokeName.textColor = .red
        pokeImage.layer.cornerRadius = 5
        abilitiesTitle.textColor = .pokeYellow
        abilityFirst.textColor = .pokeGreen
        abilitySecond.textColor = .pokeGreen
        abilityThird.textColor = .pokeGreen
        abilityFourth.textColor = .pokeGreen
        pokeName.text = pokeNameText
        
        viewModel.getPokemonImage(id: pokeID!) { result in
            switch result {
            case .success(let imageURL):
                self.pokeImage.sd_setImage(with: URL(string: imageURL ?? "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1"))
            case .failure(let error):
                print("Error retrieving Pokemon image: \(error)")

            }
        }
        view.backgroundColor = .pokeCoalAlpha
    }
}
