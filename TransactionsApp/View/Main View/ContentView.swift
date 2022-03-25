//
//  ContentView.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 19/03/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CardViewModel()
    @State var selecteCard : Card = DummyData.cards[0]
    @State var startAnimation = false
    @State private var currentPage = 0
    var body: some View {
        
        ZStack {
            if !selecteCard.selected{
                Color.brandPrimary.ignoresSafeArea()
                VStack{
                    MenuHeaderView(imageName1: "line.horizontal.3", title: "HOME", imageName2: "magnifyingglass")
                    TabView(selection: $currentPage){
                        ForEach(0..<DummyData.cards.count){index  in
                            CardView(card: DummyData.cards[index])
                                .tag(index)
                                .onTapGesture {
                                    withAnimation {
                                        selecteCard = DummyData.cards[index]
                                        selecteCard.selected = true
                                    }
                                }
                                .padding()
                        }
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
                    .opacity(startAnimation ? 1 : 0)
                   .animation(Animation.easeIn(duration:0.5).delay(0.5))
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .never))
                    
                    SectionView(title: "Transactions", imageName:"arrow.up.arrow.down")
                    TransactionListView(currentIndex:$currentPage)
     
                }

            }
            else{
                
                CardDetailsView(card: $selecteCard, viewModel: viewModel)
                
            }
        }
        
        .onAppear {
            withAnimation {
                startAnimation.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct topBarView : View{
    var body: some View{
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
            
        }
    }
}
