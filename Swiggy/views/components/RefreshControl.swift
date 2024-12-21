//
//  RefreshControl.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 21/12/24.
//

import SwiftUI

struct CircularProgressLoader: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            // Background circle
            Circle()
                .stroke(Color.appOrange.opacity(0.3), lineWidth: 6)
            
            // Animated arc
            Circle()
                .trim(from: 0, to: 0.25) // Fixed to 75% of the circle
                .stroke(
                    Color.appOrange,
                    style: StrokeStyle(
                        lineWidth: 6,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
        }
        .frame(width: 32, height: 32)
        .padding(12)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 2)
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    CircularProgressLoader()
}
