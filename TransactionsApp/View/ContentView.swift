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
                MenuHeaderView(imageName1: "line.horizontal.3", title: "HOME", imageName2: "magnifyingglass")
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
                
                SectionView(title: "Transactions", imageName:"arrow.up.arrow.down")
                TransactionListView(currentIndex: .constant(0))

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
