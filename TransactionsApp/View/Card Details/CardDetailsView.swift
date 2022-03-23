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
            Rectangle()
                .fill(Color.brandPrimary)
        VStack{
        CardDetailsTopBarView(card: $card)
            ZStack{
                GeometryReader { geometryProxy in
                    CardView(card: card)
                        .rotationEffect(startAnimation ? Angle.degrees(90) :Angle.degrees(0) )
                        .offset(x : startAnimation ? geometryProxy.size.width / 2 : 0)
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

//struct CardDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        CardDetailsView(card: .constant(DummyData.cards[0]))
//            .preferredColorScheme(.dark)
//    }
//}



struct CardDetailsTopBarView : View{
    @Binding var card : Card
    var body: some View{
        HStack{
            Button {
                card.selected = false
            } label: {
                Image(systemName: "xmark")
                   // .padding(20)
                
            }
            Text("CARD DETAILS")
                .bold()
                .kerning(2.0)
            
            Spacer()
            Button {
            } label: {
                Image(systemName: "slider.vertical.3")
                   
                   
            }
            
            
        }
        .font(.title3)
        .foregroundColor(.white)
        .padding(.top,30)
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

