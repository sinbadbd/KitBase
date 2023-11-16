//
//  BackgroundShadowModifier.swift

import SwiftUI

@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
struct BackgroundShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 1, y: 1)
                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 1, y: -1)
                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: -1, y: -1)
                    .shadow(color: Color.white.opacity(0.1), radius: 2, x: -1, y: -1)
            )
    }
}

@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
extension View {
    func backgroundShadow() -> some View {
        modifier(BackgroundShadowModifier())
    }
}
