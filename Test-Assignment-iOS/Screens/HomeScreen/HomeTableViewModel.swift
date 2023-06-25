//
//  HomeTableViewModel.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 23.06.2023.
//

import Foundation

final class HomeTableViewModel: HomeTableViewModelProtocol {
    private let cardsService: CardsService
    private var cards: [Card] = []
    
    init(cardsService: CardsService) {
        self.cardsService = cardsService
    }

    var onListUpdate: (([Card]) -> Void)?
    
    func onLoad() {
        cardsService.fetchList { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let cards):
                self.cards = cards
                self.onListUpdate?(cards)
            case .failure:
                break
            }
        }
    }
    
    func onPlusTap() {
        let card = makeRandomCard()
        cardsService.save(card: card) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success:
                self.cards.insert(card, at: 0)
                self.onListUpdate?(self.cards)
                
            case .failure:
                break
            }
        }
    }
    
    private func makeRandomCard() -> Card {
        let cardNumber = generateRandomCardNumber()
        let cardType = CardType.allCases.randomElement() ?? .visa
        return Card(id: UUID(), createdAt: Date(), type: cardType, number: cardNumber)
    }

    private func generateRandomCardNumber() -> String {
        var result = ""
        for _ in 0..<16 {
            result.append(String(Int.random(in: 0..<10)))
        }
        return result
    }
}
