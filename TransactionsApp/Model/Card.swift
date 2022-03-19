//
//  Card.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 19/03/2022.
//

import SwiftUI



enum CardType : String{
    case silver
    case gold
    case platinum
}


enum CompanyType : String{
    case visa
    case master
    case amex
}
struct Card : Identifiable {
    
    var id = UUID()
    let number : String
    let company : CompanyType
    let type : CardType
    var selected : Bool = false
    
    var lastFourDigits : String{
        String(number.suffix(4))
    }
    
    
    
}
