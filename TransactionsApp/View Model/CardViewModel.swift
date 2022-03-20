//
//  CardViewModel.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 19/03/2022.
//

import SwiftUI



class CardViewModel : ObservableObject{
    
    let currentDateString = "19 Mar 2022"
    var lastTransactionId = UUID()
    @Published var expenses = DummyData.expenses
    var lastSelectedExpense = -1
    
    func getUniqueDates(for cardNumber : String)->[String]{
        var dates : [String] = []
        var lastDate = ""
        for transaction in  DummyData.transactions{
            if transaction.card == cardNumber && transaction.date != lastDate{
                dates.append(transaction.date)
                lastDate = transaction.date
            }
        }
        return dates
    }
    
    func getModifiedDate(date:String)->String{
        var modifiedDate = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy"
        if let currentDate = dateFormatter.date(from: currentDateString){
            if let givenDate = dateFormatter.date(from: date){
                let difference = Calendar.current.dateComponents([.day], from: currentDate,to: givenDate)
                
                if abs(difference.day!) == 0{
                    modifiedDate = "Today"
                }
                else if abs(difference.day!) == 1{
                    modifiedDate = "Yesterday"
                }
            }
        }
        return modifiedDate
    }
    
    func getTransactions(for date : String,number:String)->[Transaction]{
        
        var transactions : [Transaction] = []
        for transaction in  DummyData.transactions{
            if transaction.card == number && transaction.date == date {
                transactions.append(transaction)
            }
        }
        
        if transactions.count > 0{
            lastTransactionId = transactions.last!.id
        }
        
        return transactions
    }
    
    func getMaxExpense()->Float{
        
        return DummyData.transactions.map {$0.amount }.max()!
        
        
    }
    
    func selectedExpense(expense:Expense){
        if let foundIndex = DummyData.expenses.firstIndex(where: { $0.id == expense.id}){
            DummyData.expenses[foundIndex].selected.toggle()
            if foundIndex == lastSelectedExpense{
                lastSelectedExpense = -1
            }else{
                if lastSelectedExpense != -1{
                    DummyData.expenses[lastSelectedExpense].selected.toggle()
                }
                lastSelectedExpense = foundIndex
            }
        }
    }
    
    func getExpenseDataBasedOnHeight(maxHeight:CGFloat)->[CGFloat]{
        
        var heights:[CGFloat] = []
        let max = getMaxExpense()
        
        for expense in DummyData.expenses{
            let fraction : CGFloat = CGFloat(expense.amount / max)
            let barHeight = maxHeight - CGFloat(fraction*maxHeight)
            heights.append(barHeight)
        }
        return heights
        
    }
}
