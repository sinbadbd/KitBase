//
//  KBSliderBuilder.swift
//
//
//  Created by Imran on 9/7/24.
//

import SwiftUI

struct KBSliderBuilder {
    private var value: Binding<Double>
    private var range: ClosedRange<Double> = 0...1
    private var trackGradient: Gradient = Gradient(colors: [.gray, .black])
    private var thumbImage: ThumbImage = .systemName("circle.fill")
    private var height: CGFloat = 20
    private var thumbSize: CGFloat = 30
    
    init(value: Binding<Double>) {
        self.value = value
    }
    
    func setRange(_ range: ClosedRange<Double>) -> KBSliderBuilder {
        var builder = self
        builder.range = range
        return builder
    }
    
    func setTrackGradient(_ trackGradient: Gradient) -> KBSliderBuilder {
        var builder = self
        builder.trackGradient = trackGradient
        return builder
    }
    
    func setThumbImage(_ thumbImage: ThumbImage) -> KBSliderBuilder {
        var builder = self
        builder.thumbImage = thumbImage
        return builder
    }
    
    func setHeight(_ height: CGFloat) -> KBSliderBuilder {
        var builder = self
        builder.height = height
        return builder
    }
    
    func setThumbSize(_ thumbSize: CGFloat) -> KBSliderBuilder {
        var builder = self
        builder.thumbSize = thumbSize
        return builder
    }
    
    @MainActor func build() -> KBSlider {
        KBSlider(
            value: value,
            range: range,
            trackGradient: trackGradient,
            thumbImage: thumbImage,
            height: height,
            thumbSize: thumbSize
        )
    }
}
