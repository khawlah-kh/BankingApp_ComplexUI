//
//  DummyData.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 19/03/2022.
//

import Foundation

struct DummyData{
    static let cards : [Card] = [.init(number:"1111222233334444" , company:.visa, type: .gold),
                                 .init(number:"2222333344441111" , company:.master, type: .platinum),
                                 .init(number:"3333444411112222" , company:.amex, type: .silver)]
    
    
    static let transactions : [Transaction] =
    [.init(date: "19 Mar 2022", time: "10:00 AM", company: "Danken", service: "Coffee", card: "1111222233334444", amount: 30.5, type: "Meal"),
     .init(date: "18 Mar 2022", time: "02:00 PM", company: "Zara", service: "Clothes", card: "1111222233334444", amount: 300.15, type: "Clothes"),
     .init(date: "12 Mar 2022", time: "02:00 AM", company: "Apple", service: "Airpods", card: "2222333344441111", amount: 500.95, type: "Shopping"),
     .init(date: "10 Mar 2022", time: "02:55 AM", company: "Apple", service: "Mac Pro", card: "1111222233334444", amount: 500.95, type: "Shopping"),
     .init(date: "30 Jan 2022", time: "10:00 AM", company: "halfMillion", service: "Coffee", card: "2222333344441111", amount: 30.5, type: "Meal"),
     .init(date: "02 Feb 2022", time: "02:00 PM", company: "Mango", service: "Clothes", card: "3333444411112222", amount: 300.15, type: "Clothes"),
     .init(date: "12 Mar 2022", time: "02:00 AM", company: "Apple", service: "iphone 13", card: "2222333344441111", amount: 5000.95, type: "Shopping"),
     .init(date: "01 Jan 2022", time: "10:00 AM", company: "Dr.Cafe", service: "Coffee", card: "2222333344441111", amount: 30.5, type: "Meal"),
     .init(date: "02 Feb 2022", time: "02:00 PM", company: "Dior", service: "Bag", card: "3333444411112222", amount: 30000.15, type: "Clothes"),
     .init(date: "12 Mar 2022", time: "02:00 AM", company: "Apple", service: "Apple TV", card: "2222333344441111", amount: 600.95, type: "Shopping")]
    
    static var expenses : [Expense] = [.init(month: "Jan", amount: 20000),
                                       .init(month: "Feb", amount: 25000),
                                       .init(month: "Mar", amount: 20000),
                                       .init(month: "Apr", amount: 29000),
                                       .init(month: "May", amount: 30000)]
    
    
    
}
