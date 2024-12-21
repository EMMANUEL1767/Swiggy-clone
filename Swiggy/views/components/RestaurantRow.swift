//
//  RestaurantRow.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 21/12/24.
//

import SwiftUI

struct RestaurantRow: View {
    let restaurant: Restaurant
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            RestaurantThumbnailView(thumbnailOnly: true, showSwiggyOneIcon: false)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Text(restaurant.name)
                        .font(.headline)
                    Spacer()
                    Button {
                        // Open popupmenu
                    } label: {
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(-90), anchor: .leading)
                            .foregroundColor(.gray)
                    }
                }
                HStack(spacing: 4) {
                    Image(systemName: "star.circle.fill")
                        .foregroundColor(.green)
                    Text("\(restaurant.rating, specifier: "%.1f")")
                    Text("•")
                    Text(restaurant.deliveryTime)
                }
                .font(.caption)
                .fontWeight(.semibold)
                Text(restaurant.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                HStack(spacing: 6) {
                    Text(restaurant.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                    Circle()
                        .frame(width: 4)
                        .foregroundColor(.gray)
                    Text(DistanceCalculator.roundDistanceInKM(restaurant.distanceInKM))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
                Spacer()
                HStack(spacing: 12) {
                    Text("FREE DELIVERY")
                        .font(.body)
                        .fontWeight(.bold)
                        .fontWidth(.condensed)
                        .foregroundColor(.appOrange)
                        .lineLimit(1)
                    Spacer()
                    VStack(alignment: .center, spacing: .zero) {
                        Text("one")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.appOrange)
                        Text("BENEFITS")
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .foregroundColor(.appOrange)
                    }
                }
                .padding(.trailing, 16)
                .padding(.vertical, 4)
                .background(
                    LinearGradient(
                        colors: [.white, .gray], startPoint: .leading, endPoint: .trailing)
                    .opacity(0.05)
                )
                .cornerRadius(50)
                
            }
            .padding(.top, 12)
            .padding(.leading, 12)
        }
        .background(Color.white)
        .frame(height: 160, alignment: .center)
        .cornerRadius(12)
    }
}

#Preview {
    RestaurantRow(restaurant: restaurants.first!)
        .padding()
}
