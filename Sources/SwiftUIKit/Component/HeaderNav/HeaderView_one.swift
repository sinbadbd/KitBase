//
//  SwiftUIView.swift
//
//
//  Created by Imran on 5/5/24.
//

import SwiftUI

public struct HeaderView_one: View {
    
    var backButton: String?
    var title: String?
    var rightImageOne: String?
    var rightImageTwo: String?
    var onBack: (() -> Void)?
    var onRightOne: (() -> Void)?
    var onRightTwo: (() -> Void)?
    
    public init(
        backButton: String? = nil,
        title: String? = nil,
        rightImageOne: String? = nil,
        rightImageTwo: String? = nil,
        onBack: (() -> Void)?,
        onRightOne: (() -> Void)?,
        onRightTwo: (() -> Void)?) {
            self.backButton = backButton
            self.title = title
            self.rightImageOne = rightImageOne
            self.rightImageTwo = rightImageTwo
            self.onBack = onBack
            self.onRightOne = onRightOne
            self.onRightTwo = onRightTwo
        }
    
    public var body: some View {
        HStack{
            if let leftImage = backButton {
                Button {
                    onBack?()
                } label: {
                    Image(systemName: leftImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 16, height: 16)
                }
                
            }
            Spacer(minLength: 0)
            if let title = title {
                Text(title)
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            Spacer(minLength: 0)
            HStack(spacing:10){
                if let rightImageOne = rightImageOne {
                    Button {
                        onRightOne?()
                    } label: {
                        Image(systemName: rightImageOne)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 16, height: 16)
                    }
                    
                }
                if let rightImageTwo = rightImageTwo {
                    Button {
                        onRightTwo?()
                    } label: {
                        Image(systemName: rightImageTwo)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 16, height: 16)
                    }
                    
                }
            }
        }
    }
}
//
#Preview {
//    HeaderView_one(backButton: "chevron.backward", title: "The Mad gamer", rightImageOne: "pencil", rightImageTwo: "magnifyingglass")

    HeaderView_one(backButton: "chevron.backward", title: "The Nav Title", rightImageOne: "pencil", rightImageTwo: "magnifyingglass") {

    } onRightOne: {

    } onRightTwo: {

    }

}
