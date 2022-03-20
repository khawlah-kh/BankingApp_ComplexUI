//
//  MenuHeaderView.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 20/03/2022.
//

import SwiftUI


struct MenuHeaderView: View {
    var body: some View {
        HStack{
            Button {
            } label: {
                Image(systemName: "line.horizontal.3")
                  
            }
            Text("HOME")
            
            Spacer()
            Button {
            } label: {
                Image(systemName: "magnifyingglass")
                   
                   
            }
            
            
        }
        .font(.title3)
        .foregroundColor(.white)
        .padding(.top,30)
        .padding(.horizontal)
    }
}

struct MenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MenuHeaderView()
    }
}
