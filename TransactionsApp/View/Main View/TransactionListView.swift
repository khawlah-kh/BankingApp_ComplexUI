//
//  TransactionListView.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 20/03/2022.
//

import SwiftUI

struct TransactionListView: View {
    @Binding var currentIndex : Int
    @StateObject var viewModel = CardViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(listHeaders,id:\.self){ date in
                    ListHeaderView(title: viewModel.getModifiedDate(date: date))
                    
                    ForEach(getTransactions(date: date)){transaction in
                        TransactionListRow(transaction: transaction, isLast: viewModel.lastTransactionId == transaction.id)
                    }
                }
            }
        }
    }
    
    var listHeaders:[String]{
        viewModel.getUniqueDates(for:DummyData.cards[currentIndex].number)
    }
    func getTransactions(date : String)->[Transaction]{
        viewModel.getTransactions(for: date, number: DummyData.cards[currentIndex].number)
        
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(currentIndex: .constant(0))
    }
}
