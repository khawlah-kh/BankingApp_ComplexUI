//
//  TransactionsAppApp.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 19/03/2022.
//

import SwiftUI

@main
struct TransactionsAppApp: App {
    var body: some Scene {
        WindowGroup {
        // ContentView()
            CardDetailsView(card:.constant(DummyData.cards[0]))
           // GraphView()
        }
    }
}
