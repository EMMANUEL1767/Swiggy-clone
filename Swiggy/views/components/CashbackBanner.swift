//
//  CashbackBanner.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 21/12/24.
//

import SwiftUI

struct CashbackBanner: View {
    var body: some View {
        ZStack {
            // Background with wavy shape
            WavyShape()
                .fill(LinearGradient(colors: [.purple.opacity(0.3), .purple], startPoint: .leading, endPoint: .trailing))
                .opacity(0.3)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Extra 10% Cashback...")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .lineLimit(1)
                    
                    Text("To make your food orders extra delicious!")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.purple.opacity(0.8))
                    
                    Button(action: {
                        // Action for "Know More"
                    }) {
                        Text("Know More")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.appOrange)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    
                    Text("*T&C Apply")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // You would replace this with actual images
                Image("swiggycard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .foregroundColor(.appOrange)
            }
            .padding()
        }
        .frame(height: 180)
    }
}

#Preview {
    CashbackBanner()
}
