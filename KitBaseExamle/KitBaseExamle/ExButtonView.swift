//
//  ExButtonView.swift
//  KitBaseExamle
//
//  Created by Imran on 29/12/23.
//

import SwiftUI
import KitBase

struct ExButtonView: View {
    var body: some View {
        VStack(spacing: 16) {
            
            
            Button("icon with button", action: {
                print("")
            })
            .buttonStyle(
                KitBaseButtonStyleBuilder()
                    .setBackgroundColor(.gray)
                    .setForegroundColor(.black)
                    .setButtonWidth(200)
                    .setButtonHeight(30)
                    .setIcon("square.and.arrow.up")
                    .setImage("ic_edit")
                    .setIconColor(.red)
                    .setIconColor(.red)
                    .setIconWidth(20)
                    .setIconHeight(20)
                    .setPaddingVertical(paddingVertical: 10)
                    .setPaddingHorizontal(paddingHorizontal: 16)
                    .build()
            )
        }
    }
}

#Preview {
    ExButtonView()
}
