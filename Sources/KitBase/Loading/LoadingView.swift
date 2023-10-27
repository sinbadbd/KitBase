//
//  LoadingView.swift
//
//
//  Created by Imran on 27/10/23.
//

import SwiftUI
@available(iOS 15.0, *)
public struct LoadingView: View {
    
    public var text: String
    public init(text: String) {
        self.text = text
    }
    public var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            VStack {
                ProgressView(text)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
            }
        }
    }
}

@available(iOS 15.0, *)
#Preview {
    LoadingView(text: "Loading...")
}
