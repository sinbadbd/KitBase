//
//  KBSlider.swift
//
//
//  Created by Imran on 9/7/24.
//

import SwiftUI
import UIKit

public enum ThumbImage {
    case systemName(String)
    case imageName(String)
}

@MainActor
public struct KBSlider: View {
    @Binding var value: Double
    let rangeBackground: Color
    let range: ClosedRange<Double>
    let trackGradient: Gradient
    let thumbImage: ThumbImage
    let thumbSystemIconColor: Color = .green
    let height: CGFloat
    let thumbSize: CGFloat
#if os(iOS)
    // Initialize haptic feedback generator
    let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .soft)
    #endif
   public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(rangeBackground)
                    .frame(height: height)
                
                Capsule()
                    .fill(LinearGradient(
                        gradient: trackGradient,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .frame(width: CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound)) * geometry.size.width, height: height)
                
                
                // Image(systemName: "rectangle.fill")
                thumbView
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: thumbSize)
                    .foregroundColor(thumbSystemIconColor)
                    .offset(x: CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound)) * (geometry.size.width - thumbSize))
                    .gesture(
                        DragGesture().onChanged { gestureValue in
                            let sliderValue = min(max(0, gestureValue.location.x / geometry.size.width), 1)
                            let newValue = Double(sliderValue) * (range.upperBound - range.lowerBound) + range.lowerBound
                            #if os(iOS)
                            if newValue != self.value {
                                impactFeedbackGenerator.impactOccurred() // Trigger haptic feedback
                                self.value = newValue
                            }
                            #endif
                        }
                    )
            }
        }
        .frame(height: thumbSize)
        .onAppear {
            #if os(iOS)
            impactFeedbackGenerator.prepare()
            #endif
        }
    }
    
    private var thumbView: Image {
        switch thumbImage {
        case .systemName(let systemName):
            return Image(systemName: systemName)
        case .imageName(let imageName):
            return Image(imageName)
        }
    }
}

struct RangeSliderView: View {
    @State private var speedDays = 10.0
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
            KBSlider(
                value: $speedDays, 
                rangeBackground: Color.gray.opacity(0.4),
                range: 0...300,
                trackGradient: Gradient(colors: [.red, .blue]),
                thumbImage: .systemName("rectangle.fill"),
                height: 20,
                thumbSize: 30
            )
            
            
//            HStack {
//                Text("Internet")
//                Spacer()
//                Text(String(format: "%.0f", speedInternet))
//                    .foregroundColor(isEditing ? .red : .blue)
//            }
//            KBSlider(
//                value: $speedInternet,
//                range: 0...3000,
//                trackGradient: Gradient(colors: [Color("pink1"), Color("pink2")]),
//                thumbImage: .systemName("rectangle.fill"),
//                height: 20,
//                thumbSize: 30
//            )
//            
//            HStack {
//                Text("Minute")
//                Spacer()
//                Text(String(format: "%.0f", speedMinute))
//                    .foregroundColor(isEditing ? .red : .blue)
//            }
//            KBSlider(
//                value: $speedMinute,
//                range: 0...500,
//                trackGradient: Gradient(colors: [Color("pink1"), Color("pink2")]),
//                thumbImage: .systemName("rectangle.fill"),
//                height: 20,
//                thumbSize: 30
//            )
//            
//            HStack {
//                Text("Sms")
//                Spacer()
//                Text(String(format: "%.0f", speedSms))
//                    .foregroundColor(isEditing ? .red : .blue)
//            }
//            KBSlider(
//                value: $speedSms,
//                range: 0...100,
//                trackGradient: Gradient(colors: [Color("pink1"), Color("pink2")]),
//                thumbImage: .systemName("rectangle.fill"),
//                height: 20,
//                thumbSize: 30
//            )
        }
        .padding()
    }
}
#Preview {
    RangeSliderView()
}
