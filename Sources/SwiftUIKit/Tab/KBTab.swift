//
//  SwiftUIView.swift
//
//
//  Created by Imran on 9/4/24.
//

import SwiftUI

@MainActor
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
    var feedbackStyle: FeedbackStyle
    
//    private var isScrollHapticFeedbackEnabled: Bool
//    private var scrollFeedbackStyle: FeedbackStyle
 
    // Haptic feedback generators
    private let tapFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    private let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    
    @State private var previousOffset: CGFloat = 0
    
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
        isHapticFeedbackEnabled: Bool = true,
        feedbackStyle: FeedbackStyle = .soft
//        isScrollHapticFeedbackEnabled: Bool = true,
//        scrollFeedbackStyle: FeedbackStyle = .medium
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
        self.feedbackStyle = feedbackStyle
//        self.isScrollHapticFeedbackEnabled = isScrollHapticFeedbackEnabled
//        self.scrollFeedbackStyle = scrollFeedbackStyle
    }
    
    public var body: some View {
        //        ScrollViewReader { proxy in
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
        .hapticScrollFeedback(feedbackStyle.uiFeedbackStyle)
        .background(GeometryReader { proxy in
            Color.clear
                .preference(key: ScrollOffsetKey.self, value: proxy.frame(in: .global).minY)
        })
        .onPreferenceChange(ScrollOffsetKey.self) { value in
            if abs(value - previousOffset) > 20 { // Adjust the threshold as needed
                let generator = UIImpactFeedbackGenerator(style: feedbackStyle.uiFeedbackStyle)
                generator.impactOccurred()
                previousOffset = value
            }
        }
    }
   
    
    @MainActor
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
                            let generator = UIImpactFeedbackGenerator(style: feedbackStyle.uiFeedbackStyle)
                            generator.impactOccurred()
                        }
                    }
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



import SwiftUI
struct HapticScrollModifier: ViewModifier {
    var feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle
    
    func body(content: Content) -> some View {
        ScrollViewReader { proxy in
            content
                .background(ScrollViewHapticTrigger(feedbackStyle: feedbackStyle))
        }
    }
}

struct ScrollViewHapticTrigger: View {
    var feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle
    @State private var previousOffset: CGFloat = 0
    
    var body: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(key: ScrollOffsetKey.self, value: proxy.frame(in: .global).minY)
                .onPreferenceChange(ScrollOffsetKey.self) { value in
                    if abs(value - previousOffset) > 20 { // Adjust the threshold as needed
                        let generator = UIImpactFeedbackGenerator(style: feedbackStyle)
                        generator.impactOccurred()
                        previousOffset = value
                    }
                }
        }
    }
}

extension View {
    func hapticScrollFeedback(_ feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle = .medium) -> some View {
        self.modifier(HapticScrollModifier(feedbackStyle: feedbackStyle))
    }
}
struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
