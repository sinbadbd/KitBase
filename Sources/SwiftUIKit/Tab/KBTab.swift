//
//  SwiftUIView.swift
//
//
//  Created by Imran on 9/4/24.
//

import SwiftUI

public struct KBTabs<T: Identifiable, Content: View>: View {
    
   public enum SelectionStyle {
        case borderBottom
        case bgColor
    }

    var list: [T]
    var content: (T, Bool) -> Content
    var currentTab: T.ID
    var onTap: ((T) -> Void)?
    var backgroundColor: Color?
    var selectedColor: Color?
    var deselectedColor: Color?
    var borderColor: Color?
    var borderWidth: CGFloat?
    var borderBottom: CGFloat?
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
    var selectionStyle: SelectionStyle = .bgColor
    var isHapticFeedbackEnabled: Bool
    
    // Haptic feedback generators
    private let tapFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    private let selectionFeedbackGenerator = UISelectionFeedbackGenerator()

    public init(
        list: [T],
        currentTab: T.ID,
        onTap: @escaping (T) -> Void,
        content: @escaping (T, Bool) -> Content,
        backgroundColor: Color? = .white,
        selectedColor: Color? = .blue,
        deselectedColor: Color? = .gray,
        borderColor: Color? = .gray,
        borderWidth: CGFloat? = 1.0,
        borderBottom: CGFloat? = 1.0,
        verticalPadding: CGFloat? = 0,
        horizontalPadding: CGFloat? = 0,
        imageWidth: CGFloat? = 10,
        imageHeight: CGFloat? = 10,
        cornerRadius: CGFloat? = 4,
        tabSpacing: CGFloat? = 2,
        scrollDirection: Axis.Set = .horizontal,
        animation: Namespace.ID,
        selectionStyle: SelectionStyle,
        isHapticFeedbackEnabled: Bool = true
    ) {
        self.list = list
        self.currentTab = currentTab
        self.onTap = onTap
        self.content = content
        self.backgroundColor = backgroundColor
        self.selectedColor = selectedColor
        self.deselectedColor = deselectedColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.borderBottom = borderBottom
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.cornerRadius = cornerRadius
        self.tabSpacing = tabSpacing
        self.scrollDirection = scrollDirection
        self.animation = animation
        self.selectionStyle = selectionStyle
        self.isHapticFeedbackEnabled = isHapticFeedbackEnabled
        
        // Prepare haptic feedback generators
        self.tapFeedbackGenerator.prepare()
        self.selectionFeedbackGenerator.prepare()
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
                .background(
                    backgroundView(for: item.id)
                )
                .onTapGesture {
                    withAnimation {
                        onTap?(item)
                        if isHapticFeedbackEnabled {
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        }
                    }
                   // tapFeedbackGenerator.impactOccurred() 
                }
        }
    }
    
    @ViewBuilder
    private func backgroundView(for itemId: T.ID) -> some View {
        if currentTab == itemId {
            switch selectionStyle {
            case .borderBottom:
                VStack(spacing: 0) {
                    Spacer()
                    Rectangle()
                        .fill(selectedColor ?? Color.blue)
                        .frame(height: 1)
                        .frame(height: borderBottom ?? 1)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                }
            case .bgColor:
                RoundedRectangle(cornerRadius: cornerRadius ?? 10, style: .continuous)
                    .fill(selectedColor ?? Color.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius ?? 10)
                            .stroke(borderColor ?? Color.gray, lineWidth: borderWidth ?? 1)
                    )
                    .matchedGeometryEffect(id: "TAB", in: animation)
            }
        } else {
            RoundedRectangle(cornerRadius: cornerRadius ?? 10)
                .fill(deselectedColor ?? Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius ?? 10)
                        .stroke(borderColor ?? Color.gray, lineWidth: borderWidth ?? 1)
                )
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
            onTap: { tab in
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
            animation: Namespace().wrappedValue, // Placeholder for animation,
            selectionStyle: .bgColor
            
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}
