//
//  CustomImageViewBuilder.swift
//
//  Created by Imran on 15/3/24.
//

import SwiftUI

public class CustomImageViewBuilder {
    private var imageURLString: String = ""
    private var placeholderImage: String?
    private var imageWidth: CGFloat?
    private var imageHeight: CGFloat?
    private var placeholderWidth: CGFloat?
    private var placeholderHeight: CGFloat?
    private var contentMode: SwiftUI.ContentMode = .fit
    private var placeholderContentMode: SwiftUI.ContentMode = .fit
    
    public init() {}
    
    public func setImageURLString(_ urlString: String) -> CustomImageViewBuilder {
        self.imageURLString = urlString
        return self
    }
    
    public func setPlaceholderImage(_ placeholderImage: String?) -> CustomImageViewBuilder {
        self.placeholderImage = placeholderImage
        return self
    }
    
    public func setImageWidth(_ width: CGFloat?) -> CustomImageViewBuilder {
        self.imageWidth = width
        return self
    }
    
    public func setImageHeight(_ height: CGFloat?) -> CustomImageViewBuilder {
        self.imageHeight = height
        return self
    }
    
    public func setPlaceholderWidth(_ width: CGFloat?) -> CustomImageViewBuilder {
        self.placeholderWidth = width
        return self
    }
    
    public func setPlaceholderHeight(_ height: CGFloat?) -> CustomImageViewBuilder {
        self.placeholderHeight = height
        return self
    }
    
    public func setContentMode(_ contentMode: SwiftUI.ContentMode) -> CustomImageViewBuilder {
        self.contentMode = contentMode
        return self
    }
    
    public func setPlaceholderContentMode(_ contentMode: SwiftUI.ContentMode) -> CustomImageViewBuilder {
        self.placeholderContentMode = contentMode
        return self
    }
    
    public func build() -> CustomImageView {
        return CustomImageView(
            imageURLString: imageURLString,
            placeholderImage: placeholderImage,
            imageWidth: imageWidth,
            imageHeight: imageHeight,
            placeholderWidth: placeholderWidth,
            placeholderHeight: placeholderHeight,
            contentMode: contentMode,
            placeholderContentMode: placeholderContentMode
        )
    }
}
