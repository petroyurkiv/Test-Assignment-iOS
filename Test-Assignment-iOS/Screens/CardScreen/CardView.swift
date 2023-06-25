//
//  CardView.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 23.06.2023.
//

import UIKit

struct CardViewData {
    let cardNumber: String
    let bankLogo: UIImage?
    let color: String
}

class CardView: UIView {
    private let title = UILabel()
    private let numberOfCard = UILabel()
    private let icon = UIImageView()
    private let color = String()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 18
        configureTitle()
        configureNumberOfCard()
        configureIcon()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupModel(_ model: CardViewData) {
        numberOfCard.text = model.cardNumber
        icon.image = model.bankLogo
        backgroundColor = UIColor(hexString: model.color)
    }
    
    private func configureTitle() {
        addSubview(title)
        title.text = "bank"
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 24)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    private func configureNumberOfCard() {
        addSubview(numberOfCard)
        numberOfCard.textColor = .white
        numberOfCard.font = UIFont.systemFont(ofSize: 36)
        numberOfCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberOfCard.centerYAnchor.constraint(equalTo: centerYAnchor),
            numberOfCard.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func configureIcon() {
        addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            icon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            icon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            icon.heightAnchor.constraint(equalToConstant: 48),
            icon.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}
