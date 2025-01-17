//
//  Card.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 24.06.2023.
//

import Foundation

struct Card {
    let id: UUID
    let createdAt: Date
    let type: CardType
    let number: String
    let color: String
    
    func formattedNumber() -> String {
        return "**** **** **** \(number.suffix(4))"
    }
}
