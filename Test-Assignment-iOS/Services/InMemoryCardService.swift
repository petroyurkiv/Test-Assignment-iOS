//
//  InMemoryCardService.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 25.06.2023.
//

import Foundation

final class InMemoryCardService: CardsService {
    private var cards: [Card] = [Card(id: .init(), createdAt:  Date(), type: .visa, number: "0000 1111 2222 3333 4444", color: "101010")]

    func fetchList(completion: @escaping (Result<[Card], Error>) -> Void) {
        completion(.success(cards))
    }

    func save(card: Card, completion: @escaping (Result<Void, Error>) -> Void) {
        cards.insert(card, at: 0)
        completion(.success(()))
    }
}
