
// KitBaseButtonStyleBuilder.swift

/**
 `KitBaseButtonStyleBuilder` is a class designed to build custom button styles with various configurable parameters.
 
 - Note: This class supports SwiftUI and is available on iOS 15.0+, macOS 13.0+, watchOS 8, and tvOS 13.
 
 - Author: Imran
 - Date: 7/10/23
 */
import SwiftUI
public class KitBaseButtonStyleBuilder {
    // MARK: - Properties
    
    // Various parameters for configuring button style
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
    private var systemIcon: String? = nil
    private var image: String? = nil
    private var iconColor: Color? = nil
    private var iconWidth: CGFloat? = nil
    private var iconHeight: CGFloat? = nil
    public var isShowShadow: Bool = true
    
    // Padding properties
    public var paddingAll: CGFloat?
    public var paddingHorizontal: CGFloat?
    public var paddingVertical: CGFloat?
    
    // MARK: - Initializer
    
    /**
     Initializes a new instance of `KitBaseButtonStyleBuilder`.
     */
    public init() {}
    
    // MARK: - Configuration Methods
    
    /**
     Sets the button size.
     
     - Parameter size: The size of the button.
     
     - Returns: The modified instance for method chaining.
     */
    public func setSize(_ size: ButtonSize) -> KitBaseButtonStyleBuilder {
        self.size = size
        return self
    }
    
    /**
     Sets the button variant.
     
     - Parameter variant: The variant of the button.
     
     - Returns: The modified instance for method chaining.
     */
    public func setVariant(_ variant: ButtonVariant) -> KitBaseButtonStyleBuilder {
        self.variant = variant
        return self
    }
    
    /**
     Sets the background color of the button.
     
     - Parameter backgroundColor: The background color of the button.
     
     - Returns: The modified instance for method chaining.
     */
    public func setBackgroundColor(_ backgroundColor: Color?) -> KitBaseButtonStyleBuilder {
        self.backgroundColor = backgroundColor
        return self
    }
    
    /**
     Sets the font of the button.
     
     - Parameter font: The font of the button.
     
     - Returns: The modified instance for method chaining.
     */
    public func setFont(_ font: Font?) -> KitBaseButtonStyleBuilder {
        self.font = font
        return self
    }
    
    /**
     Sets the border color of the button.
     
     - Parameter borderColor: The border color of the button.
     
     - Returns: The modified instance for method chaining.
     */
    public func setBorderColor(_ borderColor: Color?) -> KitBaseButtonStyleBuilder {
        self.borderColor = borderColor
        return self
    }
    
    /**
     Sets the foreground color of the button.
     
     - Parameter foregroundColor: The foreground color of the button.
     
     - Returns: The modified instance for method chaining.
     */
    public func setForegroundColor(_ foregroundColor: Color?) -> KitBaseButtonStyleBuilder {
        self.foregroundColor = foregroundColor
        return self
    }
    
    /**
     Sets the opacity of the button.
     
     - Parameter opacity: The opacity of the button.
     
     - Returns: The modified instance for method chaining.
     */
    public func setOpacity(_ opacity: Double?) -> KitBaseButtonStyleBuilder {
        self.opacity = opacity
        return self
    }
    
    /**
     Sets the width of the button.
     
     - Parameter buttonWidth: The width of the button.
     
     - Returns: The modified instance for method chaining.
     */
    public func setButtonWidth(_ buttonWidth: CGFloat?) -> KitBaseButtonStyleBuilder {
        self.buttonWidth = buttonWidth
        return self
    }
    
    /**
     Sets the height of the button.
     
     - Parameter buttonHeight: The height of the button.
     
     - Returns: The modified instance for method chaining.
     */
    public func setButtonHeight(_ buttonHeight: CGFloat?) -> KitBaseButtonStyleBuilder {
        self.buttonHeight = buttonHeight
        return self
    }
    
    /**
     Sets the corner radius of the button.
     
     - Parameter buttonCornerRadius: The corner radius of the button.
     
     - Returns: The modified instance for method chaining.
     */
    public func setButtonCornerRadius(_ buttonCornerRadius: CGFloat?) -> KitBaseButtonStyleBuilder {
        self.buttonCornerRadius = buttonCornerRadius
        return self
    }
    
    /**
     Sets the border width of the button.
     
     - Parameter borderWidth: The border width of the button.
     
     - Returns: The modified instance for method chaining.
     */
    public func setBorderWidth(_ borderWidth: CGFloat?) -> KitBaseButtonStyleBuilder {
        self.borderWidth = borderWidth
        return self
    }
    
    /**
     Sets the system icon for the button.
     
     - Parameter icon: The name of the system icon.
     
     - Returns: The modified instance for method chaining.
     */
    public func setIcon(_ icon: String?) -> KitBaseButtonStyleBuilder {
        self.systemIcon = icon
        return self
    }
    
