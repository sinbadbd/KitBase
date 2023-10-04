//
//  VerticalButtonView.swift
//
//
//  Created by Imran on 4/10/23.
//

import SwiftUI
@available(iOS 15.0, *)

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
                //                            .modifier(DtacButtonModifier(backgroundColor: .primaryDark, hasCustomStyle: false))
            }
            .frame(width: 100)
            
            Button {
                action()
            } label: {
                Text(buttonOneText)
                    .font(.caption)
                    .bold()
                    .foregroundColor(.blue)
                //                            .modifier(DtacButtonModifier(backgroundColor: .clear, hasCustomStyle: true))
            }
            .frame(width: 100)
    
        }
    }
}
@available(iOS 15.0, *)
#Preview {
    VerticalButtonView(buttonOneText: "Cancle", buttonTowText: "Save") {
    
    } onSubmit: {
        
    }
}
