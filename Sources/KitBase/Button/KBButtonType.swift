//
//  KBButtonCircleView.swift
//
//
//  Created by Imran on 31/10/23.
//

import SwiftUI

public enum ImageType: String{
    case icon, image
}
public enum ImageViewType{
    case circle, rectangle
}

//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@available(iOS 15.0, *)
public struct KBButtonType: View {
    public var imageType: ImageType = .image
    public var imageViewType: ImageViewType = .circle
    public let iconName: String
    public let foregroundColor: Color
    public let backgroundColor: Color
    public let borderColor: Color
    public let width: CGFloat
    public let height: CGFloat
    public let fontSize: CGFloat
    
    public init(imageType:ImageType,imageViewType:ImageViewType,iconName: String, foregroundColor: Color, backgroundColor: Color, borderColor: Color, width: CGFloat, height: CGFloat, fontSize: CGFloat) {
        self.imageType = imageType
        self.imageViewType = imageViewType
        self.iconName = iconName
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.width = width
        self.height = height
        self.fontSize = fontSize
    }
    
    public var body: some View {
        ZStack{
            if imageType == .image {
                if imageViewType == .circle {
                    Image(iconName)
                        .font(.system(size: fontSize))
                        .foregroundColor(foregroundColor)
                        .frame(width: width, height: height)
                        .padding()
                        .background(
                            Circle()
                                .foregroundColor(backgroundColor)
                        )
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 1)
                                .foregroundColor(borderColor)
                                .shadow(color: Color(red: 0.38, green: 0.38, blue: 0.44).opacity(0.16), radius: 2, x: 0, y: 2)
                        }
                } else {
                    Image(iconName)
                        .font(.system(size: fontSize))
                        .foregroundColor(foregroundColor)
                        .frame(width: width, height: height)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 4, style: .continuous)
                                .foregroundColor(backgroundColor)
                        )
                        .overlay {
                            RoundedRectangle(cornerRadius: 4, style: .continuous)
                                .stroke(lineWidth: 1)
                                .foregroundColor(borderColor)
                        }
                }
            } else {
                if imageViewType == .circle {
                    Image(systemName: iconName)
                        .font(.system(size: fontSize))
                        .foregroundColor(foregroundColor)
                        .frame(width: width, height: height)
                        .padding()
                        .background(
                            Circle()
                                .foregroundColor(backgroundColor)
                        )
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 1)
                                .foregroundColor(borderColor)
                        }
                } else {
                    Image(systemName: iconName)
                        .font(.system(size: fontSize))
                        .foregroundColor(foregroundColor)
                        .frame(width: width, height: height)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 4, style: .continuous)
                                .foregroundColor(backgroundColor)
                        )
                        .overlay {
                            RoundedRectangle(cornerRadius: 4, style: .continuous)
                                .stroke(lineWidth: 1)
                                .foregroundColor(borderColor)
                        }
                }
            }
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
    HStack{
        Button {
            
        } label: {
            KBButtonType(imageType: .icon, imageViewType: .circle, iconName: "plus", foregroundColor: .black, backgroundColor: .gray.opacity(0.2), borderColor: .gray.opacity(0.2), width: 40, height: 40, fontSize: 40)
        }
        Button {
            
        } label: {
            KBButtonType(imageType: .icon, imageViewType: .rectangle, iconName: "magnifyingglass",  foregroundColor: .black, backgroundColor: .gray.opacity(0.2), borderColor: .gray.opacity(0.2), width: 40, height: 40, fontSize: 40)
        }
        Button {
            
        } label: {
            KBButtonType(imageType: .icon, imageViewType: .circle, iconName: "ellipsis.message.fill",  foregroundColor: .black, backgroundColor: .gray.opacity(0.2), borderColor: .gray.opacity(0.2), width: 40, height: 4, fontSize: 40)
        }

    }
}
