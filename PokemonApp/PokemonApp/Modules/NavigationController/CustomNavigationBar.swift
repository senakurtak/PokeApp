//
//  CustomNavigationBar.swift
//  PokemonApp
//
//  Created by Sena Kurtak on 21.03.2023.
//
//
//import UIKit
//
//class CustomNavigationBar: UIView {
//    
//    let backButton = UIButton()
//    let titleLabel = UILabel()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
//        backButton.tintColor = .darkGray
//        addSubview(backButton)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        // Layout subviews
//        let backButtonSize = CGSize(width: 44, height: 44)
//        backButton.frame = CGRect(origin: CGPoint(x: 10, y: (bounds.height - backButtonSize.height) / 8), size: backButtonSize)
//        titleLabel.sizeToFit()
//        titleLabel.center = CGPoint(x: bounds.midX, y: bounds.midY)
//    }
//
//}
