//
//  PromotionalBanner.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 21/12/24.
//

import SwiftUI

struct PromotionalBanner: View {
    var body: some View {
        ZStack {
            Color.appOrange
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("FOODIE\nWeekend")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Flat ₹175 OFF on delights")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                    
                    Button(action: {}) {
                        HStack(spacing: 6) {
                            Text("ORDER NOW")
                                .font(.callout)
                                .fontWeight(.bold)
                                
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .foregroundColor(.appOrange)
                        .cornerRadius(20)
                    }
                }
                
                Spacer()
                
                Image("biriyani")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
            }
            .padding()
        }
        .frame(height: 150)
        .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(bottomLeading: 30, bottomTrailing: 30)))
    }
}
#Preview {
    PromotionalBanner()
}
