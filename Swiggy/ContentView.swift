//
//  ContentView.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 20/12/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        MainView()
    }
}

struct BoltBanner: View {
    var body: some View {
        ZStack {
            Color(red: 0.5, green: 0.1, blue: 0.3)
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Bolt")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Food in 10 mins >")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 8) {
                    HStack {
                        Image(systemName: "flame.fill")
                        Text("Fresh, Hot & Crisp")
                    }
                    .font(.caption)
                    .foregroundColor(.white)
                    
                    HStack {
                        Image(systemName: "bolt.fill")
                        Text("From nearby restaurants")
                    }
                    .font(.caption)
                    .foregroundColor(.white)
                }
            }
            .padding()
        }
        .frame(height: 100)
        .cornerRadius(12)
    }
}

    

struct QuickActionButton: View {
    let title: String
    var isSelected: Bool = false
    var icon: String? = nil
    
    var body: some View {
        Button(action: {}) {
            HStack(spacing: 4) {
                Text(title)
                    .font(.caption)
                    .fontWeight(.medium)
                if let icon = icon {
                    Image(systemName: icon)
                        .foregroundColor(.red)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(isSelected ? Color.black : Color.white)
            .foregroundColor(isSelected ? .white : .black)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
        }
    }
}















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
