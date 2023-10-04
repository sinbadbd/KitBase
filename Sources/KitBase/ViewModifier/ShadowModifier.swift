//
//  ShadowModifier.swift

import SwiftUI
@available(iOS 15.0, *)

struct ShadowModifier: ViewModifier {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
    let opacity: Double

    func body(content: Content) -> some View {
        content
            .shadow(color: color.opacity(opacity), radius: radius, x: x, y: y)
    }
}
