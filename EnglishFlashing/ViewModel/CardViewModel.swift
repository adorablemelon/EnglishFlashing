//
//  CardViewModel.swift
//  EnglishFlashing
//
//  Created by bao le gia on 31/05/2022.
//

import Foundation
import Combine


protocol CardViewModelProtocol: ObservableObject {
    func add (_ card: Card)
    func get ()
    var state: CardViewModelState {get}
    var repository: CardRepositoryProtocol {get set}
}

class CardViewModel: CardViewModelProtocol, ObservableObject {
    
    internal var repository: CardRepositoryProtocol
    @Published private(set) var state: CardViewModelState = .loading
    private var cancellables: Set<AnyCancellable> = []

    required init (_ repository: CardRepositoryProtocol ) {
        self.repository = repository
        bindingCards()
        
    }
    
    private func bindingCards() {
        repository.resultSubject
            .sink { [unowned self] comp in
                switch comp {
                case .failure(let err):
                    self.state = .failed(err: err)
                case .finished:
                    print("finised")
                }
            } receiveValue: { [unowned self] res in
                self.state = .success(cards: res)
            }.store(in: &cancellables)

    }
    
    func add(_ card: Card) {
        repository.add(card)
    }
    
    func get() {
        repository.get()
    }

}
