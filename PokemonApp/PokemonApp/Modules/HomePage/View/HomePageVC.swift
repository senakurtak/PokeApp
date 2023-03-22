//
//  HomePageVC.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 21.03.2023.
//

import UIKit

class HomePageVC: UIViewController {
    
    @IBAction func startButton(_ sender: Any) {
        let contentVC = ContentVC()
        contentVC.modalPresentationStyle = .fullScreen
        present(contentVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .pokeBlack
    }

}
