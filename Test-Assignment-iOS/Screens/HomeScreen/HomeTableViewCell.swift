//
//  HomeTableViewCell.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 23.06.2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier = "Cell"
    
    let icon = UIImageView()
    let title = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        configureIcon()
        configureTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupModel(_ model: Card) {
        icon.image = model.type.image
        title.text = model.formattedNumber()
    }
    
    private func configureIcon() {
        contentView.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            icon.widthAnchor.constraint(equalToConstant: 55),
            icon.heightAnchor.constraint(equalToConstant: 34),
            icon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    private func configureTitle() {
        contentView.addSubview(title)
        title.font = UIFont.systemFont(ofSize: 24)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
}
