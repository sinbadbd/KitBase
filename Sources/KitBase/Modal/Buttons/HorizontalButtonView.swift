//
//  SwiftUIView.swift
//  
//
//  Created by Imran on 4/10/23.
//

import SwiftUI

@available(iOS 15.0, *)
struct HorizontalButtonView: View {
    
    var buttonOneText: String
    var buttonTowText: String
    var buttonBGColorOne: Color
    var buttonBGColorTwo: Color
    let action: (() -> Void)
    var onSubmit: (() -> Void)
    
    var body: some View {
        HStack {
            
            Button {
                action()
            } label: {
                Text(buttonOneText)
                    .font(.caption)
                    .bold()
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity)
                    .background(buttonBGColorOne)
                    // .modifier(KitBaseButtonModifier(backgroundColor: .clear, hasCustomStyle: true))
                  
            }
            
            Button {
                onSubmit()
            } label: {
                Text(buttonTowText)
                    .font(.caption)
                    .bold()
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
                    .background(buttonBGColorOne)
                    //.modifier(KitBaseButtonModifier(backgroundColor: .blue, hasCustomStyle: false))
            }
        }
    }
}

@available(iOS 15.0, *)
#Preview {
    HorizontalButtonView(buttonOneText: "dsf", buttonTowText: "J", buttonBGColorOne: .red, buttonBGColorTwo: .green) {
        
    } onSubmit: {
    
    }

}
