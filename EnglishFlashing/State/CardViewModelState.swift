//
//  CardViewModelState.swift
//  EnglishFlashing
//
//  Created by bao le gia on 31/05/2022.
//

import Foundation

enum CardViewModelState {
    case loading
    case success(cards: [Card])
    case failed(err: Error)
}
