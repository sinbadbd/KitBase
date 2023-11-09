//
//  KitBaseButtonStyleBuilder.swift
//
//
//  Created by Imran on 7/10/23.
//

import SwiftUI

import SwiftUI

@available(iOS 15.0, *)
public class KitBaseButtonStyleBuilder {
    private var size: ButtonSize = .md
    private var variant: ButtonVariant = .solid
    private var backgroundColor: Color? = nil
    private var font: Font? = nil
    private var borderColor: Color? = nil
    private var foregroundColor: Color? = nil
    private var opacity: Double? = nil
    private var buttonWidth: CGFloat? = nil
    private var buttonHeight: CGFloat? = nil
    private var buttonCornerRadius: CGFloat? = nil
    private var borderWidth: CGFloat? = nil
    private var icon: Image? = nil
    private var iconColor: Color? = nil
    private var iconWidth: CGFloat? = nil
    private var iconHeight: CGFloat? = nil
    
    public init() {}
    
    public func setSize(_ size: ButtonSize) -> KitBaseButtonStyleBuilder {
        self.size = size
        return self
    }
    
    public func setVariant(_ variant: ButtonVariant) -> KitBaseButtonStyleBuilder {
        self.variant = variant
        return self
    }
    
    public func setBackgroundColor(_ backgroundColor: Color?) -> KitBaseButtonStyleBuilder {
        self.backgroundColor = backgroundColor
        return self
    } 
    public func setFont(_ font: Font?) -> KitBaseButtonStyleBuilder {
        self.font = font
        return self
    }
    
    public func setBorderColor(_ borderColor: Color?) -> KitBaseButtonStyleBuilder {
        self.borderColor = borderColor
        return self
    }
    
    public func setForegroundColor(_ foregroundColor: Color?) -> KitBaseButtonStyleBuilder {
        self.foregroundColor = foregroundColor
        return self
    }
    
    public func setOpacity(_ opacity: Double?) -> KitBaseButtonStyleBuilder {
        self.opacity = opacity
        return self
    }
    
    public func setButtonWidth(_ buttonWidth: CGFloat?) -> KitBaseButtonStyleBuilder {
        self.buttonWidth = buttonWidth
        return self
    }
    
    public func setButtonHeight(_ buttonHeight: CGFloat?) -> KitBaseButtonStyleBuilder {
        self.buttonHeight = buttonHeight
        return self
    }
    
    public func setButtonCornerRadius(_ buttonCornerRadius: CGFloat?) -> KitBaseButtonStyleBuilder {
        self.buttonCornerRadius = buttonCornerRadius
        return self
    }
    
    public func setBorderWidth(_ borderWidth: CGFloat?) -> KitBaseButtonStyleBuilder {
        self.borderWidth = borderWidth
        return self
    }
    
    public func setIcon(_ icon: Image?) -> KitBaseButtonStyleBuilder {
        self.icon = icon
        return self
    }
    
    public func setIconColor(_ iconColor: Color?) -> KitBaseButtonStyleBuilder {
        self.iconColor = iconColor
        return self
    }
    
    public func setIconWidth(_ iconWidth: CGFloat?) -> KitBaseButtonStyleBuilder {
        self.iconWidth = iconWidth
        return self
    }
    
    public func setIconHeight(_ iconHeight: CGFloat?) -> KitBaseButtonStyleBuilder {
        self.iconHeight = iconHeight
        return self
    }
    
    public func build() -> KitBaseButtonStyle {
        return KitBaseButtonStyle(
//            size: size,
//            variant: variant,
            backgroundColor: backgroundColor,
            font: font,
            borderColor: borderColor,
            foregroundColor: foregroundColor,
            opacity: opacity,
            buttonWidth: buttonWidth,
            buttonHeight: buttonHeight,
            buttonCornerRadius: buttonCornerRadius,
            borderWidth: borderWidth,
            icon: icon,
            iconColor: iconColor,
            iconWidth: iconWidth,
            iconHeight: iconHeight
        )
    }
}

@available(iOS 15.0, *)
#Preview {
    ContentBuilderView()
}

@available(iOS 15.0, *)
struct ContentBuilderView: View {
    var body: some View {
        VStack(spacing: 16) {
            Button("icon with button", action: {
                print("")
            })
            .buttonStyle(
                KitBaseButtonStyleBuilder()
//                    .setSize(.md)
//                    .setVariant(.solid)
                    .setBackgroundColor(.blue)
                    .setForegroundColor(.white)
                    .setButtonWidth(200)
                    .setButtonHeight(30)
                    .setIcon(Image(systemName: "heart"))
                    .setIconColor(.red)
                    .setIconWidth(20)
                    .setIconHeight(20)
                    .build()
            )
        }
    }
}
