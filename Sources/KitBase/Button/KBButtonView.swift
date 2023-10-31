//
//  KitbaseCircleButtonView.swift
//
//
//  Created by Imran on 31/10/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct KBButtonView: View {
    
    public let iconName: String
    public let foregroundColor: Color
    public let backgroundColor: Color
    public let borderColor: Color
    public let width: CGFloat
    public let height: CGFloat
    public let fontSize: CGFloat
    
    public init(iconName: String, foregroundColor: Color, backgroundColor: Color, borderColor: Color, width: CGFloat, height: CGFloat, fontSize: CGFloat) {
        self.iconName = iconName
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.width = width
        self.height = height
        self.fontSize = fontSize
    }
    public var body: some View {
        Image(systemName: iconName)
            .font(.system(size: fontSize))
            .foregroundColor(foregroundColor)
            .frame(width: width, height: height)
            .padding()
            .background(
                Circle()
                    .foregroundColor(backgroundColor)
            )
            .overlay{
                Circle()
                    .stroke(lineWidth: 1)
                    .foregroundColor(borderColor)
            }
    }
}

@available(iOS 15.0, *)
struct KBButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none, value: 1)
    }
}

@available(iOS 15.0, *)
#Preview {
    KBButtonView(iconName: "info", foregroundColor: .red, backgroundColor: .gray, borderColor: .blue, width: 40, height: 40, fontSize: 24)
        .padding()
        .previewLayout(.fixed(width: 100, height: 100))
}
