//
//  FoodTabView.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 20/12/24.
//

import SwiftUI

struct FoodTabView: View {
    @State private var isRefreshing = false
    @State private var scrollOffset: CGFloat = 0
    @State private var previousScrollOffset: CGFloat = 0
    @State private var isScrollingUp = false
    @State private var showStickyHeader = false
    @State private var safeAreaInsets: EdgeInsets = .init()

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                if isRefreshing {
                    loadingView
                } else {
                    ScrollView {
                        ScrollViewReader { proxy in
                            
                            LazyVStack(alignment: .leading, spacing: .zero, pinnedViews: .sectionHeaders) {
                                
                                GeometryReader { geometry in
                                    Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll-view")).origin.y)
                                }
                                .frame(height: 0)
                                
                                Section {
                                    VStack(alignment: .leading, spacing: 20) {
                                        PromotionalBanner()
                                        bannersSection
                                        quickActions
                                        reorderList
                                        highlightsSection
                                        whatsOnMindSection
                                        quickPicksSection
                                        CashbackBanner()
                                    }
                                    
                                } header: {
                                    NavigationAppBarWithSearch()
                                }
                                
                                Section {
                                    restaurantsList
                                } header: {
                                    quickActions
                                }
                                .padding(.vertical)
                            }
                        }
                    }
                    .ignoresSafeArea()
                    .refreshable {
                        isRefreshing = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.isRefreshing = false
                        }
                    }
                    .coordinateSpace(name: "scroll-view")
                    .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                        isScrollingUp = value > scrollOffset
                        scrollOffset = value
                        
                        // Show sticky header when scrolling up and past a certain threshold
                        if isScrollingUp && scrollOffset < -50 {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                showStickyHeader = true
                            }
                        } else if !isScrollingUp {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                showStickyHeader = false
                            }
                        }
                        
                        previousScrollOffset = scrollOffset
                    }
                    .onPreferenceChange(SafeAreaInsetsKey.self) { value in
                                safeAreaInsets = value
                        print(safeAreaInsets)
                            }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
    
    var loadingView: some View {
        VStack(spacing: 20) {
            NavigationAppBarWithSearch(isSticky: false)
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        quickPicksSection
                        RestaurantRow(restaurant: restaurants[0])
                            .padding()
                    }
                }
                .redacted(reason: .placeholder)
                CircularProgressLoader()
            }
        }
        
    }
    
    var header: some View {
        VStack(alignment: .leading, spacing: 16) {
            NavigationAppBarWithSearch()
        }
        .background(Color.appOrange)
    }
    
    var quickActions: some View {
        HStack(spacing: 8) {
            QuickActionButton(title: "Reorder", isSelected: true)
            QuickActionButton(title: "Your Eatlists")
            QuickActionButton(title: "Favourites", icon: "heart.fill")
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
    }
    
    var reorderList: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 16) {
                ForEach(0..<10) { _ in
                    RestaurantThumbnailView()
                }
            }
        }
        .scrollIndicators(.hidden, axes: .horizontal)
        .padding(.horizontal)
    }
    
    var whatsOnMindSection: some View {
        let itemWidth = (UIScreen.main.bounds.width-60)/4
        let gridRows = Array(repeating: GridItem(.fixed(itemWidth), spacing: 12), count: 2)
        return VStack(alignment: .leading, spacing: 20) {
            SectionTitle(title: "EMMANUEL, WHAT'S ON YOUR MIND?")
            ScrollView(.horizontal) {
                LazyHGrid(rows: gridRows, spacing: 12) {
                    ForEach(0..<20) { _ in
                        VStack(alignment: .center, spacing: 4) {
                            Image("biriyani")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .cornerRadius(30)
                            Text("Biriyani")
                                .font(.caption)
                                .lineLimit(1)
                        }
                        .frame(width: itemWidth, alignment: .center)
                    }
                }
            }
            .scrollIndicators(.hidden, axes: .horizontal)
        }
        .padding(.bottom, 20)
        .padding(.horizontal)
        
    }
    
    var bannersSection: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12, content: {
                ForEach(1..<8) { index in
                    Image("ad\(index)")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            })
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.hidden, axes: .horizontal)
    }
    
    var highlightsSection: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 12) {
                ForEach(0..<5) { _ in
                    HighlightFeatureItem()
                }
            }
        }
        .scrollIndicators(.hidden, axes: .horizontal)
        .padding(.vertical, 20)
        .padding(.horizontal)
    }
    
    var quickPicksSection: some View {
        let gridRowSize = Array(repeating: GridItem(.fixed(220), spacing: 20), count: 2)
        return VStack(alignment: .leading, spacing: 16) {
            SectionTitle(title: "QUICK PICKS FOR YOU")
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    QuickPickButton(title: "What's New?", isSelected: true)
                    QuickPickButton(title: "Gourmet Delights")
                    QuickPickButton(title: "Fast Delivery")
                    QuickPickButton(title: "Fast Delivery")
                }
            }
            .scrollIndicators(.hidden, axes: .horizontal)
            
            
            LazyHGrid(rows: gridRowSize, spacing: 12, content: {
                ForEach(0..<6) { _ in
                    RestaurantThumbnailView()
                }
            })
            Divider()
            NavigationLink {
                DummyView(tabName: "Restaurants Page")
            } label: {
                HStack(spacing: 4) {
                    Text("See more restaurants")
                        .font(.body)
                    Image(systemName: "chevron.right")
                        .font(.caption)
                    
                }
                .foregroundColor(.appOrange)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .center)
                .contentShape(Rectangle())
            }
            
            Divider()
            
        }
        .padding(.horizontal)
    }
    
    var restaurantsList: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Top 2218 restaurants to explore")
                .font(.headline)
            
            ForEach(restaurants) { restaurant in
                RestaurantRow(restaurant: restaurant)
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 112)
    }
    
    var stickyHeader: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                if geometry.frame(in: .global).minY <= 100 {
                    NavigationAppBarWithSearch()
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom)
                        .background(Color.white)
                        .offset(y: -geometry.frame(in: .global).minY)
                } else {
                    NavigationAppBarWithSearch(isSticky: true)
                        .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY, alignment: .bottom)
                        .background(Color.white)
                }
            }
        }
        .frame(height: 100)
    }
}

#Preview {
    FoodTabView()
}


struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


struct SafeAreaInsetsKey: PreferenceKey {
    static var defaultValue: EdgeInsets = .init()
    static func reduce(value: inout EdgeInsets, nextValue: () -> EdgeInsets) {
        value = nextValue()
    }
}
