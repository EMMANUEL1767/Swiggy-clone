//
//  Restaurant.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 21/12/24.
//

import Foundation

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let cuisine: String
    let rating: Double
    let deliveryTime: String
    let discount: String
    let imageUrl: String
    let location: String
    let distanceInKM: Double
}
