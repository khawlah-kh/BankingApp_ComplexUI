//
//  TransactionRowView.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 20/03/2022.
//

import SwiftUI

struct TransactionRowView: View {
    var body: some View {
        HStack{
            Text("Transactions")
                .font(.title2)
                .bold()
            
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "arrow.up.arrow.down")
                
            }
            
            
        }
        .foregroundColor(.white)
        .padding(.horizontal)
    }
}

struct TransactionRowView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRowView()
    }
}
