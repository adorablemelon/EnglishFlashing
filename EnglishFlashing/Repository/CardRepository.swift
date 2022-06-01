//
//  CardRepository.swift
//  EnglishFlashing
//
//  Created by bao le gia on 30/05/2022.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseCore
import UIKit

enum StorageCollection {
    case EnglishCard
    case VietCard
    
    var getPath: String {
        switch self {
        case .EnglishCard: return "english_card"
        case .VietCard: return "viet_card"
        }
    }
}

protocol CardRepositoryProtocol {
    func get()
    func add(_ card: Card)
    var resultSubject: CurrentValueSubject<[Card], Error> { get set }
}

final class CardRepository: ObservableObject, CardRepositoryProtocol {

    private let store = Firestore.firestore()
    var resultSubject = CurrentValueSubject<[Card], Error>([])
    init() {
    }
    
    func get() {
        store.collection(StorageCollection.EnglishCard.getPath)
            .addSnapshotListener { [unowned self] snapshot, err in
                if let err = err {
                    resultSubject.send(completion: .failure(err))
                }
                if let snapshot = snapshot {
                    let cards = snapshot.documents.compactMap {
                        try? $0.data(as: Card.self)
                    }
                    resultSubject.send(cards)
                }
            }
    }

    
    func add(_ card: Card) {
        do {
            _ = try store.collection(StorageCollection.EnglishCard.getPath).addDocument(from: card)
        } catch {
            fatalError("add card falied")
        }
    }
    
    func addFake() {
        let data = [
            [
                "question": "hello",
                "answer": "xin chao",
                "status": "new"
            ],
            [
                "question": "abandon",
                "answer": "xin chao",
                "status": "new"
            ],
            [
                "question": "ability",
                "answer": "xin chao",
                "status": "new"
            ],
            [
                "question": "able",
                "answer": "xin chao",
                "status": "new"
            ],
            [
                "question": "abortion",
                "answer": "xin chao",
                "status": "new"
            ],
            [
                "question": "about",
                "answer": "xin chao",
                "status": "new"
            ],
            [
                "question": "above",
                "answer": "xin chao",
                "status": "new"
            ],
            [
                "question": "abroad",
                "answer": "xin chao",
                "status": "new"
            ],
            [
                "question": "absence",
                "answer": "xin chao",
                "status": "new"
            ],
            [
                "question": "absolute",
                "answer": "xin chao",
                "status": "new"
            ]
        ]
        for i in data {
            store.collection("english_card").addDocument(data: i )
        }
    }
}
