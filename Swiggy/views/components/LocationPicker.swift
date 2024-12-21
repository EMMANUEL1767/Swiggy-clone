//
//  LocationPicker.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 21/12/24.
//

import SwiftUI

struct LocationPicker: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 4) {
                Image(systemName: "location.fill")
                    .font(.title3)
                Text("Office")
                    .font(.title3)
                    .fontWeight(.bold)
                Image(systemName: "chevron.down")
                    .font(.caption)
            }
                
                Text("Block i 1st floor Swiggy, Embassy Tech Village Swiggy")
                    .font(.caption)
                    .fontWeight(.medium)
                    .lineLimit(1)
            
        }
    }
}

#Preview {
    LocationPicker()
}
