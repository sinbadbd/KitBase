//
//  PaginationIndicator.swift
//  ViewKit
//
//  Created by Imran on 15/3/24.
//

import SwiftUI

public struct PaginationIndicator: View {
    
    @Binding var currentIndex: Int
    public let itemCount: Int
    public let activeColor: Color
    public let inactiveColor: Color
    public let activeSize: CGSize
    public let inactiveSize: CGSize
    public let activeCornerRadius: CGFloat
    public let activeScaleEffect: CGFloat
    public let spacing: CGFloat
    
    public init(
        currentIndex: Binding<Int>,
        itemCount: Int,
        activeColor: Color,
        inactiveColor: Color,
        activeSize: CGSize,
        inactiveSize: CGSize,
        activeCornerRadius: CGFloat,
        activeScaleEffect: CGFloat,
        spacing: CGFloat
    ) {
            
        self._currentIndex = currentIndex
        self.itemCount = itemCount
        self.activeColor = activeColor
        self.inactiveColor = inactiveColor
        self.activeSize = activeSize
        self.inactiveSize = inactiveSize
        self.activeCornerRadius = activeCornerRadius
        self.activeScaleEffect = activeScaleEffect
        self.spacing = spacing
    }
    
    public var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<itemCount, id: \.self) { index in
                if currentIndex == index {
                    RoundedRectangle(cornerRadius: activeCornerRadius)
                        .fill(activeColor)
                        .frame(width: activeSize.width, height: activeSize.height)
                        .scaleEffect(currentIndex == index ? activeScaleEffect : 1)
                        .animation(.spring(), value: currentIndex == index)
                } else {
                    Circle()
                        .fill(inactiveColor)
                        .frame(width: inactiveSize.width, height: inactiveSize.height)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}


//#Preview {
//    PaginationIndicator()
//}
