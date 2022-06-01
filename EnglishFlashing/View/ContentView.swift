//
//  ContentView.swift
//  EnglishFlashing
//
//  Created by bao le gia on 30/05/2022.
//

import SwiftUI

struct ContentView <ModelProtocol>: View where ModelProtocol: CardViewModelProtocol {
    @ObservedObject var viewModel: ModelProtocol
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
                Text("Loading")
            case .success(cards: let cards):
                let data = cards
                Button {
                    print(data)
                } label: {
                    Text("Tap to show cards")
                }
            case .failed(err: let err):
                Button {
                    print(err)
                } label: {
                    Text("Retry")
                }
            }
            Button {
                viewModel.get()
            } label: {
                Text("Retry")
            }
        }.onAppear {viewModel.get() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: CardViewModel(CardRepository()))
    }
}
