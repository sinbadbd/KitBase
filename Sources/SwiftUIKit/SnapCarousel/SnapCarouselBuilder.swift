//
//  SnapCarouselBuilder.swift
//  ViewKit
//
//  Created by Imran on 15/3/24.
//

import SwiftUI
import Combine

@MainActor
public class SnapCarouselBuilder<Content: View, T: Identifiable> {
    
    private var spacing: CGFloat = 16
    private var edgeSpace: CGFloat = 16
    private var autoScrollInterval: TimeInterval = 3
    private var smallScreenInitialOffsetAdjustment: CGFloat = 45
    private var largeScreenInitialOffsetAdjustment: CGFloat = 55
    private var itemWidthFactor: CGFloat = 2 / 3
    private var items: [T] = []
    private var index: Binding<Int> = .constant(0)
    private var content: ((T) -> Content)? = nil
    private var shouldComputeItemWidthFactor: Bool = false
    private var enableAutoScroll: Bool = true
    private var onTapAction: ((T) -> Void)? = nil
    private var requireOnTap: Bool = false  // Optional, based on your need
    
    public init() {}
    
    public func setSpacing(_ spacing: CGFloat) -> SnapCarouselBuilder {
        self.spacing = spacing
        return self
    }
    
    public func setEdgeSpace(_ edgeSpace: CGFloat) -> SnapCarouselBuilder {
        self.edgeSpace = edgeSpace
        return self
    }
    
    public func setAutoScrollInterval(_ autoScrollInterval: TimeInterval) -> SnapCarouselBuilder {
        self.autoScrollInterval = autoScrollInterval
        return self
    }
    
    public func setSmallScreenInitialOffsetAdjustment(_ adjustment: CGFloat) -> SnapCarouselBuilder {
        self.smallScreenInitialOffsetAdjustment = adjustment
        return self
    }
    
    public func setLargeScreenInitialOffsetAdjustment(_ adjustment: CGFloat) -> SnapCarouselBuilder {
        self.largeScreenInitialOffsetAdjustment = adjustment
        return self
    }
    
    public func setItemWidthFactor(_ factor: CGFloat) -> SnapCarouselBuilder {
        self.itemWidthFactor = factor
        return self
    }
    
    
    public func setItems(_ items: [T], index: Binding<Int>, @ViewBuilder content: @escaping (T) -> Content) -> SnapCarouselBuilder {
        self.items = items
        self.index = index
        self.content = content
        return self
    }
    public func setEnableAutoScroll(_ enable: Bool) -> SnapCarouselBuilder {
        self.enableAutoScroll = enable
        return self
    }
    
    public func setShouldComputeItemWidthFactor(_ compute: Bool) -> SnapCarouselBuilder {
        self.shouldComputeItemWidthFactor = compute
        smallScreenInitialOffsetAdjustment = compute ? 5 : 45
        largeScreenInitialOffsetAdjustment = compute ? 5 : 55
        return self
    }
    
    private func computeItemWidthFactor() {
        // Define thresholds for device categorization
        let screenWidth = UIScreen.main.bounds.width
        let largeDeviceThreshold: CGFloat = 1024 // Example threshold for iPads
        let mediumDeviceThreshold: CGFloat = 768 // Example threshold for larger iPhones
        
        // Adjust itemWidthFactor based on device size
        if screenWidth >= largeDeviceThreshold {
            // Large devices (e.g., iPads) - Show 4 items
            itemWidthFactor = 1 / 4
        } else if screenWidth >= mediumDeviceThreshold {
            // Medium devices (larger iPhones) - Show 3.5 items
            itemWidthFactor = 2 / 7 // Adjust this value as needed to properly fit 3.5 items
        } else {
            // Small devices (smaller iPhones) - Show 1.5 items
            itemWidthFactor = 2 / 3 // Adjust this value as needed to properly fit 1.5 items
        }
    }
    
    public func setOnTapAction(_ action: @escaping (T) -> Void) -> SnapCarouselBuilder {
        self.onTapAction = action
        return self
    }
    
    public func setRequireOnTap(_ require: Bool) -> SnapCarouselBuilder {
        self.requireOnTap = require
        return self
    }
    
    
    public func build() -> SnapCarousel<Content, T> {
        
        if !shouldComputeItemWidthFactor {
            computeItemWidthFactor()
        }
        
        guard let content = self.content else {
            fatalError("SnapCarousel requires content to be set before building.")
        }
        
        if requireOnTap && onTapAction == nil {
            fatalError("SnapCarousel requires an onTap action to be set before building.")
        }
        
        return SnapCarousel(
            spacing: spacing,
            edgeSpace: edgeSpace,
            index: index,
            items: items,
            autoScrollInterval: autoScrollInterval,
            smallScreenInitialOffsetAdjustment: smallScreenInitialOffsetAdjustment,
            largeScreenInitialOffsetAdjustment: largeScreenInitialOffsetAdjustment,
            itemWidthFactor: itemWidthFactor,
            enableAutoScroll: enableAutoScroll,
            onTap: onTapAction,
            content: content
        )
    }
}
