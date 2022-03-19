//
//  Transaction.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 19/03/2022.
//

import Foundation



struct Transaction : Identifiable,Hashable{
    let id = UUID()
    let date : String
    let time : String
    let company : String
    let service : String
    let card : String
    let amount : Float
    let type : String
    
}
