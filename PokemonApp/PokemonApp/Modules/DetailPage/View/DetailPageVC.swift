//
//  DetailPageVC.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 21.03.2023.
//

import UIKit
import Foundation

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
    var abilityFirstText: String?
    var abilitySecondText: String?
    var abilityThirdText: String?
    var abilityFourthText: String?
    
    var viewModel = DetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        viewModel.getAbilitiesList { result in
        //            switch result {
        //            case .success(let abilityResults):
        ////                print(abilityResults.results.first?.name)
        //                print("all ability names below")
        //                for ability in abilityResults.results {
        ////                    print(ability.name)
        //                }
        ////                print(self.viewModel.pokemonAbilities)
        //                self.setUpDetailPage()
        //            case .failure(let error):
        //                print("Error retrieving ability list: \(error.localizedDescription)")
        //            }
        //        }
        
        
        viewModel.getPokemonAbilities(id: pokeID!) { result in
            switch result {
            case .success(let pokemonAbilityResults):
                print(pokemonAbilityResults.abilities)
                self.setUpDetailPage()
                print(self.viewModel.pokemonAbilities)
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
        abilityFirstText = viewModel.pokemonAbilities.first?.ability.name
        abilityFirst.text = abilityFirstText
        abilityFirst.textColor = .pokeWhite
        abilitySecond.textColor = .pokeGreen
        //        abilitySecondText = viewModel.pokemonAbilities.ability.name
        //        let abilityName = viewModel.pokemonAbilities[1].ability.name
        abilitySecond.text = abilitySecondText
        abilityThird.textColor = .pokeGreen
        abilityFourth.textColor = .pokeGreen
        pokeName.text = pokeNameText
        let urlString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(pokeID ?? 1).png"
        pokeImage.sd_setImage(with: URL(string: urlString))
        view.backgroundColor = .pokeCoalAlpha
    }
}
