////
////  SwiftUIView.swift
////
////
////  Created by Imran on 9/4/24.
////
import SwiftUI

public struct KBTabsBuilder<T: Identifiable, Content: View> {
    
    private var list: [T] = []
    private var content: ((T, Bool) -> Content)?
    private var currentTab: T.ID?
    private var onSelect: ((T) -> Void)?
    private var backgroundColor: Color?
    private var selectedColor: Color?
    private var deselectedColor: Color?
    private var borderColor: Color?
    private var borderWidth: CGFloat?
    private var verticalPadding: CGFloat?
    private var horizontalPadding: CGFloat?
    private var imageWidth: CGFloat?
    private var imageHeight: CGFloat?
    private var cornerRadius: CGFloat?
    private var tabSpacing: CGFloat?
    private var tabBackgroundColor: Color?
    private var tabSelectedBackgroundColor: Color?
    private var tabTextColor: Color?
    private var tabSelectedTextColor: Color?
    private var tabFont: Font?
    private var tabSelectedFont: Font?
    private var animationDuration: Double?
    private var scrollDirection: Axis.Set = .horizontal
    private var namespace: Namespace.ID?
    
    public init() { }
    
    public func withList(_ list: [T]) -> Self {
        var builder = self
        builder.list = list
        return builder
    }
    
    public func withContent(@ViewBuilder content: @escaping (T, Bool) -> Content) -> Self {
        var builder = self
        builder.content = content
        return builder
    }
    
    public func withCurrentTab(_ currentTab: T.ID) -> Self {
        var builder = self
        builder.currentTab = currentTab
        return builder
    }
    
    public func onSelect(_ onSelect: @escaping (T) -> Void) -> Self {
        var builder = self
        builder.onSelect = onSelect
        return builder
    }
    
    public func withScrollDirection(_ direction: Axis.Set) -> Self {
        var builder = self
        builder.scrollDirection = direction
        return builder
    }
    
    public func withNamespace(_ namespace: Namespace.ID) -> Self {
        var builder = self
        builder.namespace = namespace
        return builder
    }
    
    public func setBackgroundColor(_ backgroundColor: Color) -> Self {
        var builder = self
        builder.backgroundColor = backgroundColor
        return builder
    }
    
    public func setSelectedColor(_ selectedColor: Color) -> Self {
        var builder = self
        builder.selectedColor = selectedColor
        return builder
    }
    
    public func setDeselectedColor(_ deselectedColor: Color) -> Self {
        var builder = self
        builder.deselectedColor = deselectedColor
        return builder
    }
    
    public func setBorderColor(_ borderColor: Color) -> Self {
        var builder = self
        builder.borderColor = borderColor
        return builder
    }
    
    public func setBorderWidth(_ borderWidth: CGFloat) -> Self {
        var builder = self
        builder.borderWidth = borderWidth
        return builder
    }
    
    public func setVerticalPadding(_ verticalPadding: CGFloat) -> Self {
        var builder = self
        builder.verticalPadding = verticalPadding
        return builder
    }
    
    public func setHorizontalPadding(_ horizontalPadding: CGFloat) -> Self {
        var builder = self
        builder.horizontalPadding = horizontalPadding
        return builder
    }
    
    public func setImageWidth(_ imageWidth: CGFloat) -> Self {
        var builder = self
        builder.imageWidth = imageWidth
        return builder
    }
    
    public func setImageHeight(_ imageHeight: CGFloat) -> Self {
        var builder = self
        builder.imageHeight = imageHeight
        return builder
    }
    
    // Add methods for all other properties...
    
    // Final build method
    public func build() -> some View {
        guard let content = content, let currentTab = currentTab, let onSelect = onSelect, let namespace = namespace else {
            fatalError("Missing required properties for KBTabs")
        }
//        
//        return KBTabs(list: list,
//                      content: content,
//                      currentTab: currentTab,
//                      onSelect: onSelect,
//                      scrollDirection: scrollDirection,
//                      
//                      animation: namespace)
        return KBTabs(list: list, content: content, currentTab: currentTab, onSelect: onSelect, backgroundColor: backgroundColor, selectedColor: selectedColor, deselectedColor: deselectedColor, borderColor: borderColor, borderWidth: borderWidth, verticalPadding: verticalPadding, horizontalPadding: horizontalPadding, imageWidth: imageWidth, imageHeight: imageHeight, animation: namespace)
        // Pass all other properties here...
    }
}

