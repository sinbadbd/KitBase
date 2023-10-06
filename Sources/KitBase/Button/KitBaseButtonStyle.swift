//
//  SwiftUIView.swift
//
//
//  Created by Imran on 6/10/23.
//

import SwiftUI

enum ButtonSize{ case xs, sm, md, lg }
enum ButtonVariant { case solid, subtle, outline }

@available(iOS 15.0, *)


public struct KitBaseButtonStyle: ButtonStyle {
    let size: ButtonSize
    let variant: ButtonVariant
    let fontSize: CGFloat
    let backgroundColor: Color
    
    public func makeBody(configuration: Configuration) -> some View {
        let padding: EdgeInsets
        let foregroundColor: Color
        let borderWidth: CGFloat
        
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
            foregroundColor = .white
            borderWidth = 0
        case .subtle:
            foregroundColor = backgroundColor // Use background color for subtle
            borderWidth = 1
        case .outline:
            foregroundColor = backgroundColor // Use background color for outline
            borderWidth = 1
        }
        
        return Button(action: {}) {
            configuration.label
                .font(.system(size: fontSize, weight: .semibold))
                .foregroundColor(foregroundColor)
                .padding(padding)
                .background(backgroundColor)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(foregroundColor, lineWidth: borderWidth)
                )
        }
    }
}

//@available(iOS 15.0, *)
//#Preview {
//    KitBaseButtonStyle(size: .lg, variant: .outline) as! any View
//}
