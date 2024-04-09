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
    var currentSelection: T.ID
    var onSelect: (T) -> Void
    var backgroundColor: Color = .white
    var selectedColor: Color = .blue
    var deselectedColor: Color = .gray
    var borderColor: Color = .black
    var borderWidth: CGFloat = 1.0
    var verticalPadding: CGFloat = 10.0
    var horizontalPadding: CGFloat = 10.0
    var imageWidth: CGFloat = 24.0
    var imageHeight: CGFloat = 24.0
    var cornerRadius: CGFloat = 8.0
    var tabSpacing: CGFloat = 10.0
    var tabBackgroundColor: Color = .clear
    var tabSelectedBackgroundColor: Color = .clear
    var tabTextColor: Color = .black
    var tabSelectedTextColor: Color = .white
    var tabFont: Font = .body
    var tabSelectedFont: Font = .headline
    var animationDuration: Double = 0.3
    
    public init(
        list: [T],
        currentTab: T.ID,
        onSelect: @escaping (T) -> Void,
        content: @escaping (T, Bool) -> Content,
        selectedColor: Color = .blue,
        deselectedColor: Color = .gray,
        borderColor: Color = .gray,
        verticalPadding: CGFloat = 10,
        horizontalPadding: CGFloat = 10,
        imageWidth: CGFloat = 24,
        imageHeight: CGFloat = 24,
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
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.scrollDirection = scrollDirection
        self.animation = animation
    }
    
    public var body: some View {
        ScrollView(scrollDirection, showsIndicators: false) {
            Group {
                if scrollDirection == .horizontal {
                    HStack { tabContent }
                } else {
                    VStack { tabContent }
                }
            }
            .padding(scrollDirection == .horizontal ? .horizontal : .vertical)
        }
    }
    
    private var tabContent: some View {
        ForEach(list) { item in
            content(item, currentTab == item.id)
                .padding(.vertical, verticalPadding)
                .padding(.horizontal, horizontalPadding)
                .background(backgroundView(for: item.id))
                .onTapGesture { onSelect(item) }
        }
    }
    
    private func backgroundView(for itemId: T.ID) -> some View {
        Group {
            if currentTab == itemId {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(selectedColor)
                    .matchedGeometryEffect(id: "TAB", in: animation)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor, lineWidth: 1)
            }
        }
    }
}

