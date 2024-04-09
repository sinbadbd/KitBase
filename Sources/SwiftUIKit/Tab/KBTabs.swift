//
//  SwiftUIView.swift
//  
//
//  Created by Imran on 9/4/24.
//

import SwiftUI

public struct KBTabs<T: Identifiable, Content: View>: View {
    // Make properties public to allow access from outside
    public var list: [T]
    public var currentTab: T.ID
    public var onSelect: (T) -> Void
    public var content: (T, Bool) -> Content
    public var selectedColor: Color
    public var deselectedColor: Color
    public var animation: Namespace.ID
    
    // Public initializer
    public init(list: [T],
                currentTab: T.ID,
                onSelect: @escaping (T) -> Void,
                @ViewBuilder content: @escaping (T, Bool) -> Content,
                selectedColor: Color = .blue,
                deselectedColor: Color = .gray,
                animation: Namespace.ID) {
        self.list = list
        self.currentTab = currentTab
        self.onSelect = onSelect
        self.content = content
        self.selectedColor = selectedColor
        self.deselectedColor = deselectedColor
        self.animation = animation
    }
    
    // Public body
    public var body: some View {
        VStack {
            ForEach(list) { item in
                content(item, currentTab == item.id)
                    .foregroundColor(currentTab == item.id ? .white : deselectedColor)
                    .background {
                        if currentTab == item.id {
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(selectedColor)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        } else {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(deselectedColor.opacity(0.3), lineWidth: 1)
                        }
                    }
                    .onTapGesture { onSelect(item) }
            }
        }
    }
}
