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

public enum ButtonTextAlignment {
    case left
    case center
    case right
}

//@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
public struct KitBaseButtonStyle: ButtonStyle {
    
    public let backgroundColor: Color?
    public let font: Font?
    public let borderColor: Color?
    public let gradient: LinearGradient?
    public let foregroundColor: Color?
    public let opacity: Double?
    public var buttonWidth: CGFloat? = .infinity
    public let buttonHeight: CGFloat?
    public let buttonCornerRadius: CGFloat?
    public let borderWidth: CGFloat?
    public let systemIcon: String?
    public let image: String?
    public let iconColor: Color?
    public let iconWidth: CGFloat?
    public let iconHeight: CGFloat?
    public var isShowShadow: Bool = true
    public var paddingAll: CGFloat?
    public var paddingHorizontal: CGFloat?
    public var paddingVertical: CGFloat
    public let textAlignment: ButtonTextAlignment
    public var textPaddingHorizontal: CGFloat?
    public var rightText: String?
    public var rightTextColor: Color?
    public var rightTextFont: Font?

    public init(
        
        backgroundColor: Color? = nil,
        gradient: LinearGradient? = nil,
        font: Font? = nil,
        borderColor: Color? = nil,
        foregroundColor: Color? = nil,
        opacity: Double? = nil,
        buttonWidth: CGFloat? = .infinity,
        buttonHeight: CGFloat? = nil,
        buttonCornerRadius: CGFloat? = nil,
        borderWidth: CGFloat? = nil,
        icon: String? = nil,
        image: String? = nil,
        iconColor: Color? = nil,
        iconWidth: CGFloat? = 30,
        iconHeight: CGFloat? = 30,
        isShowShadow: Bool = true,
        paddingAll: CGFloat = 0,
        paddingHorizontal: CGFloat = 12,
        paddingVertical: CGFloat = 10,
        textAlignment: ButtonTextAlignment = .center,
        textPaddingHorizontal: CGFloat? = nil,
        rightText: String? = nil,
        rightTextColor: Color? = nil,
        rightTextFont: Font? = nil
    ) {
        
        self.backgroundColor = backgroundColor
        self.gradient = gradient
        self.font = font
        self.borderColor = borderColor
        self.foregroundColor = foregroundColor
        self.opacity = opacity
        self.buttonWidth = buttonWidth
        self.buttonHeight = buttonHeight
        self.buttonCornerRadius = buttonCornerRadius
        self.borderWidth = borderWidth
        self.systemIcon = icon
        self.image = image
        self.iconColor = iconColor
        self.iconWidth = iconWidth
        self.iconHeight = iconHeight
        self.isShowShadow = isShowShadow
        self.paddingAll = paddingAll
        self.paddingHorizontal = paddingHorizontal
        self.paddingVertical = paddingVertical
        self.textAlignment = textAlignment
        self.textPaddingHorizontal = textPaddingHorizontal
        self.rightText = rightText
        self.rightTextColor = rightTextColor
        self.rightTextFont = rightTextFont
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        
        return HStack {
            if let image = image {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(iconColor ?? foregroundColor)
                    .frame(width: iconWidth, height: iconHeight)
                //                        .padding(.trailing, 8)
            }
            if let icon = systemIcon {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(iconColor ?? foregroundColor)
                    .frame(width: iconWidth, height: iconHeight)
                //                        .padding(.trailing, 8)
            }
            
            if textAlignment == .left || textAlignment == .center {
                Spacer(minLength: textAlignment == .left ? 0 : nil)
            }
            
            HStack{
                configuration.label
                    .font(font)
                    .foregroundColor(foregroundColor)
                    .padding(.horizontal, textPaddingHorizontal ?? 0)
                    .frame(maxWidth: .infinity, alignment: {
                        switch textAlignment {
                        case .left: return .leading
                        case .center: return .center
                        case .right: return .trailing
                        }
                    }())
                
                if let rightText = rightText {
                    Text(rightText)
                        .font(rightTextFont ?? font)
                        .foregroundColor(rightTextColor ?? foregroundColor)
                        .frame(alignment: .trailing)
                }
            }
            
            if textAlignment == .right || textAlignment == .center {
                Spacer(minLength: textAlignment == .right ? 0 : nil)
            }

        }
        
        .frame(width: buttonWidth, height: buttonHeight)
        .padding(paddingAll ?? 0)
        .padding(.horizontal, paddingHorizontal)
        .padding(.vertical, paddingVertical)
        .background(
            Group{
                if let bgGradient = gradient {
                    bgGradient
                } else {
                    backgroundColor ?? Color.primary
                }
            }
        )
        .opacity(opacity ?? 1.0)
        .cornerRadius(buttonCornerRadius ?? 8)
        .overlay(
            RoundedRectangle(cornerRadius: buttonCornerRadius ?? 8)
                .stroke(borderColor ?? .clear, lineWidth: borderWidth ?? 0)
                .shadow(color: !isShowShadow ? .clear : Color(red: 0.38, green: 0.38, blue: 0.44).opacity(0.16), radius: 2, x: 0, y: 2)
            
        )
        .shadow(color: !isShowShadow ? .clear : Color(red: 0.38, green: 0.38, blue: 0.44).opacity(0.16), radius: 2, x: 0, y: 2)
    }
}



