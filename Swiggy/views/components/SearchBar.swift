//
//  SearchBar.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 21/12/24.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            TextField("Search for 'Pizza'", text: $searchText)
            Image(systemName: "magnifyingglass")
            Divider()
                .frame(height: 20)
            Image(systemName: "mic.fill")
                .foregroundColor(.appOrange)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

#Preview {
    SearchBar()
}
