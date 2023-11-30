//
//  CustomCardModifier.swift

import SwiftUI

//@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
struct CustomCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color(red: 0.38, green: 0.38, blue: 0.44).opacity(0.1), radius: 4, x: 1, y: -1)
            .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.84, green: 0.84, blue: 0.84), lineWidth: 1)
            )
    }
}

//@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
extension View {
    func customCardStyle() -> some View {
        self.modifier(CustomCardModifier())
    }
}

