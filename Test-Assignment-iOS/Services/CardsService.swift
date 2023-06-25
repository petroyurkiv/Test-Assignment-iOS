//
//  CardsService.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 25.06.2023.
//

import Foundation

protocol CardsService {
    func fetchList(completion: @escaping (Result<[Card], Error>) -> Void)
    func save(card: Card, completion: @escaping (Result<Void, Error>) -> Void)
}
