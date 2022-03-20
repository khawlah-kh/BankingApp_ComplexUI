//
//  CardView.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 19/03/2022.
//

import SwiftUI

struct CardView: View {
    let card : Card
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.cardGradient)
               
            VStack{
                HStack{
                    VStack(alignment: .leading) {
                        Text("\(card.company.rawValue)")
                            .font(.system(size: 14))
                            .bold()
                            .kerning(2.0)
                            .foregroundColor(.white)
                        
                        Text("\(card.type.rawValue)")
                            .font(.system(size: 14))
                            .bold()
                            .kerning(2.0)
                            .foregroundColor(.white)
                        
                    }
                    Spacer()
                    
                    Text("\(card.company.rawValue)")
                        .italic()
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        
                    
                }
                Spacer()
                
                HStack{
                    Spacer()
                    ForEach(0..<3){_ in
                        Text("****")
                            .foregroundColor(.white)
                            .kerning(3.0)
                           .font(.title2)
                           .bold()
                        Spacer()
                    }
                    
                    Text(card.lastFourDigits)
                        .foregroundColor(.white)
                        .kerning(3.0)
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                
            }
            .padding(40)
            
            
            
            
        }.padding()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3.5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: DummyData.cards[0])
    }
}
