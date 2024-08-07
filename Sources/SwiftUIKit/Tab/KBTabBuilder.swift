////
////  SwiftUIView.swift
////
////
////  Created by Imran on 9/4/24.
////
import SwiftUI

@MainActor
public struct KBTabsBuilder<T: Identifiable, Content: View> {
    
    private var list: [T] = []
    private var content: ((T, Bool) -> Content)?
    private var currentTab: T.ID?
    private var onTap: ((T) -> Void)?
    private var backgroundColor: Color?
    private var selectedColor: Color?
    private var deselectedColor: Color?
    private var borderColor: Color?
    private var borderWidth: CGFloat?
    private var borderBottom: CGFloat?
    private var verticalPadding: CGFloat?
    private var horizontalPadding: CGFloat?
    private var imageWidth: CGFloat?
    private var imageHeight: CGFloat?
    private var cornerRadius: CGFloat?
    private var tabSpacing: CGFloat?
    private var scrollDirection: Axis.Set = .horizontal
    private var namespace: Namespace.ID?
    private var selectionStyle: KBTabs<T, Content>.SelectionStyle = .bgColor
    private var isHapticFeedbackEnabled: Bool = true
    private var feedbackStyle: FeedbackStyle = .soft
    private var requireOnTap: Bool = false
    
    // Haptic feedback generators
    private let tapFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    private let selectionFeedbackGenerator = UISelectionFeedbackGenerator()

    
//    private var isScrollHapticFeedbackEnabled: Bool = true
//    private var scrollFeedbackStyle: FeedbackStyle = .medium

    
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
    
    public func onTap(_ onTap: @escaping (T) -> Void) -> Self {
        var builder = self
        builder.onTap = onTap
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
    public func setBorderBottom(_ bottomBottom: CGFloat) -> Self {
        var builder = self
        builder.borderBottom = bottomBottom
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
    
    public func setCornerRadius(_ cornerRadius: CGFloat) -> Self {
        var builder = self
        builder.cornerRadius = cornerRadius
        return builder
    }
    
    public func setTabSpacing(_ tabSpacing: CGFloat) -> Self {
        var builder = self
        builder.tabSpacing = tabSpacing
        return builder
    }
    
    public func setSelectionStyle(_ selectionStyle: KBTabs<T, Content>.SelectionStyle) -> Self {
        var builder = self
        builder.selectionStyle = selectionStyle
        return builder
    }
    
    public func enableHapticFeedback(_ isEnabled: Bool) -> Self {
        var builder = self
        builder.isHapticFeedbackEnabled = isEnabled
        return builder
    }
    
    public func setFeedbackStyle(_ feedbackStyle: FeedbackStyle) -> Self {
        var builder = self
        builder.feedbackStyle = feedbackStyle
        return builder
    }
    
//    public func enableScrollHapticFeedback(_ isEnabled: Bool) -> Self {
//        var builder = self
//        builder.isScrollHapticFeedbackEnabled = isEnabled
//        return builder
//    }
//    
//    public func setScrollFeedbackStyle(_ style: FeedbackStyle) -> Self {
//        var builder = self
//        builder.scrollFeedbackStyle = style
//        return builder
//    }
    
    public func setRequireOnTap(_ require: Bool) -> Self {
        var builder = self
        builder.requireOnTap = require
        return self
    }
    
    
    @MainActor public func build() -> some View {
        
        guard let content = content, let currentTab = currentTab, /*let onTap = onTap,*/ let namespace = namespace else {
            fatalError("Missing required properties for KBTabs")
        }
        
        // Prepare haptic feedback generators
        tapFeedbackGenerator.prepare()
        selectionFeedbackGenerator.prepare()

        
        if requireOnTap && onTap == nil {
            fatalError("SnapCarousel requires an onTap action to be set before building.")
        }
        
        return ScrollViewReader { proxy in
            KBTabs(
                list: list,
                currentTab: currentTab,
                onTap: { item in
                    onTap?(item)
                    proxy.scrollTo(item.id, anchor: .center)
                    if isHapticFeedbackEnabled {
                        tapFeedbackGenerator.impactOccurred()
                    }
                },
                content: content,
                backgroundColor: backgroundColor ?? .clear,
                selectedColor: selectedColor ?? .blue,
                deselectedColor: deselectedColor ?? .gray,
                borderColor: borderColor ?? .clear,
                borderWidth: borderWidth ?? 0,
                borderBottom: borderBottom ?? 0,
                verticalPadding: verticalPadding ?? 0,
                horizontalPadding: horizontalPadding ?? 0,
                imageWidth: imageWidth ?? 24,
                imageHeight: imageHeight ?? 24,
                cornerRadius: cornerRadius ?? 0,
                tabSpacing: tabSpacing ?? 0,
                scrollDirection: scrollDirection,
                animation: namespace,
                selectionStyle: selectionStyle,
                isHapticFeedbackEnabled: isHapticFeedbackEnabled,
                feedbackStyle: feedbackStyle
                //            isScrollHapticFeedbackEnabled: isScrollHapticFeedbackEnabled,
                //            scrollFeedbackStyle: scrollFeedbackStyle
            )
        }
    }
}


#Preview{
    TabItemView()
}

struct TabItem: Identifiable {
    let id: UUID
    let title: String
}

struct TabItemView: View {
    @Namespace private var animation
    @State private var selectedTab: UUID = UUID()
    
    private let tabs = [
        TabItem(id: UUID(), title: "Home"),
        TabItem(id: UUID(), title: "Profile"),
        TabItem(id: UUID(), title: "A"),
        TabItem(id: UUID(), title: "V"),
        TabItem(id: UUID(), title: "V"),
        TabItem(id: UUID(), title: "C"),
        TabItem(id: UUID(), title: "V"),
        TabItem(id: UUID(), title: "VR")
    ]
    
    var body: some View {
        let tabBuilder = KBTabsBuilder<TabItem, Text>()
            .withList(tabs)
            .withCurrentTab(selectedTab)
            .withContent { item, isSelected in
                Text(item.title)
                    .font(isSelected ? .headline : .subheadline)
                    .foregroundColor(isSelected ? .red : .black)
            }
            .onTap { item in
                selectedTab = item.id
            }
            .withScrollDirection(.horizontal)
            .withNamespace(animation)
            .setBackgroundColor(Color.gray.opacity(0.2))
            .setSelectedColor(Color.blue)
            .setDeselectedColor(Color.white)
            .setBorderColor(Color.black)
            .setBorderWidth(1)
            .setVerticalPadding(10)
            .setHorizontalPadding(20)
            .setCornerRadius(10)
            .setTabSpacing(10)
        
        tabBuilder.build()
            .padding()
    }
    }
