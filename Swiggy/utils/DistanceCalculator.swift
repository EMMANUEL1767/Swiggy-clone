//
//  DistanceCalculator.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 21/12/24.
//

import Foundation

struct DistanceCalculator {
    static func roundDistanceInKM(_ distance: Double) -> String {
        let roundedDistance = Double((1000*distance)/1000)
        return "\(roundedDistance) km"
    }
}
