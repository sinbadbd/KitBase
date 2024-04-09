//
//  SwiftUIView.swift
//  
//
//  Created by Imran on 9/4/24.
//

import SwiftUI

public struct KBTabBuilder<T: Identifiable, Content: View>: View {
        var list: [T]
        var currentTab: T.ID
        var onSelect: (T) -> Void
        var content: (T, Bool) -> Content
        var selectedColor: Color
        var deselectedColor: Color
        var borderColor: Color
        var verticalPadding: CGFloat
        var horizontalPadding: CGFloat
        var imageWidth: CGFloat
        var imageHeight: CGFloat
        var animation: Namespace.ID
        
        // Builder class for configuring KBTabs
        public class Builder {
            // Default values
            private var selectedColor: Color = .blue
            private var deselectedColor: Color = .gray
            private var borderColor: Color = .gray.opacity(0.3)
            private var verticalPadding: CGFloat = 8
            private var horizontalPadding: CGFloat = 12
            private var imageWidth: CGFloat = 24
            private var imageHeight: CGFloat = 24
            
            public init() {}
            
            public func setSelectedColor(_ color: Color) -> Builder {
                self.selectedColor = color
                return self
            }
            
            // Additional builder methods for each configurable property...
            // Example:
            public func setBorderColor(_ color: Color) -> Builder {
                self.borderColor = color
                return self
            }
            
            // Method to generate KBTabs with the current configuration
            // This needs to be filled in with the correct parameters and logic
            public func build<T, Content>(
                list: [T],
                currentTab: T.ID,
                onSelect: @escaping (T) -> Void,
                @ViewBuilder content: @escaping (T, Bool) -> Content,
                animation: Namespace.ID
            ) -> KBTab<T, Content> where T: Identifiable {
                KBTab(
                    list: list,
                    currentTab: currentTab,
                    onSelect: onSelect,
                    content: content,
                    selectedColor: selectedColor,
                    deselectedColor: deselectedColor,
                    borderColor: borderColor,
                    verticalPadding: verticalPadding,
                    horizontalPadding: horizontalPadding,
                    imageWidth: imageWidth,
                    imageHeight: imageHeight,
                    animation: animation
                )
            }
        }
    }


#Preview {
    KBTabView()
}


struct KBTabView: View {
    @Namespace var animationNamespace
    @State var selectedTab: UUID
    var tabs: [TabItem] // Assuming TabItem is defined elsewhere
    
    var body: some View {
        KBTabBuilder.Builder()
            .setSelectedColor(.green)
            .setBorderColor(.black.opacity(0.5))
            .build(
                list: tabs,
                currentTab: selectedTab,
                onSelect: { tab in
                    withAnimation {
                        self.selectedTab = tab.id
                    }
                },
                content: { tab, isSelected in
                    VStack {
                        Image(systemName: tab.imageName)
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text(tab.title)
                    }
                    .padding()
                    .background(isSelected ? Color.green : Color.clear)
                    .cornerRadius(10)
                },
                animation: animationNamespace
            )
        
        return tabsView
    }
}
