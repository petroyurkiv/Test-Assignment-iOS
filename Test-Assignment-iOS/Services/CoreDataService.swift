//
//  CoreDataService.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 25.06.2023.
//

import CoreData
import UIKit

final class CoreDataService: CardsService {

    private var context: NSManagedObjectContext {
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func fetchList(completion: @escaping (Result<[Card], Error>) -> Void) {
        let fetchRequest: NSFetchRequest<LocalCard> = LocalCard.fetchRequest()
        let sort = NSSortDescriptor(key: #keyPath(LocalCard.created_at), ascending: false)
        fetchRequest.sortDescriptors = [sort]
        
        do {
            let localCards = try context.fetch(fetchRequest)
            let cards = localCards.map { Card(fromLocalCard: $0) }.compactMap { $0 }
            print(cards)
            completion(.success(cards))
        } catch {
            completion(.failure(error))
        }
    }
    
    func save(card: Card, completion: @escaping (Result<Void, Error>) -> Void) {
        let newCard = NSEntityDescription.insertNewObject(forEntityName: String(describing: LocalCard.self), into: context) as! LocalCard

        newCard.id = card.id
        newCard.number = card.number
        newCard.created_at = card.createdAt
        newCard.cardType = Int64(card.type.rawValue)

        do {
            try context.save()
            print(context)
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }
}

private extension Card {
    
    init?(fromLocalCard card: LocalCard) {
        guard let id = card.id, let number = card.number, let type = CardType(rawValue: Int(card.cardType)), let createdAt = card.created_at else {
            return nil
        }
        self.id = id
        self.number = number
        self.type = type
        self.createdAt = createdAt
    }
}

