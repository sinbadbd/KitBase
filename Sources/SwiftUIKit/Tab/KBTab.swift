//
//  SwiftUIView.swift
//  
//
//  Created by Imran on 9/4/24.
//

import SwiftUI

public struct KBTab<T: Identifiable, Content: View>: View {
    public var list: [T]
    public var currentTab: T.ID
    public var onSelect: (T) -> Void
    public var content: (T, Bool) -> Content
    public var selectedColor: Color
    public var deselectedColor: Color
    public var borderColor: Color
    public var verticalPadding: CGFloat
    public var horizontalPadding: CGFloat
    public var imageWidth: CGFloat
    public var imageHeight: CGFloat
    public var animation: Namespace.ID
    
    public init(list: [T],
                currentTab: T.ID,
                onSelect: @escaping (T) -> Void,
                @ViewBuilder content: @escaping (T, Bool) -> Content,
                selectedColor: Color = .blue,
                deselectedColor: Color = .gray,
                borderColor: Color = .gray.opacity(0.3),
                verticalPadding: CGFloat = 8,
                horizontalPadding: CGFloat = 12,
                imageWidth: CGFloat = 24,
                imageHeight: CGFloat = 24,
                animation: Namespace.ID) {
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
        self.animation = animation
    }
    
    public var body: some View {
        HStack { // Changed to HStack for horizontal layout
            ForEach(list) { item in
                content(item, currentTab == item.id)
                    .padding(.vertical, verticalPadding)
                    .padding(.horizontal, horizontalPadding)
                    .background {
                        if currentTab == item.id {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(selectedColor)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(borderColor, lineWidth: 1)
                        }
                    }
                    .onTapGesture { onSelect(item) }
            }
        }
    }
}

