//
//  PaginationIndicatorBuilder.swift
//  ViewKit
//
//  Created by Imran on 15/3/24.
//

import SwiftUI

public class PaginationIndicatorBuilder {
    
    private var currentIndex: Binding<Int> = .constant(0)
    private var itemCount: Int = 0
    private var activeColor: Color = .blue
    private var inactiveColor: Color = .gray.opacity(0.3)
    private var activeSize: CGSize = CGSize(width: 8, height: 2)
    private var inactiveSize: CGSize = CGSize(width: 8, height: 8)
    private var activeCornerRadius: CGFloat = 4
    private var activeScaleEffect: CGFloat = 2.4
    private var spacing: CGFloat = 16
    
    public init() {}
    
    public func setCurrentIndex(_ currentIndex: Binding<Int>) -> PaginationIndicatorBuilder {
        self.currentIndex = currentIndex
        return self
    }
    
    public func setItemCount(_ itemCount: Int) -> PaginationIndicatorBuilder {
        self.itemCount = itemCount
        return self
    }
    
    public func setActiveColor(_ color: Color) -> PaginationIndicatorBuilder {
        self.activeColor = color
        return self
    }
    
    public func setInactiveColor(_ color: Color) -> PaginationIndicatorBuilder {
        self.inactiveColor = color
        return self
    }
    
    public func setActiveSize(_ size: CGSize) -> PaginationIndicatorBuilder {
        self.activeSize = size
        return self
    }
    
    public func setInactiveSize(_ size: CGSize) -> PaginationIndicatorBuilder {
        self.inactiveSize = size
        return self
    }
    
    public func setActiveCornerRadius(_ cornerRadius: CGFloat) -> PaginationIndicatorBuilder {
        self.activeCornerRadius = cornerRadius
        return self
    }
    
    public func setActiveScaleEffect(_ scale: CGFloat) -> PaginationIndicatorBuilder {
        self.activeScaleEffect = scale
        return self
    }
    
    public func setSpacing(_ spacing: CGFloat) -> PaginationIndicatorBuilder {
        self.spacing = spacing
        return self
    }
    
    public func build() -> PaginationIndicator {
        return PaginationIndicator(
            currentIndex: currentIndex,
            itemCount: itemCount,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            activeSize: activeSize,
            inactiveSize: inactiveSize,
            activeCornerRadius: activeCornerRadius,
            activeScaleEffect: activeScaleEffect,
            spacing: spacing
        )
    }
}

