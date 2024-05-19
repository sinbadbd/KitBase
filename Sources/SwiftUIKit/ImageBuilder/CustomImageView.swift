//
//  CustomImageView.swift

//
//  Created by Imran on 15/3/24.
//

import SwiftUI
import Kingfisher

public struct CustomImageView: View {
    private var imageURLString: String
    private var placeholderImage: String?
    private var imageWidth: CGFloat?
    private var imageHeight: CGFloat?
    private var placeholderWidth: CGFloat?
    private var placeholderHeight: CGFloat?
    private var contentMode: SwiftUI.ContentMode
    private var placeholderContentMode: SwiftUI.ContentMode
    
    // Public initializer
    public init(
        imageURLString: String,
        placeholderImage: String? = nil,
        imageWidth: CGFloat? = nil,
        imageHeight: CGFloat? = nil,
        placeholderWidth: CGFloat? = nil,
        placeholderHeight: CGFloat? = nil,
        contentMode: SwiftUI.ContentMode = .fit,
        placeholderContentMode: SwiftUI.ContentMode = .fit
    ) {
        self.imageURLString = imageURLString
        self.placeholderImage = placeholderImage
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.placeholderWidth = placeholderWidth
        self.placeholderHeight = placeholderHeight
        self.contentMode = contentMode
        self.placeholderContentMode = placeholderContentMode
    }
    
    public var body: some View {
        KFImage.url(URL(string: imageURLString))
            .resizable()
            .placeholder {
                if let placeholderImage = placeholderImage, !placeholderImage.isEmpty {
                    Image(placeholderImage)
                        .resizable()
                        .aspectRatio(contentMode: placeholderContentMode)
                        .frame(width: placeholderWidth, height: placeholderHeight)
                } else {
                    EmptyView()
                }
            }
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.25)
            .aspectRatio(contentMode: contentMode) // Apply the content mode here
            .frame(width: imageWidth, height: imageHeight)
    }
}


