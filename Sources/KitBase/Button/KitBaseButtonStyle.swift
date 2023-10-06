//
//  KitBaseButtonStyle.swift
//
//
//  Created by Imran on 6/10/23.
//

import SwiftUI

public enum ButtonSize {
    case xs, sm, md, lg
}

public enum ButtonVariant {
    case solid, subtle, outline
}

@available(iOS 15.0, *)
public struct KitBaseButtonStyle: ButtonStyle {
    
    public let size: ButtonSize
    public let variant: ButtonVariant
    public let backgroundColor: Color?
    public let borderColor: Color?
    public let foregroundColor: Color?
    public let opacity: Double?
    public let buttonWidth: CGFloat?
    public let buttonHeight: CGFloat?
    public let buttonCornerRadius: CGFloat?
    public let borderWidth: CGFloat?
    
    public init(
        size: ButtonSize,
        variant: ButtonVariant,
        backgroundColor: Color? = nil,
        borderColor: Color? = nil,
        foregroundColor: Color? = nil,
        opacity: Double? = nil,
        buttonWidth: CGFloat? = nil,
        buttonHeight: CGFloat? = nil,
        buttonCornerRadius: CGFloat? = nil,
        borderWidth: CGFloat? = nil
    ) {
        self.size = size
        self.variant = variant
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.foregroundColor = foregroundColor
        self.opacity = opacity
        self.buttonWidth = buttonWidth
        self.buttonHeight = buttonHeight
        self.buttonCornerRadius = buttonCornerRadius
        self.borderWidth = borderWidth
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let padding: EdgeInsets
        let background: Color
        
        switch size {
        case .xs:
            padding = EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12)
        case .sm:
            padding = EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        case .md:
            padding = EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        case .lg:
            padding = EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        }
        
        switch variant {
        case .solid:
            background = backgroundColor ?? .clear
        case .subtle:
            background = backgroundColor ?? .clear
        case .outline:
            background = Color.clear
        }
        
        return Button(action: {}) {
            configuration.label
                .frame(width: buttonWidth, height: buttonHeight)
                .foregroundColor(foregroundColor)
                .padding(padding)
                .background(background)
                .opacity(opacity ?? 1.0)
                .cornerRadius(buttonCornerRadius ?? 8)
                .overlay(
                    RoundedRectangle(cornerRadius: buttonCornerRadius ?? 8)
                        .stroke(borderColor ?? .clear, lineWidth: borderWidth ?? 0)
                )
        }
    }
}



@available(iOS 15.0, *)
#Preview {
    ContentButtonView()
}

@available(iOS 15.0, *)
struct ContentButtonView: View {
    var body: some View {
        VStack(spacing: 16) {
            Button("Solid XS", action: {})
                .buttonStyle(KitBaseButtonStyle(size: .lg, variant: .solid, backgroundColor: .red, borderColor: .accentColor, foregroundColor:.blue, buttonCornerRadius: 8))
            
            Button("Subtle MD", action: {})
                .buttonStyle(KitBaseButtonStyle(size: .md, variant: .solid, backgroundColor: .green, borderColor: .yellow, foregroundColor: .blue, buttonWidth: UIScreen.main.bounds.width * 0.8, borderWidth: 2))
            
            Button("Outline SM", action: {})
                .buttonStyle(KitBaseButtonStyle(size: .sm, variant: .outline, backgroundColor: .blue, borderColor: .red, foregroundColor: .yellow, borderWidth: 1))
            
            Button("SwiftUI Solid LG", action: {})
                .buttonStyle(KitBaseButtonStyle(size: .sm, variant: .solid, foregroundColor: .red))
        }
    }
}
