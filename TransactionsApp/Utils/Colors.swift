//
//  Colors.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 19/03/2022.
//

import SwiftUI

extension Color{
    
    
    static let brandPrimary = Color(red: 47/255, green: 16/255, blue: 118/255)
    static let brandSecondary = Color(red: 142/255, green: 119/255, blue: 204/255)
    
    static let imageTint = Color(red: 182/255, green: 152/255, blue: 255/255)
    static let imageTint2 = Color(red: 120/255, green: 90/255, blue: 201/255)
    
    static let border = Color(red: 66/255, green: 38/255, blue: 135/255)

    static let cardBottomLeft = Color(red: 107/255, green: 27/255, blue: 255/255)
    static let cardTopRight = Color(red: 134/255, green: 65/255, blue: 255/255)
    static let cardGradient = LinearGradient(gradient: Gradient(colors: [Color.cardTopRight,Color.cardBottomLeft]), startPoint: .topTrailing, endPoint: .bottomLeading)
    
    
    static let graphLine = Color(red: 249/255, green: 24/255, blue: 253/255)
    static let graphNumber = Color(red: 77/255, green: 49/255, blue: 162/255)
    static let graphBar = Color(red: 55/255, green: 25/255, blue: 127/255)
    static let graphHighlight = Color(red: 71/255, green: 35/255, blue: 145/255)
    static let barBackground = LinearGradient(gradient: Gradient(colors: [Color.graphBar.opacity(0.2),Color.graphBar.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
    
    static let barHighlightedBackground = LinearGradient(gradient: Gradient(colors: [Color.graphHighlight.opacity(0.2),Color.graphHighlight.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
}


