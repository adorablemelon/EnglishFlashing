//
//  StudyCard.swift
//  EnglishFlashing
//
//  Created by bao le gia on 30/05/2022.
//

import Foundation
import FirebaseStorage
import FirebaseFirestoreSwift
import Combine

enum CardStatus {
    case new
    case learned
    case studying
}

extension CardStatus {
    var getCardStatus: String? {
        switch self {
        case .new:
            return "new"
        case .learned:
            return "learned"
        case .studying:
            return "studying"
        }
    }
}
struct Card: Identifiable, Codable {
    @DocumentID var id: String?
    var question: String
    var answer: String
    var status: String
}
