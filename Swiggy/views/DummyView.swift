//
//  DummyView.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 20/12/24.
//

import SwiftUI

struct DummyView: View {
    let tabName: String
    var body: some View {
        Text("Welcome to\n\(tabName)")
            .multilineTextAlignment(.center)
    }
}

#Preview {
    DummyView(tabName: "Home Page")
}
