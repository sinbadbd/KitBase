//
//  KitBaseButtonModifier.swift

import SwiftUI
@available(iOS 15.0, *)

public struct KitBaseButtonModifier: ViewModifier {
    
    let backgroundColor: Color
    let hasCustomStyle: Bool
    
    public func body(content: Content) -> some View {
        HStack {
            content
                .font(.caption)
                .padding(.vertical, 10)
                .padding(.horizontal, 24)
                .foregroundColor(.white)
                .background(
                    backgroundColor
                )
                .cornerRadius(8)
            //                .shadow(
            //                    color: hasCustomStyle ? Color.primaryDark : .clear,
            //                    radius: hasCustomStyle ? 2 : 0,  x: 0, y: hasCustomStyle ? 2 : 0
            //                )
        }
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .inset(by: 0.5)
                .stroke(Color.blue, lineWidth: 1)
        )
        .background(
            RoundedRectangle(cornerRadius: 4)
                .fill(hasCustomStyle ? .clear : Color.blue) // Background color on the right side
                .frame(maxWidth: .infinity)
        )
    }
}

@available(iOS 15.0, *)
extension View {
    public func buttonBackground(backgroundColor: Color = .blue, hasCustomStyle: Bool)-> some View{
        modifier(KitBaseButtonModifier(backgroundColor: backgroundColor, hasCustomStyle: hasCustomStyle))
    }
}
