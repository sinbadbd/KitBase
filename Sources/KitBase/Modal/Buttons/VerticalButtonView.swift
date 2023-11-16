//
//  VerticalButtonView.swift
//
//
//  Created by Imran on 4/10/23.
//

import SwiftUI

@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
struct VerticalButtonView: View {
    var buttonOneText: String
    var buttonTowText: String
    let action: (() -> Void)
    var onSubmit: (() -> Void)
    
    var body: some View {
        VStack {
            
            Button {
                onSubmit()
            } label: {
                Text(buttonTowText)
                    .font(.caption)
                    .bold()
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
                    .modifier(KitBaseButtonModifier(backgroundColor: .blue, hasCustomStyle: false))
            }
            
            Button {
                action()
            } label: {
                Text(buttonOneText)
                    .font(.caption)
                    .bold()
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity)
                    .modifier(KitBaseButtonModifier(backgroundColor: .clear, hasCustomStyle: true))
            }
        }
    }
}
@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
#Preview {
    VerticalButtonView(buttonOneText: "Cancle", buttonTowText: "Save") {
        
    } onSubmit: {
        
    }
}
