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
    private var rangeBackground: Color = .gray
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
    func setRangeBackground(_ bg: Color) -> KBSliderBuilder {
        var builder = self
        builder.rangeBackground = bg
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
            rangeBackground: rangeBackground,
            range: range,
            trackGradient: trackGradient,
            thumbImage: thumbImage,
            height: height,
            thumbSize: thumbSize
        )
    }
}
struct RangeSliderBuilderView: View {
    @State private var speedDays = 3.0
    @State private var speedInternet = 104.0
    @State private var speedMinute = 10.0
    @State private var speedSms = 10.0
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Validity")
                Spacer()
                HStack {
                    Text(String(format: "%.0f", speedDays))
                        .foregroundColor(isEditing ? .red : .blue)
                    Text("Days")
                }
            }
            KBSliderBuilder(value: $speedDays)
                .setRange(0...30)
                .setTrackGradient(Gradient(colors: [Color("pink1"), Color("pink2")]))
                .setThumbImage(.systemName("rectangle.fill"))
                .setHeight(20)
                .setThumbSize(30)
                .build()
            
            HStack {
                Text("Internet")
                Spacer()
                Text(String(format: "%.0f", speedInternet))
                    .foregroundColor(isEditing ? .red : .blue)
            }
            KBSliderBuilder(value: $speedInternet)
                .setRange(0...3000)
                .setTrackGradient(Gradient(colors: [Color("pink1"), Color("pink2")]))
                .setThumbImage(.systemName("rectangle.fill"))
                .setHeight(20)
                .setThumbSize(30)
                .build()
            
            HStack {
                Text("Minute")
                Spacer()
                Text(String(format: "%.0f", speedMinute))
                    .foregroundColor(isEditing ? .red : .blue)
            }
            KBSliderBuilder(value: $speedMinute)
                .setRange(0...500)
                .setTrackGradient(Gradient(colors: [Color("pink1"), Color("pink2")]))
                .setThumbImage(.systemName("rectangle.fill"))
                .setHeight(20)
                .setThumbSize(30)
                .build()
            
            HStack {
                Text("Sms")
                Spacer()
                Text(String(format: "%.0f", speedSms))
                    .foregroundColor(isEditing ? .red : .blue)
            }
            KBSliderBuilder(value: $speedSms)
                .setRange(0...100)
                .setTrackGradient(Gradient(colors: [.red,.blue]))
                .setThumbImage(.systemName("rectangle.fill"))
                .setHeight(20)
                .setThumbSize(30)
                .build()
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct RangeSliderView_Previews: PreviewProvider {
    static var previews: some View {
        RangeSliderBuilderView()
    }
}
