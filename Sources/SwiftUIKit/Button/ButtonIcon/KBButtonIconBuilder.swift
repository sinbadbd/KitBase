//
//  File.swift
//  
//
//  Created by Imran on 17/6/24.
//

import SwiftUI

public class KBButtonIconBuilder {
    private var imageType: ImageType = .image
    private var imageViewType: ImageViewType = .circle
    private var iconName: String = ""
    private var foregroundColor: Color = .black
    private var backgroundColor: Color = .white
    private var borderColor: Color = .clear
    private var width: CGFloat = 50
    private var height: CGFloat = 50
    private var fontSize: CGFloat = 16
    
    public init() {}
    
    public func setImageType(_ imageType: ImageType) -> KBButtonIconBuilder {
        self.imageType = imageType
        return self
    }
    
    public func setImageViewType(_ imageViewType: ImageViewType) -> KBButtonIconBuilder {
        self.imageViewType = imageViewType
        return self
    }
    
    public func setIconName(_ iconName: String) -> KBButtonIconBuilder {
        self.iconName = iconName
        return self
    }
    
    public func setForegroundColor(_ foregroundColor: Color) -> KBButtonIconBuilder {
        self.foregroundColor = foregroundColor
        return self
    }
    
    public func setBackgroundColor(_ backgroundColor: Color) -> KBButtonIconBuilder {
        self.backgroundColor = backgroundColor
        return self
    }
    
    public func setBorderColor(_ borderColor: Color) -> KBButtonIconBuilder {
        self.borderColor = borderColor
        return self
    }
    
    public func setWidth(_ width: CGFloat) -> KBButtonIconBuilder {
        self.width = width
        return self
    }
    
    public func setHeight(_ height: CGFloat) -> KBButtonIconBuilder {
        self.height = height
        return self
    }
    
    public func setFontSize(_ fontSize: CGFloat) -> KBButtonIconBuilder {
        self.fontSize = fontSize
        return self
    }
    
    public func build() -> KBButtonIcon {
        return KBButtonIcon(
            imageType: imageType,
            imageViewType: imageViewType,
            iconName: iconName, 
            foregroundColor:   foregroundColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor,
            width: width,
            height: height,
            fontSize: fontSize
        )
    }
}
