//
//  TransactionListRow.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 20/03/2022.
//

import SwiftUI

struct TransactionListRow: View {
    let transaction : Transaction
    let isLast : Bool
    var body: some View {
        
        VStack{
            HStack{
                ZStack{
                    Circle()
                        .foregroundColor(Color.border)
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: "applelogo")
                        .foregroundColor(.brandSecondary)
                }
                VStack(alignment:.leading){
                    Text(transaction.service)
                        .bold()
                    Text(transaction.type)
                        .font(.caption)
                        .foregroundColor(.brandSecondary)
                }
                
                Spacer()
                VStack(alignment:.trailing){
                    Text("- \(String(format: "%0.2f",transaction.amount)) SR")
                        .bold()
                    Text(transaction.time)
                        .font(.caption)
                        .foregroundColor(.brandSecondary)
                }
            }.foregroundColor(.white)
                .padding()
            
            
            Divider()
                .foregroundColor(.red)
                .opacity(isLast ? 0.0 : 1.0)
                .padding(.horizontal,50)
                .padding(.bottom,8)
        }
    }
}

struct TransactionListRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListRow(transaction: DummyData.transactions[0], isLast: false)
    }
}