//
//extension KBTabs {
//    class Builder {
//        private var list: [T] = []
//        private var content: ((T, Bool) -> Content)?
//        private var currentSelection: T.ID?
//        private var onSelect: ((T) -> Void)?
//        private var backgroundColor: Color = .white
//        private var selectedColor: Color = .blue
//        private var deselectedColor: Color = .gray
//        private var borderColor: Color = .black
//        private var borderWidth: CGFloat = 1.0
//        private var verticalPadding: CGFloat = 10.0
//        private var horizontalPadding: CGFloat = 10.0
//        private var imageWidth: CGFloat = 24.0
//        private var imageHeight: CGFloat = 24.0
//        private var animation: Namespace.ID
//
//        init(namespace: Namespace.ID) {
//            self.animation = namespace
//        }
//
//        func setList(_ list: [T]) -> Self {
//            self.list = list
//            return self
//        }
//
//        func setContent(_ content: @escaping (T, Bool) -> Content) -> Self {
//            self.content = content
//            return self
//        }
//
//        func setCurrentSelection(_ currentSelection: T.ID?) -> Self {
//            self.currentSelection = currentSelection
//            return self
//        }
//
//        func setOnSelect(_ onSelect: @escaping (T) -> Void) -> Self {
//            self.onSelect = onSelect
//            return self
//        }
//
//        func setBackgroundColor(_ backgroundColor: Color) -> Self {
//            self.backgroundColor = backgroundColor
//            return self
//        }
//
//        func setSelectedColor(_ selectedColor: Color) -> Self {
//            self.selectedColor = selectedColor
//            return self
//        }
//
//        func setDeselectedColor(_ deselectedColor: Color) -> Self {
//            self.deselectedColor = deselectedColor
//            return self
//        }
//
//        func setBorderColor(_ borderColor: Color) -> Self {
//            self.borderColor = borderColor
//            return self
//        }
//
//        func setBorderWidth(_ borderWidth: CGFloat) -> Self {
//            self.borderWidth = borderWidth
//            return self
//        }
//
//        func setVerticalPadding(_ verticalPadding: CGFloat) -> Self {
//            self.verticalPadding = verticalPadding
//            return self
//        }
//
//        func setHorizontalPadding(_ horizontalPadding: CGFloat) -> Self {
//            self.horizontalPadding = horizontalPadding
//            return self
//        }
//
//        func setImageWidth(_ imageWidth: CGFloat) -> Self {
//            self.imageWidth = imageWidth
//            return self
//        }
//
//        func setImageHeight(_ imageHeight: CGFloat) -> Self {
//            self.imageHeight = imageHeight
//            return self
//        }
//
//
//        // Add other setters as needed...
//
//        func build() -> KBTabs<T, Content> where Content: View {
//            // Ensure the content closure is provided before building
//            guard let contentClosure = content else {
//                fatalError("Content closure is not provided.")
//            }
//            return KBTabs(list: list, content: contentClosure, currentSelection: currentSelection, onSelect: onSelect ?? { _ in }, backgroundColor: backgroundColor, selectedColor: selectedColor, deselectedColor: deselectedColor, borderColor: borderColor, borderWidth: borderWidth, verticalPadding: verticalPadding, horizontalPadding: horizontalPadding, imageWidth: imageWidth, imageHeight: imageHeight, animation: animation)
//        }
//    }
//}
//
//
//#Preview {
//    KBTabView()
//}
//
//
//struct KBTabView: View {
//
//    @Namespace var namespace
//    @State private var currentTabID: String
//
//    private let tabs: [MyTab] = [
//        MyTab(id: "home", title: "Home", iconName: "house.fill"),
//        MyTab(id: "search", title: "Search", iconName: "magnifyingglass"),
//        MyTab(id: "settings", title: "Settings", iconName: "gear")
//    ]
//
//    init() {
//        _currentTabID = State(initialValue: tabs.first?.id ?? "")
//    }
//
//    var body: some View {
//        VStack {
//            KBTabs.Builder()
//                .setSelectedColor(.blue)
//                .setDeselectedColor(.gray)
//                .setBorderColor(.clear) // No border for selected tabs in this demo
//                .setVerticalPadding(10)
//                .setHorizontalPadding(10)
//                .setImageWidth(20)
//                .setImageHeight(20)
//                .setScrollDirection(.horizontal)
//                .build(
//                    list: tabs,
//                    currentTab: currentTabID,
//                    onSelect: { selectedTab in
//                        withAnimation(.easeInOut) {
//                            self.currentTabID = selectedTab.id
//                        }
//                    },
//                    content: { tab, isSelected in
//                        // Define how each tab should look
//                        HStack(spacing: 5) {
//                            Image(systemName: tab.iconName)
//                                .resizable()
//                                .frame(width: 20, height: 20)
//                            Text(tab.title)
//                        }
//                        .foregroundColor(isSelected ? .white : .gray)
//                        .padding(isSelected ?  12 : 0)
//                    },
//                    animation: namespace
//                )
//            Spacer()
//        }
//    }
//}
//
//
//// Assuming a simple MyTab struct for demonstration
//struct MyTab: Identifiable {
//    var id: String
//    var title: String
//    var iconName: String
//}
