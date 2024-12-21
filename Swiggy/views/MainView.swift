//
//  MainView.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 20/12/24.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab: Int = 1
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab,
                    content:  {
                DummyView(tabName: "Home Page").tag(0)
                FoodTabView().tag(1)
                DummyView(tabName: "Eatlist Page").tag(2)
                DummyView(tabName: "Bolt Page").tag(3)
                DummyView(tabName: "Cards Page").tag(4)
                DummyView(tabName: "Reorder Page").tag(5)
            })
            tabBar
        }
        
    }
    
    var tabBar: some View {
        HStack(spacing: 12) {
            ForEach((Tab.allCases), id: \.self){ item in
                Button{
                    selectedTab = item.rawValue
                } label: {
                    customTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                }
            }
        }
        .frame(height: 80)
        .background(.white)
    }
    
    func customTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        VStack(spacing: 8) {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .foregroundColor(isActive ? .appOrange : .gray)
                .frame(width: 20, height: 20)
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(isActive ? .appOrange : .gray)
            Spacer()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 60)
        .background(.white)
        .cornerRadius(12)
    }
}

#Preview {
    MainView()
}


struct TabBarItem: View {
    let title: String
    let icon: String
    var isSelected: Bool = false
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Image(systemName: icon)
                .font(.body)
                .fontWeight(isSelected ? .bold : .medium)
                .foregroundColor(isSelected ? .appOrange : .gray)
            Text(title)
                .font(.caption)
                .fontWeight(isSelected ? .bold : .medium)
                .foregroundColor(isSelected ? .appOrange : .gray)
        }
    }
}
