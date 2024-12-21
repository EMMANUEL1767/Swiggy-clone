//
//  RestaurantThumbnailView.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 21/12/24.
//

import SwiftUI

struct RestaurantThumbnailView: View {
    var thumbnailOnly: Bool = false
    var showSwiggyOneIcon: Bool = true
    let width = (UIScreen.main.bounds.width-56)/3
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ZStack {
                Image("icecream")
                    .frame(width: width, height: 160, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(20)
                VStack(alignment: .leading, spacing: .zero) {
                    HStack {
                        if showSwiggyOneIcon {
                            Text("one")
                                .font(.title3)
                                .fontWeight(.black)
                                .foregroundColor(.appOrange)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.white)
                                .cornerRadius(24)
                        }
                        Spacer()
                        Image(systemName: "heart")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text("20% OFF")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .lineLimit(1)
                    HStack(spacing: 2) {
                        Text("UPTO ₹50")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        Spacer()
                        Rectangle()
                            .frame(width: 0.5, height: 10)
                            .foregroundColor(.white)
                        Text("AD")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white.opacity(0.5))
                    }
                   
                }
                .padding(12)
                .frame(width: width, height: 160, alignment: .center)
            }
            if !thumbnailOnly {
                Text("Dominoz Pizza")
                    .font(.body)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                HStack(spacing: 2) {
                    Image(systemName: "star.circle.fill")
                    
                        .foregroundColor(.green)
                    Text("4.5")
                    Circle()
                        .frame(width: 4)
                        .padding(.horizontal, 2)
                    Text("30-45 mins")
                        .lineLimit(1)
                }
                .font(.caption)
                .fontWeight(.medium)
                Text("Pizzas")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
            }
            
        }
        .frame(width: width, height: thumbnailOnly ? 140 : 220)
    }
}

#Preview {
    RestaurantThumbnailView()
}
