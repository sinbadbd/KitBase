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
    public func setCornerRadius(_ cornerRadius: CGFloat) -> Self {
        var builder = self
        builder.cornerRadius = cornerRadius
        return builder
    }
    
    public func build() -> some View {
        guard let content = content, let currentTab = currentTab, let onSelect = onSelect, let namespace = namespace else {
            fatalError("Missing required properties for KBTabs")
        }
        
        return KBTabs(list: list,
                      currentTab: currentTab,
                      onSelect: onSelect,
                      content: content,
                      backgroundColor: backgroundColor ?? .clear, // Provide default values or ensure they are set
                      selectedColor: selectedColor ?? .blue,
                      deselectedColor: deselectedColor ?? .gray,
                      borderColor: borderColor ?? .clear,
                      borderWidth: borderWidth ?? 0,
                      verticalPadding: verticalPadding ?? 0,
                      horizontalPadding: horizontalPadding ?? 0,
                      imageWidth: imageWidth ?? 24, // Assuming default value; adjust as needed
                      imageHeight: imageHeight ?? 24, // Assuming default value; adjust as needed
                      cornerRadius: cornerRadius ?? 0,
                      tabSpacing: tabSpacing ?? 0,
                      scrollDirection: scrollDirection,
                      animation: namespace)
    }
    
}
