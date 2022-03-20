//
//  ContentView.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 19/03/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CardViewModel()
    var body: some View {
        
        ZStack {
            Color.brandPrimary.ignoresSafeArea()
            VStack{
                MenuHeaderView()
                TabView{
                    ForEach(DummyData.cards){card in
                        CardView(card: card)
                            .padding()
                    }
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .never))
                
                TransactionRowView()
                ScrollView{
                    LazyVStack{
                        ForEach(DummyData.transactions){transaction in
                            TransactionListRow(transaction: transaction, isLast: false)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
