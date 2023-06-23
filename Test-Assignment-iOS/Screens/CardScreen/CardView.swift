//
//  CardView.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 23.06.2023.
//

import UIKit

class CardView: UIView {
    
    let title = UILabel()
    let numberOfCard = UILabel()
    var numberOfCardSize: CGFloat
    let icon = UIImageView()

    init(frame: CGRect, numberOfCardSize: CGFloat) {
        self.numberOfCardSize = numberOfCardSize
        super.init(frame: frame)
        layer.cornerRadius = 18
        backgroundColor = .red
        configureTitle()
        configureNumberOfCard()
        configureIcon()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTitle() {
        addSubview(title)
        title.font = UIFont(name: "Kailasa", size: 24)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    private func configureNumberOfCard() {
        addSubview(numberOfCard)
        numberOfCard.font = UIFont(name: "Kailasa", size: numberOfCardSize)
        numberOfCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberOfCard.centerYAnchor.constraint(equalTo: centerYAnchor),
            numberOfCard.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func configureIcon() {
        addSubview(icon)
        icon.image = UIImage(named: "visaImage")
        icon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            icon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            icon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            icon.heightAnchor.constraint(equalToConstant: 48),
            icon.widthAnchor.constraint(equalToConstant: 80)
        ])
    }

}
