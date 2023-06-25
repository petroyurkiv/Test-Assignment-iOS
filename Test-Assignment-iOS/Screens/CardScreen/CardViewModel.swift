//
//  CardViewModel.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 24.06.2023.
//

import Foundation

final class CardViewModel: CardViewModelProtocol {
    private let card: Card
    var onDisplayCard: ((Card) -> Void)?
    
    func onLoad() {
        onDisplayCard?(card)
    }
    
    init(card: Card) {
        self.card = card
    }
}
