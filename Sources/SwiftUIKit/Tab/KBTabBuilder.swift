//
//  SwiftUIView.swift
//
//
//  Created by Imran on 9/4/24.
//

import SwiftUI

extension KBTabs {
    public class Builder {
        private var selectedColor: Color = .blue
        private var deselectedColor: Color = .gray
        private var borderColor: Color = .gray
        private var verticalPadding: CGFloat = 10
        private var horizontalPadding: CGFloat = 10
        private var imageWidth: CGFloat = 24
        private var imageHeight: CGFloat = 24
        private var scrollDirection: Axis.Set = .horizontal
        
        public init() {}
        
        public func setSelectedColor(_ color: Color) -> Builder {
            self.selectedColor = color
            return self
        }
        
        public func setDeselectedColor(_ color: Color) -> Builder {
            self.deselectedColor = color
            return self
        }
        
        public func setBorderColor(_ color: Color) -> Builder {
            self.borderColor = color
            return self
        }
        
        public func setVerticalPadding(_ padding: CGFloat) -> Builder {
            self.verticalPadding = padding
            return self
        }
        
        public func setHorizontalPadding(_ padding: CGFloat) -> Builder {
            self.horizontalPadding = padding
            return self
        }
        
        public func setImageWidth(_ width: CGFloat) -> Builder {
            self.imageWidth = width
            return self
        }
        
        public func setImageHeight(_ height: CGFloat) -> Builder {
            self.imageHeight = height
            return self
        }
        
        public func setScrollDirection(_ direction: Axis.Set) -> Builder {
            self.scrollDirection = direction
            return self
        }
        
        public func build<T: Identifiable, Content: View>(
            list: [T],
            currentTab: T.ID,
            onSelect: @escaping (T) -> Void,
            content: @escaping (T, Bool) -> Content,
            animation: Namespace.ID
        ) -> KBTabs<T, Content> {
            KBTabs(
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
                scrollDirection: scrollDirection,
                animation: animation
            )
        }
    }
}


#Preview {
    KBTabView()
}


struct KBTabView: View {
    @Namespace var namespace
    @State private var currentTabID: String
    
    private let tabs: [MyTab] = [
        TabItem(id: "home", title: "Home", iconName: "house.fill"),
        TabItem(id: "search", title: "Search", iconName: "magnifyingglass"),
        TabItem(id: "settings", title: "Settings", iconName: "gear")
    ]
    
    init() {
        _currentTabID = State(initialValue: tabs.first?.id ?? "")
    }
    
    var body: some View {
        VStack {
            KBTabs.Builder()
                .setSelectedColor(.blue)
                .setDeselectedColor(.gray)
                .setBorderColor(.clear) // No border for selected tabs in this demo
                .setVerticalPadding(10)
                .setHorizontalPadding(10)
                .setImageWidth(20)
                .setImageHeight(20)
                .setScrollDirection(.horizontal)
                .build(
                    list: tabs,
                    currentTab: currentTabID,
                    onSelect: { selectedTab in
                        withAnimation(.easeInOut) {
                            self.currentTabID = selectedTab.id
                        }
                    },
                    content: { tab, isSelected in
                        // Define how each tab should look
                        HStack(spacing: 5) {
                            Image(systemName: tab.iconName)
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text(tab.title)
                        }
                        .foregroundColor(isSelected ? .white : .gray)
                        .padding(isSelected ? .vertical : 0)
                    },
                    animation: namespace
                )
            Spacer()
        }
    }
}


// Assuming a simple MyTab struct for demonstration
struct MyTab: Identifiable {
    var id: String
    var title: String
    var imageName: String
}
