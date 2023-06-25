//
//  CardViewController.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 23.06.2023.
//

import UIKit

final class CardViewController: UIViewController {
    private var viewModel: CardViewModelProtocol
    private var cardView: CardView!
    private var cardWidthCNST: NSLayoutConstraint!
    private var cardHeightCNST: NSLayoutConstraint!
    
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
            let cardViewData = CardViewData(cardNumber: card.formattedNumber(), bankLogo: card.type.image, color: card.color)
            self.cardView.setupModel(cardViewData)
        }
        viewModel.onLoad()
    }

    func configureCardView() {
        // 85 X 54
        cardView = CardView(frame: .zero)
        view.addSubview(cardView)
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        let cardSize = cardSize()
        cardWidthCNST = cardView.widthAnchor.constraint(equalToConstant: cardSize.width)
        cardHeightCNST = cardView.heightAnchor.constraint(equalToConstant: cardSize.height)
        
        NSLayoutConstraint.activate([
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardWidthCNST,
            cardHeightCNST
        ])
    }
    
    private func cardSize() -> CGSize {
        let ratioCoef = 85.0 / 54.0
        let width: CGFloat
        if UIDevice.current.orientation.isLandscape {
            width = UIScreen.main.bounds.height - 32.0
        } else {
            width = UIScreen.main.bounds.width - 32.0
        }
        let height = width / ratioCoef
        return CGSize(width: width, height: height)
    }
    
}
