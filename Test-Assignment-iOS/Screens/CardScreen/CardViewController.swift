//
//  CardViewController.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 23.06.2023.
//

import UIKit

class CardViewController: UIViewController {
    
    var cardView: CardView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Card"
        configureCardView()
    }

    func configureCardView() {
        cardView = CardView(frame: .zero, numberOfCardSize: view.frame.height / 100 * 4.5)
        view.addSubview(cardView)
        cardView.title.text = "bank"
        cardView.numberOfCard.text = "**** **** **** 1478"
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.30)
        ])
    }
    
}