    /**
     Sets the image for the button.
     
     - Parameter image: The name of the image.
     
     - Returns: The modified instance for method chaining.
     */
    public func setImage(_ image: String?) -> KitBaseButtonStyleBuilder {
        self.image = image
        return self
    }
    
    /**
     Sets the color of the button icon.
     
     - Parameter iconColor: The color of the button icon.
     
     - Returns: The modified instance for method chaining.
     */
    public func setIconColor(_ iconColor: Color?) -> KitBaseButtonStyleBuilder {
        self.iconColor = iconColor
        return self
    }
    
    /**
     Sets the width of the button icon.
     
     - Parameter iconWidth: The width of the button icon.
     
     - Returns: The modified instance for method chaining.
     */
    public func setIconWidth(_ iconWidth: CGFloat?) -> KitBaseButtonStyleBuilder {
        self.iconWidth = iconWidth
        return self
    }
    
    /**
     Sets the height of the button icon.
     
     - Parameter iconHeight: The height of the button icon.
     
     - Returns: The modified instance for method chaining.
     */
    public func setIconHeight(_ iconHeight: CGFloat?) -> KitBaseButtonStyleBuilder {
        self.iconHeight = iconHeight
        return self
    }
    
    /**
     Sets whether to show a shadow for the button.
     
     - Parameter isShowShadow: A boolean value indicating whether to show a shadow.
     
     - Returns: The modified instance for method chaining.
     */
    public func setShowShadow(_ isShowShadow: Bool?) -> KitBaseButtonStyleBuilder {
        self.isShowShadow = isShowShadow ?? true
        return self
    }
    
    /**
     Sets the padding for all sides of the button.
     
     - Parameter paddingAll: The padding for all sides.
     
     - Returns: The modified instance for method chaining.
     */
    public func setPaddingAll(paddingAll: CGFloat?) -> KitBaseButtonStyleBuilder {
        self.paddingAll = paddingAll
        return self
    }
    
    /**
     Sets the horizontal padding for the button.
     
     - Parameter paddingHorizontal: The horizontal padding for the button.
     
     - Returns: The modified instance for method chaining.
     */
    public func setPaddingHorizontal(paddingHorizontal: CGFloat?) -> KitBaseButtonStyleBuilder {
        self.paddingHorizontal = paddingHorizontal
        return self
    }
    
    /**
     Sets the vertical padding for the button.
     
     - Parameter paddingVertical: The vertical padding for the button.
     
     - Returns: The modified instance for method chaining.
     */
    public func setPaddingVertical(paddingVertical: CGFloat?) -> KitBaseButtonStyleBuilder {
        self.paddingVertical = paddingVertical
        return self
    }
    
    // MARK: - Build Method
    
    /**
     Builds and returns a `KitBaseButtonStyle` instance with the configured parameters.
     
     - Returns: A `KitBaseButtonStyle` instance.
     */
    public func build() -> KitBaseButtonStyle {
        return KitBaseButtonStyle(
            backgroundColor: backgroundColor,
            font: font,
            borderColor: borderColor,
            foregroundColor: foregroundColor,
            opacity: opacity,
            buttonWidth: buttonWidth,
            buttonHeight: buttonHeight,
            buttonCornerRadius: buttonCornerRadius,
            borderWidth: borderWidth,
            icon: systemIcon,
            image: image,
            iconColor: iconColor,
            iconWidth: iconWidth,
            iconHeight: iconHeight,
            isShowShadow: isShowShadow,
            paddingAll: paddingAll ?? 0,
            paddingHorizontal: paddingHorizontal ?? 12,
            paddingVertical: paddingVertical ?? 10
        )
    }
}

// ContentBuilderView.swift

/**
 `ContentBuilderView` is a SwiftUI view demonstrating the usage of `KitBaseButtonStyleBuilder`.
 
 - Note: This view includes an example of creating a button with specific style configurations.
 
 - Author: Imran
 - Date: 7/10/23
 */
struct ContentBuilderView: View {
    var body: some View {
        VStack(spacing: 16) {
            Button("icon with button", action: {
                print("")
            })
            .buttonStyle(
                KitBaseButtonStyleBuilder()
                    .setBackgroundColor(.blue)
                    .setForegroundColor(.white)
//                    .setButtonWidth(200)
//                    .setButtonHeight(30)
//                    .setIcon("square.and.arrow.up")
//                    .setImage("ic_edit")
//                    .setIconColor(.red)
//                    .setIconColor(.red)
                    .setIconWidth(20)
                    .setIconHeight(20)
//                    .setPaddingVertical(paddingVertical: 10)
//                    .setPaddingHorizontal(paddingHorizontal: 16)
                    .build()
            )
        }
    }
}

#Preview {
    ContentBuilderView()
}
