//
//  SwiftUIView.swift
//
//
//  Created by Imran on 9/4/24.
//

import SwiftUI

public struct KBTabs<T: Identifiable, Content: View>: View {
    
    var list: [T]
    var content: (T, Bool) -> Content
    var currentTab: T.ID
    var onSelect: (T) -> Void
    var backgroundColor: Color = .white
    var selectedColor: Color?
    var deselectedColor: Color?
    var borderColor: Color?
    var borderWidth: CGFloat?
    var verticalPadding: CGFloat?
    var horizontalPadding: CGFloat?
    var imageWidth: CGFloat?
    var imageHeight: CGFloat?
    var cornerRadius: CGFloat?
    var tabSpacing: CGFloat?
    var tabBackgroundColor: Color?
    var tabSelectedBackgroundColor: Color?
    var tabTextColor: Color?
    var tabSelectedTextColor: Color?
    var tabFont: Font?
    var tabSelectedFont: Font?
    var animationDuration: Double?
    var scrollDirection: Axis.Set
    var animation: Namespace.ID
    
    public init(
        list: [T],
        currentTab: T.ID,
        onSelect: @escaping (T) -> Void,
        content: @escaping (T, Bool) -> Content,
        selectedColor: Color? = .blue,
        deselectedColor: Color? = .gray,
        borderColor: Color? = .gray,
        borderWidth: CGFloat? = 1.0,
        verticalPadding: CGFloat? = 0,
        horizontalPadding: CGFloat? = 0,
        imageWidth: CGFloat? = 10,
        imageHeight: CGFloat? = 10,
        cornerRadius: CGFloat? = 4,
        tabSpacing: CGFloat? = 2,
        scrollDirection: Axis.Set = .horizontal,
        animation: Namespace.ID
    ) {
        self.list = list
        self.currentTab = currentTab
        self.onSelect = onSelect
        self.content = content
        self.selectedColor = selectedColor
        self.deselectedColor = deselectedColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.cornerRadius = cornerRadius
        self.tabSpacing = tabSpacing
        self.scrollDirection = scrollDirection
        self.animation = animation
    }
    
    public var body: some View {
        ScrollView(scrollDirection, showsIndicators: false) {
            Group {
                if scrollDirection == .horizontal {
                    HStack(spacing: tabSpacing ?? 0) { tabContent }
                } else {
                    VStack(spacing: tabSpacing ?? 0) { tabContent }
                }
            }
            .padding(scrollDirection == .horizontal ? .horizontal : .vertical, tabSpacing ?? 0)
        }
        .background(backgroundColor)
    }
    
    private var tabContent: some View {
        ForEach(list) { item in
            content(item, currentTab == item.id)
                .padding(.vertical, verticalPadding ?? 0)
                .padding(.horizontal, horizontalPadding ?? 0)
                .background(backgroundView(for: item.id))
                .onTapGesture { onSelect(item) }
        }
    }
    
    private func backgroundView(for itemId: T.ID) -> some View {
        Group {
            if currentTab == itemId {
                RoundedRectangle(cornerRadius: cornerRadius ?? 10, style: .continuous)
                    .fill(selectedColor ?? Color.blue)
                    .matchedGeometryEffect(id: "TAB", in: animation)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius ?? 10)
                    .stroke(borderColor ?? Color.gray, lineWidth: borderWidth ?? 1)
            }
        }
    }
}


struct Tab: Identifiable {
    let id: Int
    let iconName: String
    let title: String
}

import SwiftUI
struct ContentView: View {
    @State private var currentTab: Int = 0
    
    // Sample tabs
    private let tabs = [
        Tab(id: 0, iconName: "house.fill", title: "Home"),
        Tab(id: 1, iconName: "heart.fill", title: "Favorites"),
        Tab(id: 2, iconName: "person.fill", title: "Profile")
    ]
    
    var body: some View {
        KBTabs(
            list: tabs,
            currentTab: currentTab,
            onSelect: { tab in
                self.currentTab = tab.id
            },
            content: { tab, isSelected in
                VStack {
                    Image(systemName: tab.iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(isSelected ? .white : .gray)
                    Text(tab.title)
                        .font(isSelected ? .headline : .body)
                        .foregroundColor(isSelected ? .white : .gray)
                }
                .padding()
            },
            selectedColor: .blue,
            deselectedColor: .gray,
            borderColor: .gray,
            verticalPadding: 10,
            horizontalPadding: 10,
            imageWidth: 24,
            imageHeight: 24,
            scrollDirection: .horizontal,
            animation: Namespace().wrappedValue // Placeholder for animation
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}
