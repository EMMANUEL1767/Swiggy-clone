//
//  HighlightFeatureItem.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 21/12/24.
//

import SwiftUI

struct HighlightFeatureItem: View {
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            Text("NEW")
                .font(.caption)
                .fontWeight(.black)
                .foregroundColor(.white)
                .padding(.vertical, 2)
                .padding(.horizontal, 8)
                .background(Color.appOrange)
                .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(bottomLeading: 10, bottomTrailing: 10)))
            Text("BOLT")
                .font(.body)
                .fontWeight(.semibold)
            Text("FOOD IN 10 MINS")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.appOrange)
                .lineLimit(1)
            Image("bolt")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 60)
            
        }
        .padding(.horizontal, 8)
        .frame(width: 100, height: 120, alignment: .center)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke()
                .foregroundColor(.gray)
                .opacity(0.5)
        )
    }
}
#Preview {
    HighlightFeatureItem()
}
