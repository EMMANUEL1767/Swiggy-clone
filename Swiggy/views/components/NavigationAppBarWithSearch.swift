//
//  NavigationAppBar.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 21/12/24.
//

import SwiftUI

struct NavigationAppBarWithSearch: View {
    var isSticky: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 16){
                LocationPicker()
                    .foregroundColor(isSticky ? .black : .white)
                Spacer()
                userProfileButton
            }
            SearchBar()
        }
        .padding(16)
        .background(isSticky ? Color.white.ignoresSafeArea() : Color.appOrange.ignoresSafeArea())
    }
    
    var userProfileButton: some View {
        Button(action: {}) {
            Image(systemName: "person.fill")
                .font(.system(size: 24))
                .foregroundColor(.white)
                .padding(8)
                .background(Color.black.opacity(0.7))
                .cornerRadius(20)
        }
    }

}

#Preview {
    NavigationAppBarWithSearch(isSticky: false)
        .background(Color.appOrange)
    
}

#Preview {
    NavigationAppBarWithSearch(isSticky: true)
        .background(Color.white)
}
