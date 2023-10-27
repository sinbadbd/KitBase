//
//  LoadingView.swift
//
//
//  Created by Imran on 27/10/23.
//

import SwiftUI
@available(iOS 15.0, *)
public struct LoadingView: View {
    public var progressColor: Color
    init(progressColor: Color) {
        self.progressColor = progressColor
    }
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            VStack {
                ProgressView()
                    .tint(progressColor)
                    .progressViewStyle(.circular)
                    .scaleEffect(x:2.5, y: 2.5)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
            }
        }
    }
}

@available(iOS 15.0, *)
#Preview {
    DemoLoadingView()
}

@available(iOS 15.0, *)
struct DemoLoadingView: View {
    @State private var isLoading = true
    var body: some View {
        ZStack{
            Color.black.opacity(0.4)
                .ignoresSafeArea()
            
            // Loading view
            if isLoading {
                LoadingView(progressColor: .green)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

