//
//  CardViewController.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 23.06.2023.
//

import UIKit

final class CardViewController: UIViewController {
    
    private var viewModel: CardViewModelProtocol
    var cardView: CardView!
    
    init(viewModel: CardViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Card"
        configureCardView()
        viewModel.onDisplayCard = { [weak self] card in
            guard let self else { return }
            let cardViewData = CardViewData(cardNumber: card.formattedNumber(), bankLogo: card.type.image)
            self.cardView.setupModel(cardViewData)
        }
        viewModel.onLoad()
    }

    func configureCardView() {
        cardView = CardView(frame: .zero, numberOfCardSize: view.frame.height / 100 * 4.5)
        view.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.30)
        ])
    }
    
}
