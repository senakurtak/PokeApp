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
    
    var pokeNameText : String?
    var abilityFirstText: String?
    var abilitySecondText: String?
    var abilityThirdText: String?
    var abilityFourthText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .pokeCoal
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
    }
}
