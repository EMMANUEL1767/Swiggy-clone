//
//  Tabs+Enum.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 21/12/24.
//

import Foundation

enum Tab: Int, CaseIterable{
    case home = 0
    case food = 1
    case eatlist = 2
    case bolt = 3
    case card = 4
    case reorder = 5
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .food:
            return "Food"
        case .eatlist:
            return "Eatlist"
        case .bolt:
            return "Bolt"
        case .card:
            return "Card"
        case .reorder:
            return "reorder"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "arrow.backward.circle"
        case .food:
            return "fork.knife"
        case .eatlist:
            return "bookmark"
        case .bolt:
            return "bolt.fill"
        case .card:
            return "creditcard"
        case .reorder:
            return "cart"
        }
    }
}
