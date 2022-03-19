//
//  Expense.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 19/03/2022.
//

import Foundation

struct Expense : Identifiable{
    
    let id = UUID()
    let month : String
    let amount : Float
    var selected : Bool = false
    
}
