//
//  SectionTitle.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 21/12/24.
//

import SwiftUI

struct SectionTitle: View {
    let title: String
    var body: some View {
        HStack(spacing: 6) {
            Text(title)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: true)

            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 0.5)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview {
    SectionTitle(title: "Section 01")
}
