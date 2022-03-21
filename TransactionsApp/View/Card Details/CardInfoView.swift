//
//  CardInfoView.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 21/03/2022.
//

import SwiftUI

struct CardInfoView: View {
    var body: some View {
        VStack(alignment: .leading){
            ProgressView()
            HStack(alignment: .firstTextBaseline, spacing: 0) {
              Text("$")
                    .font(.system(size: 30,weight: Font.Weight.bold,design: Font.Design.rounded))
                    .foregroundColor(Color.brandSecondary)
                Text("5600")
                    .font(.system(size: 40,weight: Font.Weight.bold,design: Font.Design.rounded))
                    .foregroundColor(.white)
                    .padding(.leading,10)
                Text(".90")
                    .font(.system(size: 30,weight: Font.Weight.bold,design: Font.Design.rounded))
                    .foregroundColor(Color.brandSecondary)
                
                
            }
            CardDetailsRow(image: "creditcard.fill", text: "Bank Card")
            CardDetailsRow(image: "banknote.fill", text: "Bank Account")
            CardDetailsRow(image: "dot.radiowaves.right", text: "  Pay")
 
        }
    }
}

struct CardInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CardInfoView()
            .preferredColorScheme(.dark)
    }
}

struct CardDetailsRow :  View{
    let  image: String
    let text : String
    var  body: some View {
        
        HStack(alignment: .firstTextBaseline, spacing: 20){
            
            Image(systemName: image)
                .foregroundColor(.white)
            
            Text(text)
                .foregroundColor(.white)
            
        
            
        }
        .padding(.vertical,16)
        
    }
}
