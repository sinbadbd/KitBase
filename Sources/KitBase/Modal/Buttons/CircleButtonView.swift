//
//  SwiftUIView.swift
//
//
//  Created by Imran on 31/10/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct CircleButtonView: View {
    
    let iconName: String
    let foregroundColor: Color
    let backgroundColor: Color
    let borderColor: Color
    let width: CGFloat
    let height: CGFloat
    let fontSize: CGFloat
    
    public var body: some View {
        Image(systemName: iconName)
            .font(.system(size: fontSize))
            .foregroundColor(foregroundColor)
            .frame(width: width, height: height)
            .padding()
            .background(
                Circle()
                    .foregroundColor(backgroundColor)
            )
            .overlay{
                Circle()
                    .stroke(lineWidth: 1)
                    .foregroundColor(borderColor)
            }
        /*
         .shadow(color: Color.gray, radius: 2, x: 2, y: 2)
         .shadow(color: Color.white, radius: 2, x: -2, y: -2)
         */
    }
}

@available(iOS 15.0, *)
struct CircleButtonAnimationView: View {
    
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
    CircleButtonView(iconName: "info", foregroundColor: .red, backgroundColor: .gray, borderColor: .blue, width: 40, height: 40, fontSize: 24)
        .padding()
        .previewLayout(.fixed(width: 100, height: 100))
}