//@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
#Preview {
    ContentButtonView()
}

//@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
struct ContentButtonView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image("ic_edit")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background {
                    Color.red
                }
                .frame(width: 30, height: 20)
            Button("icon with button", action: {
                print("print")
            })
            .buttonStyle(KitBaseButtonStyle( backgroundColor: .red, borderColor: .accentColor, foregroundColor:.white, buttonHeight: 20, buttonCornerRadius: 8, icon: "pencil.circle.fill",image: "ic_edit", iconColor: .green, iconWidth: 14, iconHeight: 14))
            
            Button("Solid XS", action: {
                
            })
            .buttonStyle(KitBaseButtonStyle( backgroundColor: .red, borderColor: .accentColor, foregroundColor:.blue, buttonCornerRadius: 8))
            #if os(iOS) || os(macOS) || os(tvOS)
            Button("Subtle MD", action: {
                
            }).padding(.horizontal,16)
             #if os(iOS)
                .buttonStyle(KitBaseButtonStyle( backgroundColor: .clear, borderColor: .yellow, foregroundColor: .blue, buttonWidth: UIScreen.main.bounds.width * 0.80 - 40, borderWidth: 2))
            #elseif os(macOS)
                .buttonStyle(KitBaseButtonStyle( backgroundColor: .clear, borderColor: .yellow, foregroundColor: .blue, buttonWidth: NSScreen.main?.frame.width, borderWidth: 2))
            #endif
            Button("Outline SM", action: {})
                .buttonStyle(KitBaseButtonStyle(backgroundColor: .blue, borderColor: .red, foregroundColor: .yellow, borderWidth: 1))
            
            Button("SwiftUI Solid LG", action: {})
                .buttonStyle(KitBaseButtonStyle(foregroundColor: .red))
            
            Button("Width", action: {print(Int.random(in: 0...100))})
#if os(iOS)
                .buttonStyle(KitBaseButtonStyle(backgroundColor: .black, borderColor: .red, foregroundColor: .white, buttonWidth: 200, buttonHeight: 30, buttonCornerRadius: 4, borderWidth: 1))
#elseif os(macOS)
                .buttonStyle(KitBaseButtonStyle(backgroundColor: .black, borderColor: .red, foregroundColor: .white, buttonWidth: NSScreen.main?.frame.width, buttonHeight: 30, buttonCornerRadius: 4, borderWidth: 1))
#endif
//            GeometryReader { geometry in
                VStack(spacing: 16) {
 
                    Button("test width", action: { print(Int.random(in: 0...100)) })
                        .buttonStyle(KitBaseButtonStyle(
                            backgroundColor: .black,
                            borderColor: .red,
                            foregroundColor: .white,
                            buttonWidth:300, buttonHeight: 30,
                            buttonCornerRadius: 4,
                            borderWidth: 1
                        ))
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                       // .frame(width: geometry.size.width * 0.80 - 40)
                }
//            }
            #endif
        }
    }
}
