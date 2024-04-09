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
    
    @Namespace var animation
    @State private var currentTab: UUID
    
    var tabs: [MyTab] // Assume MyTabModel conforms to Identifiable
    
    var body: some View {
        KBTabs.Builder()
            .setSelectedColor(.blue)
            .setDeselectedColor(.gray.opacity(0.7))
            .setBorderColor(.gray.opacity(0.3))
            .setVerticalPadding(8)
            .setHorizontalPadding(12)
            .setImageWidth(24)
            .setImageHeight(24)
            .setScrollDirection(.horizontal) // or .vertical for vertical scrolling
            .build(
                list: tabs,
                currentTab: currentTab,
                onSelect: { selectedTab in
                    withAnimation {
                        self.currentTab = selectedTab.id
                    }
                },
                content: { tab, isSelected in
                    // Define how each tab should look
                    Text(tab.title)
                        .foregroundColor(isSelected ? .white : .gray)
                },
                animation: animation
            )
    }
}

// Assuming a simple MyTab struct for demonstration
struct MyTab: Identifiable {
    var id: String
    var title: String
    var imageName: String
}
