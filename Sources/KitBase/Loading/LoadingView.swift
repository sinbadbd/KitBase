//
//  LoadingView.swift
//
//
//  Created by Imran on 27/10/23.
//

import SwiftUI

@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
public struct LoadingView: View {
    
    public var progressColor: Color
    
    public init(progressColor: Color) {
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
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(10)
            }
        }
    }
}

@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
#Preview {
    DemoLoadingView()
}

@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
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

