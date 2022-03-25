//
//  CardDetailsView.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 23/03/2022.
//

import SwiftUI

struct CardDetailsView: View {
    @Binding var card : Card
    @StateObject var viewModel  = CardViewModel()
    @State var startAnimation = false
    
    var body: some View {
        ZStack{
            Color.brandPrimary.ignoresSafeArea()
            VStack{
                CardDetailsTopBarView(card: $card)
                
                ZStack{
                    GeometryReader { geometryProxy in
                        CardView(card: card)
                            .rotationEffect(startAnimation ? Angle.degrees(90) :Angle.degrees(0) )
                            .offset(x : startAnimation ? -geometryProxy.size.width / 2 : 0)
                    }.frame(height: 210)
                    CardInfoView()
                        .padding(.leading,80)
                        .opacity(startAnimation ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 0.5).delay(1.0))
                    
                }
                .padding(.vertical,20)
                ExpenseView(viewModel: viewModel)
                    .padding(.top,20)
                    .padding(.bottom,40)
                    .opacity(startAnimation ? 1 : 0)
                    .animation(Animation.easeInOut(duration: 0.5).delay(1.5))
                Spacer()
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 1.0)) {
                startAnimation = true
            }
        }
    }
}

struct CardDetailsTopBarView : View{
    @Binding var card : Card
    var body: some View{
        HStack{
            Button {
                card.selected = false
            } label: {
                Image(systemName: "xmark")
            }
            Text("CARD DETAILS")
            Spacer()
            Button {
            } label: {
                Image(systemName: "slider.vertical.3")
            }
            
        }
        .font(.title3)
        .foregroundColor(.white)
        .padding(.top,80)
        .padding(.horizontal)
        
    }
    
}

struct ExpenseView : View{
    @StateObject var viewModel  = CardViewModel()
    var body: some View{
        VStack{
            SectionView(title: "Expenses", imageName: "ellipsis")
                .padding(.bottom,20)
            GraphView(viewModel: viewModel)
                .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 3)
            
        }
        
    }
    
}

