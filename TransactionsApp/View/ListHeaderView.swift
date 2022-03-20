//
//  ListHeaderView.swift
//  TransactionsApp
//
//  Created by khawlah khalid on 20/03/2022.
//

import SwiftUI

struct ListHeaderView: View {
    let title : String
    var body: some View {
        HStack{
            Text(title)
                .font(.caption)
                .foregroundColor(.brandSecondary)
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView(title: "Today")
    }
}
