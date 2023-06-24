//
//  HomeTableViewModel.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 23.06.2023.
//

import Foundation

protocol HomeTableViewModelProtocool {
    var onListUpdate: (([Card]) -> Void)? { get set }
    func onPlusTap()
}

class HomeTableViewModel: HomeTableViewModelProtocool {
    
    private var cards: [Card] = []

    var onListUpdate: (([Card]) -> Void)?
    
    func onPlusTap() {
        let newCard = makeRandomCard()
        cards.append(newCard)
        onListUpdate?(cards)
    }
    
    private func makeRandomCard() -> Card {
        let cardNumber = generateRandomCardNumber()
        let cardType = CardType.allCases.randomElement() ?? .visa
        return Card(id: UUID(), type: cardType, number: cardNumber)
    }

    private func generateRandomCardNumber() -> String {
        var result = ""
        for _ in 0..<15 {
            result.append(String(Int.random(in: 0..<10)))
        }
        return result
    }
}
