//
//  TransactionRowView.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 20/03/2022.
//

import SwiftUI

struct SectionView: View {
    let title : String
    let imageName : String
    var body: some View {
        HStack{
            Text(title)
                .font(.title2)
                .bold()
            
            Spacer()
            Button {
            } label: {
                Image(systemName: imageName)
            } 
        }
        .foregroundColor(.white)
        .padding(.horizontal)
    }
}

struct TransactionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(title: "Transactions", imageName:"arrow.up.arrow.down")
            .preferredColorScheme(.dark)
    }
}
