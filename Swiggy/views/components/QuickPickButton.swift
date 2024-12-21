//
//  QuickPickButton.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 21/12/24.
//

import SwiftUI

struct QuickPickButton: View {
    let title: String
    var isSelected: Bool = false
    
    var body: some View {
        Button(action: {}) {
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? Color.black : Color.white)
                .foregroundColor(isSelected ? .white : .black)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
        }
    }
}



#Preview {
    QuickPickButton(title: "Latest", isSelected: true)
}
