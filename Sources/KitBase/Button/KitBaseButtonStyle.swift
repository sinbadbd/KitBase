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
    
    public let backgroundColor: Color?
    public let font: Font?
    public let borderColor: Color?
    public let foregroundColor: Color?
    public let opacity: Double?
    public let buttonWidth: CGFloat?
    public let buttonHeight: CGFloat?
    public let buttonCornerRadius: CGFloat?
    public let borderWidth: CGFloat?
    public let icon: Image?
    public let iconColor: Color?
    public let iconWidth: CGFloat?
    public let iconHeight: CGFloat?
    
    public init(
        
        backgroundColor: Color? = nil,
        font: Font? = nil,
        borderColor: Color? = nil,
        foregroundColor: Color? = nil,
        opacity: Double? = nil,
        buttonWidth: CGFloat? = nil,
        buttonHeight: CGFloat? = nil,
        buttonCornerRadius: CGFloat? = nil,
        borderWidth: CGFloat? = nil,
        icon: Image? = nil,
        iconColor: Color? = nil,
        iconWidth: CGFloat? = 30,
        iconHeight: CGFloat? = 30
    ) {
        
        self.backgroundColor = backgroundColor
        self.font = font
        self.borderColor = borderColor
        self.foregroundColor = foregroundColor
        self.opacity = opacity
        self.buttonWidth = buttonWidth
        self.buttonHeight = buttonHeight
        self.buttonCornerRadius = buttonCornerRadius
        self.borderWidth = borderWidth
        self.icon = icon
        self.iconColor = iconColor
        self.iconWidth = iconWidth
        self.iconHeight = iconHeight
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        
        return  HStack {
            if let icon = icon {
                icon
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(iconColor ?? foregroundColor)
                    .frame(width: iconWidth, height: iconHeight)
                //                        .padding(.trailing, 8)
            }
            configuration.label
                .font(font)
                .foregroundColor(foregroundColor)
        }
        
        .frame(width: buttonWidth, height: buttonHeight)
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(backgroundColor)
        .opacity(opacity ?? 1.0)
        .cornerRadius(buttonCornerRadius ?? 8)
       // .shadow(color: Color(red: 0.38, green: 0.38, blue: 0.44).opacity(0.16), radius: 2, x: 0, y: 2)

        .overlay(
            RoundedRectangle(cornerRadius: buttonCornerRadius ?? 8)
                .stroke(borderColor ?? .clear, lineWidth: borderWidth ?? 0)
                .shadow(color: Color(red: 0.38, green: 0.38, blue: 0.44).opacity(0.16), radius: 2, x: 0, y: 2)
            
        )
        .shadow(color: Color(red: 0.38, green: 0.38, blue: 0.44).opacity(0.16), radius: 2, x: 0, y: 2)
        
        //        }
        // .opacity(icon != nil ? 1.0 : 0.0) // Hide button if icon is nil
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
            Button("icon with button", action: {
                print("print")
            })
            .buttonStyle(KitBaseButtonStyle( backgroundColor: .red, borderColor: .accentColor, foregroundColor:.white, buttonHeight: 20, buttonCornerRadius: 8, icon: Image(systemName: "pencil.circle.fill"), iconColor: .green, iconWidth: 14, iconHeight: 14))
            
            Button("Solid XS", action: {
                
            })
            .buttonStyle(KitBaseButtonStyle( backgroundColor: .red, borderColor: .accentColor, foregroundColor:.blue, buttonCornerRadius: 8))
            
            Button("Subtle MD", action: {})
                .buttonStyle(KitBaseButtonStyle( backgroundColor: .clear, borderColor: .yellow, foregroundColor: .blue, buttonWidth: UIScreen.main.bounds.width * 0.8, borderWidth: 2))
            
            Button("Outline SM", action: {})
                .buttonStyle(KitBaseButtonStyle(backgroundColor: .blue, borderColor: .red, foregroundColor: .yellow, borderWidth: 1))
            
            Button("SwiftUI Solid LG", action: {})
                .buttonStyle(KitBaseButtonStyle(foregroundColor: .red))
            
            Button("Width", action: {print(Int.random(in: 0...100))})
                .buttonStyle(KitBaseButtonStyle(backgroundColor: .black, borderColor: .red, foregroundColor: .white, buttonWidth: UIScreen.main.bounds.width * 0.80 - 40, buttonHeight: 30, buttonCornerRadius: 4, borderWidth: 1))
        }
    }
}
